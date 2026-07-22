########################################
# ICC2
########################################

file mkdir $REPORT_DIR

initialize_floorplan \
    -shape R \
    -orientation N \
    -side_length {700 700} \
    -core_offset 350

# pads collection
set all_pads   [get_cells * -filter "design_type==pad"]
set corner_ins [get_cells * -filter "ref_name==CORNER"]
set ring_pads  [remove_from_collection $all_pads $corner_ins]
#puts "total pads   : [sizeof_collection $all_pads]"
#puts "corners      : [sizeof_collection $corner_ins]"
#puts "ring (no cnr): [sizeof_collection $ring_pads]"
#72 / 4 / 68

# ring with 68 
create_io_ring -name outer_ring -pad_cell_list $ring_pads

# corners
set bb [get_attribute [current_block] boundary]
set dw 0; set dh 0
foreach pt $bb {
    if {[lindex $pt 0] > $dw} {set dw [lindex $pt 0]}
    if {[lindex $pt 1] > $dh} {set dh [lindex $pt 1]}
}
set cref [get_attribute [get_cells CORNER0] ref_name]
set cw [get_attribute [get_lib_cells */$cref] width]
set ch [get_attribute [get_lib_cells */$cref] height]

set_cell_location -coordinates [list 0             0            ] -orientation R0 -fixed [get_cells CORNER0] ;# BL
set_cell_location -coordinates [list [expr {$dw-$cw}] 0          ] -orientation R0 -fixed [get_cells CORNER1] ;# BR
set_cell_location -coordinates [list [expr {$dw-$cw}] [expr {$dh-$ch}]] -orientation R0 -fixed [get_cells CORNER2] ;# TR
set_cell_location -coordinates [list 0             [expr {$dh-$ch}]] -orientation R0 -fixed [get_cells CORNER3] ;# TL

# Check
#foreach c {CORNER0 CORNER1 CORNER2 CORNER3} {
#    puts "$c : placed=[get_attribute [get_cells $c] is_placed]  origin=[get_attribute [get_cells $c] origin]  orient=[get_attribute [get_cells $c] orientation]"
#}

place_io

start_gui
return
# Filler

# PG lógico
connect_pg_net -automatic

# power ring
create_pg_ring_pattern ring_pattern \
    -horizontal_layer M6 -horizontal_width 5 -horizontal_spacing 2 \
    -vertical_layer   M5 -vertical_width   5 -vertical_spacing   2 \
    -track_alignment auto

set_pg_strategy core_ring -core \
    -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {5 5}}}

compile_pg -strategies core_ring

# mesh over corer
create_pg_mesh_pattern mesh_pattern \
    -layers { \
        {{vertical_layer: M5}   {width: 2} {spacing: minimum} {pitch: 150}} \
        {{horizontal_layer: M6} {width: 2} {spacing: minimum} {pitch: 150}} }

set_pg_strategy core_mesh -core \
    -pattern {{name: mesh_pattern} {nets: {VDD VSS}}}

compile_pg -strategies core_mesh

# rail M1 of the standard cells
create_pg_std_cell_conn_pattern std_rail -layers {M1}

set_pg_strategy core_rail -core \
    -pattern {{name: std_rail} {nets: {VDD VSS}}}

compile_pg -strategies core_rail

# placement
create_placement -floorplan -effort high
legalize_placement

# reconnect PG
connect_pg_net -automatic
check_legality

# reports and save
report_utilization > $REPORT_DIR/fp_utilization.rpt
save_block -as ${TOP_MODULE_NAME}_floorplan
save_lib

###############################################
#ICC1
################################################
# #02a-floorplan
# # remove ideal networks
# remove_ideal_network [all_fanout -flat -clock_tree]

# # pads arrange
# source scripts/auto_iopad.tcl

# create_floorplan -left_io2core 40 -bottom_io2core 40 -right_io2core 40 -top_io2core 40 -start_first_row -flip_first_row

# adjust_fp_floorplan -die_height 1950 -die_width 1950

