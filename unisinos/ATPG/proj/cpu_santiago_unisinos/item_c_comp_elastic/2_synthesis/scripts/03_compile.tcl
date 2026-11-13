######################################################
## 4. Síntese: generic -> map -> opt
######################################################
syn_generic
syn_map
syn_opt
write_snapshot -outdir $REPORT_DIR -tag 1_mapped
report_summary -directory $REPORT_DIR

######################################################
## 5. Fluxo de DFT
######################################################
# segunda checagem, já na netlist mapeada
check_dft_rules > $REPORT_DIR/DFT_1_check_dft_rules_mapped.rpt

# >>> TODO (item c): compressão elastic.
# >>> O bloco abaixo é o do fluxo B (uma cadeia). Substitua-o pelo
# >>> add_test_compression.
# >>> Dicas: igual ao item b, trocando o descompressor:
# >>>   - set_db dft_compression_decompressor_type elastic
# >>>   - add_test_compression SEM a opção -decompressor xor

# uma cadeia, com portas scan_in / scan_out criadas pelo Genus
set_db design:$TOP_MODULE_NAME .dft_min_number_of_scan_chains 1
define_scan_chain -name top_chain -sdi scan_in -sdo scan_out -create_ports

# liga Q -> SI de flop em flop e o scan_en em todos os SE
connect_scan_chains -auto_create_chains

# >>> fim do bloco a substituir

######################################################
## 6. Síntese incremental
######################################################
syn_opt   ;# no Genus 23.1 o -incremental foi removido (SYNTH-29); o syn_opt já é incremental aqui
write_snapshot -outdir $REPORT_DIR -tag 2_final
report_summary -directory $REPORT_DIR

######################################################
## DFT reports
######################################################
check_dft_rules       > $REPORT_DIR/DFT_2_check_dft_rules_final.rpt
report_scan_setup     > $REPORT_DIR/DFT_scan_setup.rpt
report_scan_registers > $REPORT_DIR/DFT_scan_registers.rpt
report_scan_chains    > $REPORT_DIR/DFT_scan_chains.rpt
report_dft_violations > $REPORT_DIR/DFT_dft_violations.rpt

######################################################
## Reports gerais
######################################################
report_gates     > $REPORT_DIR/2_final_gates.rpt
report_area      > $REPORT_DIR/2_final_area.rpt
report_timing    > $REPORT_DIR/2_final_timing.rpt
report_power     > $REPORT_DIR/2_final_power.rpt
report_qor       > $REPORT_DIR/2_final_qor.rpt

######################################################
## 7. Saídas (slide "Genus Synthesis with DFT: Inputs and Outputs")
######################################################
# DFT inserted netlist
write_hdl > $PRE_LAYOUT_DIR/$DESIGN.v

# SDCs
write_sdc -view worst_view > $PRE_LAYOUT_DIR/$DESIGN.sdc

# SDF (atrasos para simulação com timing; usado pelo run_fullscan_sim_sdf)
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge \
          -setuphold split > $PRE_LAYOUT_DIR/$DESIGN.sdf

# Scandef (ordem da cadeia; o Innovus usa para reordenar no place & route)
write_scandef > $PRE_LAYOUT_DIR/$DESIGN.scandef

# Scan abstract model / CTL (modelo do bloco para DFT hierárquico)
if {[catch {write_dft_abstract_model > $PRE_LAYOUT_DIR/$DESIGN.scan_abstract} err]} {
    puts "WARNING: write_dft_abstract_model falhou: $err"
}

# Modus setup: test_netlist, pinassign, runmodus.atpg.tcl, scripts de simulação
# >>> TODO (item c): com compressão, o write_dft_atpg precisa da opção
# >>> -compression (gera os arquivos dos dois modos: FULLSCAN e compressão).
write_dft_atpg -library $STD_VLOG -directory $PRE_LAYOUT_DIR/modus_ref

# banco de dados final (para abrir no GUI com read_db)
write_db $PRE_LAYOUT_DIR/$DESIGN.db

# UPF with DFT updates: não se aplica (o design não tem UPF)

puts "============================"
puts "Synthesis Finished ........."
puts "============================"
