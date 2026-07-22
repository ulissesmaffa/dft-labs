# 05-route.tcl (ICC2)
file mkdir $REPORT_DIR

# pre-route checks
check_legality
check_pg_connectivity   ;# equivalente ao verify_pg_nets

# via redundante e opções de detail (app_options)
set_app_options -name route_opt.detail.optimize_wire_via -value true

# antena: em ICC2 é opção do route, hop_layers como no Lucas
set_app_options -name route.detail.antenna -value true

# --- initial route ---
route_auto
redirect -f $REPORT_DIR/initial_route_drc.txt {check_routes}
redirect -f $REPORT_DIR/initial_route_timing_max.txt {report_timing -max_paths 10}
redirect -f $REPORT_DIR/initial_route_qor.txt {report_qor}
save_block -as ${TOP_MODULE_NAME}_initial_route

# --- post route optimization ---
route_opt
redirect -f $REPORT_DIR/post_route_drc.txt {check_routes}
redirect -f $REPORT_DIR/post_route_timing_max.txt {report_timing -max_paths 10}
redirect -f $REPORT_DIR/post_route_timing_min.txt {report_timing -delay_type min -max_paths 10}
redirect -f $REPORT_DIR/post_route_qor.txt {report_qor}
save_block -as ${TOP_MODULE_NAME}_post_route

# --- incremental (hold) ---
# em ICC2 o hold fixing já vem do CCD no route_opt; incremento extra:
route_opt -from final_opto
redirect -f $REPORT_DIR/incr_route_timing_min.txt {report_timing -delay_type min -max_paths 10}
redirect -f $REPORT_DIR/incr_route_qor.txt {report_qor}
save_block -as ${TOP_MODULE_NAME}_route
save_lib

# # route clock signal
# route_zrt_group -all_clock_nets -reuse_existing_global_route true

# save_mw_cel -as ${TOP_MODULE_NAME}_clock_route

# # pre-signal route checking
# all_ideal_nets
# all_high_fanout -nets -threshold 50
# check_legality
# verify_pg_nets

# # zrt route setting
# set_route_mode_options -zroute true

# # UM: Error: The 'Via1_0_HV_F0' value specified for the '-from_via' option is invalid. (ZRT-476)
# # source /pdk/Silterra_ARM_SCDK/Silterra_CL110AL/Route_Tech_Kit/arm/silterra/cl110al/arm_tech/r0p1/milkyway/6LM_TOPMET/icc_route_options.tcl
# # UM: Solution 
# source ./scripts/icc_route_options_fixed.tcl

# # insert redundant via setting
# set_route_zrt_common_options -post_detail_route_redundant_via_insertion medium
# set_route_zrt_detail_options -optimize_wire_via_effort_level medium

# # UM: it is not working
# # fix antenna violation setting
# # source ./scripts/arm/antenna_rules.tcl

# # UM: to use this way - maybe change from ANTENNA2_A7TR to ANTENNA
# #set_route_zrt_detail_options -insert_diodes_during_routing true \
# # -antenna_fixing_preference use_diodes \
# # -diode_libcell_name "ANTENNA2_A7TR"

# # UM: like Lucas
# set_route_zrt_detail_options -insert_diodes_during_routing false \
#     -antenna_fixing_preference hop_layers \
#     -hop_layers_to_fix_antenna true

# #initial routing
# route_opt -initial_route_only

# source ./scripts/derive_pg.tcl

# # DRC & LVS
# verify_zrt_route
# verify_lvs

# #report
# redirect -f $REPORT_DIR/initial_route_opt_timing_max.txt {report_timing -max 10}
# redirect -f $REPORT_DIR/initial_route_opt_timing_min.txt {report_timing -delay_type min -max 10}
# redirect -f $REPORT_DIR/initial_route_opt_power.txt {report_power}
# redirect -f $REPORT_DIR/initial_route_opt_qor.txt {report_qor}
# redirect -f $REPORT_DIR/initial_route_opt_constraint.txt {report_constraint -all}

# save_mw_cel -as ${TOP_MODULE_NAME}_initial_route_opt


# #post routing
# route_opt -skip_initial_route -effort high

# # DRC & LVS
# verify_zrt_route
# verify_lvs

# #report
# redirect -f $REPORT_DIR/post_route_opt_timing_max.txt {report_timing -max 10}
# redirect -f $REPORT_DIR/post_route_opt_timing_min.txt {report_timing -delay_type min -max 10}
# redirect -f $REPORT_DIR/post_route_opt_power.txt {report_power}
# redirect -f $REPORT_DIR/post_route_opt_qor.txt {report_qor}
# redirect -f $REPORT_DIR/post_route_opt_constraint.txt {report_constraint -all}

# save_mw_cel -as ${TOP_MODULE_NAME}_post_route_opt

# #incremental post routing
# set_fix_hold [all_clocks]
# route_opt -incremental -only_hold_time

# # DRC & LVS
# verify_zrt_route
# verify_lvs

# #report
# redirect -f $REPORT_DIR/incremental_route_opt_timing_max.txt {report_timing -max 10}
# redirect -f $REPORT_DIR/incremental_route_opt_timing_min.txt {report_timing -delay_type min -max 10}
# redirect -f $REPORT_DIR/incremental_route_opt_power.txt {report_power}
# redirect -f $REPORT_DIR/incremental_route_opt_qor.txt {report_qor}
# redirect -f $REPORT_DIR/incremental_route_opt_constraint.txt {report_constraint -all}


# save_mw_cel -as ${TOP_MODULE_NAME}_incremental_route_opt

