# optimize design
set_fix_hold [all_clocks]
set_fix_multiple_port_nets -all -buffer_constants
set verilogout_no_tri true

# dont_touch nos pads ANTES do compile (crítico!)
set_dont_touch [get_cells -hier -filter "is_hierarchical==false && \
    (ref_name=~*I1025* || ref_name=~*CORNER* || ref_name=~*VDD* || \
     ref_name=~*VSS* || ref_name=~*IOVDD* || ref_name=~*IOVSS*)"]

#compile_ultra -no_autoungroup -scan
compile_ultra -no_autoungroup

# DFT I
#create_test_protocol -infer_clock -infer_asynch
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
#compile_ultra -scan -incremental
compile_ultra -incremental

# DFT II
#dft_drc                                        > $REPORT_DIR/DFT_drc.rpt
#report_scan_path -view existing_dft -chain all > $REPORT_DIR/DFT_report_scan_path.rpt
#report_constraints -all_violators              > $REPORT_DIR/DFT_report_constraints.rpt
#write_scan_def -output                           $PRE_LAYOUT_DIR/$DESIGN.scandeff

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

#write_test_protocol -output $PRE_LAYOUT_DIR/$DESIGN.spf

# UM: Review later
# # optimize design
# set_fix_hold [all_clocks]
# set_fix_multiple_port_nets -all -buffer_constants
# set verilogout_no_tri true
# #Tell DC to preserve the register even if there 2 or more registers produce the same output
# set_register_merging [get_designs *] false
# #Tell DC to preserve register that has no fanout
# set_unloaded_register_removal  [all_registers] false
# sizeof_collection [all_registers ]
# compile_ultra -no_autoungroup 

# # generate reports
# redirect -file "$REPORT_DIR/dc_constraints_180nm.rpt" {report_constraints -all}
# redirect -file "$REPORT_DIR/dc_timing_max_180nm.rpt"  {report_timing -max 10}
# redirect -file "$REPORT_DIR/dc_timing_min_180nm.rpt"  {report_timing -delay min -max 10}
# redirect -file "$REPORT_DIR/dc_qor_180nm.rpt"         {report_qor}
# redirect -file "$REPORT_DIR/dc_power_180nm.rpt"       {report_power}

# # save design data
# change_names -rule verilog -hier
# write -f ddc -hier -out     "$PRE_LAYOUT_DIR/${TOP_MODULE_NAME}_mapped_180nm.ddc"
# write -f verilog -hier -out "$PRE_LAYOUT_DIR/${TOP_MODULE_NAME}_mapped_180nm.v"
# write_sdc                   "$PRE_LAYOUT_DIR/${TOP_MODULE_NAME}_mapped_180nm.sdc"

# sizeof_collection [all_registers]

# report_timing
# report_constraint
# report_area
# report_power
# report_qor