# # Try "PFILL*"
# insert_pad_filler -cell "PFILLH PFILLQ PFILL1"
# source ./scripts/fixpad.tcl
# create_pad_rings
# save_mw_cel -as ${TOP_MODULE_NAME}_fp_initial

# #02b-fp_placement
# # fp placement
# #create_fp_placement -timing_driven
# create_fp_placement -timing_driven -congestion_driven -effort high

# save_mw_cel -as ${TOP_MODULE_NAME}_fp_placement

# ##########################
# #02c-pf_powerplan
# ##########################
# # derive pg logical connection
# source -echo -verbose ./scripts/derive_pg.tcl

# # Peters's version
# create_rectilinear_rings -nets {VSS VDD} -offset {10 10} -width {10 10} -space {5 5} -layers {METAL5 METAL6}
 
# preroute_instances -select_net_by_type pg -primary_routing_layer specified -specified_horizontal_layer METAL5 -specified_vertical_layer {METAL6}

# preroute_instances -select_net_by_type pg_and_tieup_tiedown -primary_routing_layer specified -specified_horizontal_layer METAL5 -specified_vertical_layer METAL6 

# preroute_standard_cells -fill_empty_rows -remove_floating_pieces 

# set_fp_rail_constraints -add_layer -layer METAL5 -direction horizontal -max_strap 7 -max_width 5 -min_width 1 -spacing 1.2 -min_strap 1 

# set_fp_rail_constraints -add_layer -layer METAL6 -direction vertical -max_strap 7 -max_width 5 -min_width 1 -spacing 1.2 -min_strap 1

# set_fp_rail_constraints -skip_ring

# synthesize_fp_rail -nets {VDD VSS} -synthesize_power_plan -synthesize_power_pads -analyze_power -voltage_supply 1.64

# commit_fp_rail

# save_mw_cel -as ${TOP_MODULE_NAME}_fp_powerplan


# #02d-fp_routing
# # add tap cell
# #add_tap_cell_array -master_cell_name FILLTIE -distance 80 -offset 40 -pattern stagger_every_other_row -no_tap_cell_under_layers {Met5}

# # legalize fp placement after power route
# set_pnet_options -complete {METAL5 METAL6}
# legalize_fp_placement

# # fp prototype routing
# set_route_mode_options -zroute true
# set_route_zrt_global_options -timing_driven true

# route_zrt_global

# # report
# redirect -f $REPORT_DIR/floorplan_congestion.txt {report_congestion -grc_based -by_layer -routing_stage global}
# redirect -f $REPORT_DIR/floorplan_timing_max.txt {report_timing -max 10}
# redirect -f $REPORT_DIR/floorplan_timing_min.txt {report_timing -delay_type min -max 10}
# redirect -f $REPORT_DIR/floorplan_power.txt {report_power}
# redirect -f $REPORT_DIR/floorplan_qor.txt {report_qor}
# redirect -f $REPORT_DIR/floorplan_phy_design.txt {report_design -physical}
# redirect -f $REPORT_DIR/floorplan_constraint.txt {report_constraint -all}

# save_mw_cel -as ${TOP_MODULE_NAME}_fp_routing


# #02e_ipo

# # in-place optimization
# optimize_fp_timing -fix_design_rule
# route_zrt_global

# # report
# redirect -f $REPORT_DIR/fp_ipo_congestion.txt {report_congestion -grc_based -by_layer -routing_stage global}
# redirect -f $REPORT_DIR/fp_ipo_timing_max.txt {report_timing -max 10}
# redirect -f $REPORT_DIR/fp_ipo_timing_min.txt {report_timing -delay_type min -max 10}
# redirect -f $REPORT_DIR/fp_ipo_power.txt {report_power}
# redirect -f $REPORT_DIR/fp_ipo_qor.txt {report_qor}
# redirect -f $REPORT_DIR/fp_ipo_constraint.txt {report_constraint -all}

# save_mw_cel -as ${TOP_MODULE_NAME}_fp_ipo
