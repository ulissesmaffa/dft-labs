#-----------------------------------------------------------------------------
# 0. Configuracao
#-----------------------------------------------------------------------------
source ../../_setup/setup.tcl

set DESIGN      top_santiago_cpu
set PRE_LAYOUT  ../../out_data/pre_layout
set OUT         ./out_data

set SPF         $PRE_LAYOUT/santiago_cpu_scancompress.spf
set NETLIST     $PRE_LAYOUT/santiago_cpu.v

set_messages -log $OUT/atpg_comp.log -replace -level expert

#-----------------------------------------------------------------------------
# 1. Leitura do netlist
#-----------------------------------------------------------------------------
# N5 = modulo redefinido. Default e' warning: a segunda definicao substitui a
# primeira em silencio. Elevar para error faz o fluxo parar na hora.
set_rules n5 error

read_netlist $STD_VERILOG_PATH_SETUP
read_netlist $IO_VERILOG_PATH_SETUP
read_netlist $NETLIST

#-----------------------------------------------------------------------------
# 2. Build do modelo ATPG
#-----------------------------------------------------------------------------
run_build_model $DESIGN

# O codec (SCCOMP_DECOMPRESSOR / SCCOMP_COMPRESSOR) e' logica sintetizada
# como qualquer outra e deve aparecer como STRUCT_VERILOG. Se aparecer em
# #unsupported_beh ou -undefined, o netlist do codec nao foi lido.
report_modules -summary                    > $OUT/comp_modules_summary.rpt
report_modules -errors                     > $OUT/comp_modules_errors.rpt
report_modules -undefined                  > $OUT/comp_modules_undefined.rpt
report_summaries Optimizations             > $OUT/comp_build_optimizations.rpt

#-----------------------------------------------------------------------------
# 3. DRC no modo comprimido
#-----------------------------------------------------------------------------
# -patternexec seleciona o modo dentro do SPF. Sem ele, a ferramenta usa o
# PatternExec default, que pode nao ser o comprimido.
#run_drc $SPF -patternexec ScanCompression_mode
run_drc $SPF

# O log ganha uma secao exclusiva do fluxo comprimido:
#
#   Begin compressor rules checking...
#   Compressor rules checking completed: #chains=16, #scanins=4,
#                                        #scanouts=4, #shifts=11
#
# #shifts e' a metrica central -- ciclos de shift por padrao.
# Comparar com o comprimento da cadeia no modo padrao.
#
# Fique atento a R11 (X on chain affects observe ability of other chains):
# com -xtolerance default, um X em uma cadeia pode mascarar a observacao das
# demais, porque 16 cadeias compartilham 4 saidas.

report_clocks                              > $OUT/comp_clocks.rpt
report_clocks -matrix                      > $OUT/comp_clocks_matrix.rpt
report_scan_chains                         > $OUT/comp_scan_chains.rpt
report_scan_cells -all                     > $OUT/comp_scan_cells.rpt
report_pi_constraints                      > $OUT/comp_pi_constraints.rpt

# Protocolo como o tmax o interpretou; diff contra o SPF do DC mostra o que
# a ferramenta inferiu sobre a estrutura do codec.
write_drc_file $OUT/comp_from_tmax.spf -replace

#-----------------------------------------------------------------------------
# 4. Configuracao de falhas -- fluxo com persistent fault models
#-----------------------------------------------------------------------------
set_faults -persistent_fault_models
set_faults -report uncollapsed
set_faults -summary verbose
set_faults -fault_coverage

# Popular OS DOIS modelos antes de qualquer run_atpg.
# Com pattern set interno presente, add_faults falha com M104.
set_faults -model stuck
add_faults -all
set_faults -model transition
add_faults -all

report_summaries Faults              > $OUT/comp_faults_pre_atpg.rpt

#-----------------------------------------------------------------------------
# 5a. ATPG de transition
#-----------------------------------------------------------------------------
# set_delay e' comando de modo DRC (erro M19 em TEST-T).
drc -force
set_delay -launch_cycle System_clock -common_launch_capture_clock -nopi_changes
run_drc $SPF

run_atpg -auto
report_summaries Faults              > $OUT/comp_faults_transition.rpt
write_patterns $OUT/santiago_comp_trans.stil -format stil -replace

#-----------------------------------------------------------------------------
# 5b. Direct credit + ATPG de stuck-at
#-----------------------------------------------------------------------------
set_faults -model stuck
update_faults -direct_credit
report_summaries Faults              > $OUT/comp_faults_after_credit.rpt

run_atpg -auto
