##############################################################################
# run_atpg_compress.tcl -- TestMAX ATPG : santiago_cpu / SAED32
#                          modo ScanCompression_mode (DFTMAX)
#
# Uso:
#   tmax -shell -tcl -f scripts/run_atpg_compress.tcl   (a partir de atpg_flow/)
#
# Arquitetura inserida pelo DC:
#   Internal_scan          ->  4 cadeias x ~43 celulas
#   ScanCompression_mode   -> 16 cadeias x ~11 celulas  (codec 4->16 / 16->4)
#
# SPFs em out_data/pre_layout/:
#   santiago_cpu.spf              -> fluxo ANTIGO (cadeia unica, 173 celulas)
#                                    NAO corresponde ao netlist comprimido
#   santiago_cpu_scan.spf         -> Internal_scan        (fluxo novo)
#   santiago_cpu_scancompress.spf -> ScanCompression_mode (fluxo novo)
##############################################################################

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
# 4. Configuracao de falhas
#-----------------------------------------------------------------------------
set_faults -model stuck
set_faults -report uncollapsed      ;# contagem conservadora, sem colapso
set_faults -summary verbose         ;# abre as subclasses (DI, NC, NO, UR...)
set_faults -fault_coverage          ;# ANTES do run_atpg.
                                    ;# -fault_coverage e -atpg_effectiveness
                                    ;# sao mutuamente exclusivos.

add_faults -all

# Snapshot PRE-ATPG. Toda deteccao aqui e' DI (chain test); zero padroes.
# No modo comprimido o chain test cobre tambem a logica do codec.
report_summaries Faults                    > $OUT/comp_faults_pre_atpg.rpt

#-----------------------------------------------------------------------------
# 5. ATPG
#-----------------------------------------------------------------------------
# -auto gerencia a escalada de engines: basic-scan primeiro, fast-sequential
# para o residuo.
run_atpg -auto

#-----------------------------------------------------------------------------
# 6. Relatorios pos-ATPG
#-----------------------------------------------------------------------------
report_summaries Faults Patterns Primitives Sequential_depths Cpu_usage \
                                           > $OUT/comp_summaries.rpt

# Cobertura por bloco hierarquico.
report_faults -all -level {3 256}          > $OUT/comp_coverage_hier.rpt
report_faults -all -level {5 1}            > $OUT/comp_coverage_hier_deep.rpt

# Contagem colapsada, para comparacao.
set_faults -report collapsed
report_summaries Faults                    > $OUT/comp_faults_collapsed.rpt
set_faults -report uncollapsed

# Residuos. No fluxo comprimido, AU tende a crescer em relacao ao modo padrao:
# a compactacao das saidas reduz observabilidade.
report_faults -class UD                    > $OUT/comp_faults_UD.rpt
report_faults -class AU                    > $OUT/comp_faults_AU.rpt
report_faults -class ND                    > $OUT/comp_faults_ND.rpt

# Explicacao das AU agrupada por causa (constrain values, constrain value
# blockage, connected from TIEX).
analyze_faults -class AU -verbose -max 20  > $OUT/comp_faults_AU_analysis.rpt

report_patterns -all -internal             > $OUT/comp_patterns.rpt
report_settings                            > $OUT/comp_settings.rpt

#-----------------------------------------------------------------------------
# 7. Saidas
#-----------------------------------------------------------------------------
write_patterns $OUT/santiago_comp.stil -format stil -replace
write_patterns $OUT/santiago_comp.bin  -replace
write_faults   $OUT/santiago_comp.faults -all -replace

# Image pos-ATPG: ponto de partida reproduzivel para experimentos.
# Restaurar com read_image apenas -- sem read_netlist / run_build_model /
# run_drc, que seriam descartados (M41).
write_image $OUT/santiago_comp.image.gz -compress gzip -replace -violations

exit
