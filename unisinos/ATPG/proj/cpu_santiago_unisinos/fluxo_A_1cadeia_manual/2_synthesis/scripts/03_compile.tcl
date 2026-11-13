######################################################
## Synthesis
######################################################
# Síntese genérica (independente de tecnologia)
syn_generic
write_snapshot -outdir $REPORT_DIR -tag 1_generic
report_summary -directory $REPORT_DIR

# Mapeamento para células da biblioteca
syn_map
write_snapshot -outdir $REPORT_DIR -tag 2_mapped
report_summary -directory $REPORT_DIR
dft_checkpoint 1_mapped         ;# flops mapeados como flops comuns (DFFR*)

# DFT I: inserção da cadeia de scan
check_dft_rules > $REPORT_DIR/DFT_1_check_dft_rules.rpt
report_dft_violations > $REPORT_DIR/DFT_1_dft_violations.rpt
dft_checkpoint 2_rules          ;# flops classificados como pass/fail, ainda não-scan
convert_to_scan
dft_checkpoint 3_converted      ;# flops viraram SDFFR*, mas SI/SE ainda soltos
connect_scan_chains $TOP_MODULE_NAME -auto_create_chain
dft_checkpoint 4_connected      ;# cadeia ligada: scan_in -> FF -> ... -> scan_out

# Otimização incremental
syn_opt
write_snapshot -outdir $REPORT_DIR -tag 3_final
report_summary -directory $REPORT_DIR
dft_checkpoint 5_final          ;# depois da otimização incremental

######################################################
## Reports
######################################################
report_gates                     > $REPORT_DIR/3_final_gates.rpt
report_area                      > $REPORT_DIR/3_final_area.rpt
report_timing                    > $REPORT_DIR/3_final_timing.rpt
report_power                     > $REPORT_DIR/3_final_power.rpt
report_messages                  > $REPORT_DIR/3_final_messages.rpt
report_port [get_db ports .name] > $REPORT_DIR/3_final_ports.rpt

# DFT II
check_dft_rules       > $REPORT_DIR/DFT_2_check_dft_rules.rpt
report_scan_registers > $REPORT_DIR/DFT_scan_registers.rpt
report_scan_setup     > $REPORT_DIR/DFT_scan_setup.rpt
report_dft_violations > $REPORT_DIR/DFT_dft_violations.rpt
report_scan_chains    > $REPORT_DIR/DFT_scan_chains.rpt

######################################################
## Outputs
######################################################
write_hdl                    > $PRE_LAYOUT_DIR/$DESIGN.v
write_sdc -view worst_view   > $PRE_LAYOUT_DIR/$DESIGN.sdc
write_scandef                > $PRE_LAYOUT_DIR/$DESIGN.scandef

# referência para o Modus: pinassign e scripts gerados pelo Genus
if {[file exists $STD_VLOG]} {
    write_dft_atpg -library $STD_VLOG -directory $PRE_LAYOUT_DIR/modus_ref
} else {
    puts "WARNING: STD_VLOG não encontrado ($STD_VLOG) - write_dft_atpg pulado"
}

puts "============================"
puts "Synthesis Finished ........."
puts "============================"
