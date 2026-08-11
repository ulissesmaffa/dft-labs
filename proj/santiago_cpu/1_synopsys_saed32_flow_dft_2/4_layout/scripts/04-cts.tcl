# 04-cts.tcl (ICC2)

file mkdir $REPORT_DIR

check_clock_tree

remove_clock_uncertainty [all_clocks]

clock_opt

redirect -f $REPORT_DIR/cts_timing_max.txt {report_timing -max_paths 10}
redirect -f $REPORT_DIR/cts_timing_min.txt {report_timing -delay_type min -max_paths 10}
redirect -f $REPORT_DIR/cts_clock_qor.txt  {report_clock_qor}
redirect -f $REPORT_DIR/cts_qor.txt        {report_qor}

save_block -as ${TOP_MODULE_NAME}_cts
save_lib


# # Clock Tree Synthesis
# check_physical_design -stage pre_clock_opt -display
# set_delay_calculation_options -routed_clock arnoldi
# check_clock_tree

# remove_clock_uncertainty [all_clocks]
# #clock_opt -only_cts -no_clock_route

# clock_opt -only_cts
# save_mw_cel -as ${TOP_MODULE_NAME}_clock_opt_cts

# # Incremental CTS
# set_fix_hold [all_clocks]
# #set_max_area 0

# extract_rc
# #clock_opt -only_psyn -area_recovery -no_clock_route

# clock_opt -only_psyn -area_recovery 

# clock_opt -incremental_concurrent_clock_and_data

# save_mw_cel -as ${TOP_MODULE_NAME}_clock_opt_psyn
