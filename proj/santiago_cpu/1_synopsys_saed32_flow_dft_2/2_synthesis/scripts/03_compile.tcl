for {set i 0} {$i < 4} {incr i} {
  create_port -direction in  test_si[$i]
  create_port -direction out test_so[$i]
}
create_port -direction in test_se
create_port -direction in test_mode

set_dft_signal -view spec -type ScanDataIn  -port test_si*
set_dft_signal -view spec -type ScanDataOut -port test_so*
set_dft_signal -view spec -type ScanEnable  -port test_se
set_dft_signal -view spec -type TestMode    -port test_mode

set_dft_signal -view existing_dft -type ScanClock -port clk -timing {45 55}
set_dft_signal -view existing_dft -type Reset -port rst -active_state 1

set_scan_configuration -chain_count 4
compile_ultra -no_autoungroup -scan

set_dft_configuration -scan_compression enable
set_scan_compression_configuration -chain_count 16

create_test_protocol
dft_drc
preview_dft
insert_dft

#set_dft_signal -view existing_dft -type ScanDataIn  -port test_si
#set_dft_signal -view existing_dft -type ScanDataOut -port test_so
#set_dft_signal -view existing_dft -type ScanEnable  -port test_se
#set_dft_signal -view existing_dft -type ScanClock   -port clk -timing {45 55}

#set_scan_configuration -chain_count 1
#compile_ultra -no_autoungroup -scan

# --- compressão ---
#set_dft_configuration -scan_compression enable
#set_scan_compression_configuration -chain_count 8 -inputs 1 -outputs 1

# DFT I
#create_test_protocol
#dft_drc
#preview_dft
#insert_dft

# Reports pós compile
report_timing                     > $REPORT_DIR/2_post_compile_timing.rpt
report_qor                        > $REPORT_DIR/2_post_compile_qor.rpt
report_constraints -all_violators > $REPORT_DIR/2_post_compile_constraints.rpt
report_power       -verbose       > $REPORT_DIR/2_post_compile_power.rpt
check_design                      > $REPORT_DIR/2_post_compile_check_design.rpt

# Opt
compile_ultra -scan -incremental

# DFT II
dft_drc                                        > $REPORT_DIR/DFT_drc.rpt
report_scan_path -view existing_dft -chain all > $REPORT_DIR/DFT_report_scan_path.rpt
report_constraints -all_violators              > $REPORT_DIR/DFT_report_constraints.rpt
write_scan_def -output                           $PRE_LAYOUT_DIR/$DESIGN.scandeff

# Reports pós incremental
report_timing                     > $REPORT_DIR/3_inc_compile_timing.rpt
report_qor                        > $REPORT_DIR/3_inc_compile_qor.rpt
report_constraints -all_violators > $REPORT_DIR/3_inc_compile_constraints.rpt
report_power       -verbose       > $REPORT_DIR/3_inc_compile_power.rpt
check_design                      > $REPORT_DIR/3_inc_compile_check_design.rpt

# Datapath analysis
analyze_datapath_extraction       > $REPORT_DIR/3_inc_compile_datapath_extraction.rpt

report_port                       > $REPORT_DIR/3_report_port.rpt

######################################################
## Outputs
######################################################
change_names -rule verilog -hier

write_sdc  $PRE_LAYOUT_DIR/$DESIGN.sdc
write_file -format ddc     -hier -out $PRE_LAYOUT_DIR/$DESIGN.ddc
write_file -format verilog -hier -out $PRE_LAYOUT_DIR/$DESIGN.v

write_test_protocol -output $PRE_LAYOUT_DIR/$DESIGN.spf

write_test_protocol -output $PRE_LAYOUT_DIR/${DESIGN}_scan.spf         -test_mode Internal_scan
write_test_protocol -output $PRE_LAYOUT_DIR/${DESIGN}_scancompress.spf -test_mode ScanCompression_mode
