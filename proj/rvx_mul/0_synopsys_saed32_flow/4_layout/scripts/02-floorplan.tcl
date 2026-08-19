file mkdir $REPORT_DIR

#########################
# 02a-floorplan
#########################
initialize_floorplan -control_type die \
    -boundary {{0 0} {1950 1950}} \
    -core_offset 350

source ../scripts/auto_iopad.tcl

set_attribute [get_lib_cells saed32io_wb_5v/FILLER*] reference_orientation R90
create_io_filler_cells -reference_cells $PAD_FILLER

check_io_placement -overlap all
check_io_placement -gap

set_fixed_objects [get_cells {CORNER* PAD_* VDD_* VSS_* IOVDD_* IOVSS_*}]
save_block -as ${TOP_MODULE_NAME}_fp

#########################
#
#########################

# pre power ring UPF

load_upf ../scripts/power.upf
commit_upf

connect_supply_net VSSIO -ports [get_pins */VSSIO]
connect_supply_net VSS -ports [get_pins */VSS]
connect_supply_net VDDIO -ports [get_pins */VDDIO]
connect_supply_net VDD -ports [get_pins */VDD]

connect_pg_net -automatic

# power ring
create_pg_ring_pattern ring_pattern \
    -horizontal_layer M9 -horizontal_width 5 -horizontal_spacing 2 \
    -vertical_layer   M8 -vertical_width   5 -vertical_spacing   2

set_pg_strategy core_ring -core \
    -pattern {{pattern: ring_pattern}{nets: {VSS VDD}}}

compile_pg -strategies core_ring

# Trunks
disconnect_net */*IOPAD

create_trunk_pin_to_trunk -nets {VDD VSS} -adjust_to_pin -of_cells {VSS_* VDD_*}
create_trunk_pin_to_trunk -nets {VDD VSS} -adjust_to_pin -of_cells {VSS_* VDD_*} -direction H -layer M9




















#########################
# 02b-power_intent (UPF)
#########################
create_power_domain main_domain -include_scope

foreach net {VDD VSS VDDIO VSSIO} {
    create_supply_net  -domain main_domain $net
    create_supply_port -domain main_domain -direction in $net
    connect_supply_net -ports $net $net
}

set_domain_supply_net -primary_power_net VDD -primary_ground_net VSS main_domain
commit_upf

connect_pg_net -automatic

#connect_pg_net -net [get_nets VDD] [get_pins -hierarchical -filter "name==VDD"]
#connect_pg_net -net [get_nets VSS] [get_pins -hierarchical -filter "name==VSS"]
#connect_pg_net -net [get_nets VDDIO] [get_pins -hierarchical -filter "name==VDDIO"]
#connect_pg_net -net [get_nets VSSIO] [get_pins -hierarchical -filter "name==VSSIO"]

# VERIFICACAO: os quatro devem apontar para nets distintos
#foreach p {VDD VSS VDDIO VSSIO} {
#    puts "PAD_CLK/$p -> [get_object_name [get_nets -of_objects [get_pins PAD_CLK/$p]]]"
#}

#########################
# 02c-placement
#########################
create_placement -floorplan -effort high
legalize_placement
check_legality
report_placement -wirelength all -verbose high
save_block -as ${TOP_MODULE_NAME}_placement

#########################
# 02d-powerplan
#########################
# Ring M9(h) / M8(v)
create_pg_ring_pattern ring_pattern \
    -horizontal_layer M9 -horizontal_width 5 -horizontal_spacing 2 \
    -vertical_layer   M8 -vertical_width   5 -vertical_spacing   2

set_pg_strategy core_ring -core \
    -pattern {{pattern: ring_pattern}{nets: {VSS VDD}}}

# Mesh em escada M2..M7 com via entre camadas adjacentes.
# Sem os degraus, a via de M1 ate M6 nao fecha (18326 descartadas como dangling).
create_pg_mesh_pattern pg_mesh -layers { \
    {{vertical_layer:   M2} {width: 0.2} {spacing: minimum} {pitch: 10} {trim: true}} \
    {{horizontal_layer: M3} {width: 0.2} {spacing: minimum} {pitch: 10} {trim: true}} \
    {{vertical_layer:   M4} {width: 0.5} {spacing: minimum} {pitch: 25} {trim: true}} \
    {{horizontal_layer: M5} {width: 0.5} {spacing: minimum} {pitch: 25} {trim: true}} \
    {{vertical_layer:   M6} {width: 1}   {spacing: minimum} {pitch: 50} {trim: true}} \
    {{horizontal_layer: M7} {width: 1}   {spacing: minimum} {pitch: 50} {trim: true}} } \
    -via_rule { \
        {{layers: M2} {layers: M3} {via_master: default}} \
        {{layers: M3} {layers: M4} {via_master: default}} \
        {{layers: M4} {layers: M5} {via_master: default}} \
        {{layers: M5} {layers: M6} {via_master: default}} \
        {{layers: M6} {layers: M7} {via_master: default}} }

# -extension: e' isto que faz a mesh alcancar o ring
set_pg_strategy pg_mesh_strat -core \
    -pattern {{pattern: pg_mesh}{nets: {VSS VDD}}} \
    -extension {{stop: outermost_ring}}

# Rail M1
create_pg_std_cell_conn_pattern std_rail -layers {M1}

set_pg_strategy pg_rail_strat -core \
    -pattern {{pattern: std_rail}{nets: {VSS VDD}}}

# UM compile_pg para TODAS as estrategias. Compiladas isoladamente,
# as vias entre elas sao criadas e depois descartadas como dangling.
set_app_options -name plan.pgroute.ignore_signal_route -value true
compile_pg

check_pg_connectivity

#########################
create_pg_vias -nets {VDD VSS} -from_layers M1 -to_layers M6
connect_pg_net -automatic
check_pg_connectivity

connect_pg_net -net [get_nets VDDIO] [get_pins -hierarchical -filter "name==VDDIO"]
connect_pg_net -net [get_nets VSSIO] [get_pins -hierarchical -filter "name==VSSIO"]
foreach c {VDD_0 IOVDD_0 PAD_CLK} {
    foreach p {VDD VSS VDDIO VSSIO} {
        puts "$c/$p -> [get_object_name [get_nets -of_objects [get_pins -quiet $c/$p]]]"
    }
}

connect_pg_net -automatic

connect_pg_net -net [get_nets VDDIO] [get_pins -hierarchical -filter "name==VDDIO"]
connect_pg_net -net [get_nets VSSIO] [get_pins -hierarchical -filter "name==VSSIO"]

foreach c {VDD_0 IOVDD_0 PAD_CLK} {
    foreach p {VDD VSS VDDIO VSSIO} {
        puts "$c/$p -> [get_object_name [get_nets -of_objects [get_pins -quiet $c/$p]]]"
    }
}

#########################
# 02e-pad_rings + trunks
#########################
create_pad_rings -create all -route_pins_on_layer {M4 M5}

# Uma chamada por net: com dois nets juntos, os pads de ground acabam
# ligados ao net de power.
# -avoid_obstructions: sem ele, o segundo net desiste quando o primeiro
# ja ocupou o track (LED-041).
disconnect_net */*IOPAD

create_trunk_pin_to_trunk -nets {VDD VSS} -adjust_to_pin -of_cells {VSS_* VDD_*}
create_trunk_pin_to_trunk -nets {VDD VSS} -adjust_to_pin -of_cells {VSS_* VDD_*} -direction H -layer M9

#create_trunk_pin_to_trunk -nets {VDD}   -adjust_to_pin -avoid_obstructions -of_cells [get_cells {VDD_*}]
#create_trunk_pin_to_trunk -nets {VSS}   -adjust_to_pin -avoid_obstructions -of_cells [get_cells {VSS_*}]
#create_trunk_pin_to_trunk -nets {VDDIO} -adjust_to_pin -avoid_obstructions -of_cells [get_cells {IOVDD_*}]
#create_trunk_pin_to_trunk -nets {VSSIO} -adjust_to_pin -avoid_obstructions -of_cells [get_cells {IOVSS_*}]

#########################
# 02f-checks
#########################
check_pg_connectivity
check_pg_drc -ignore_std_cells

save_block -as ${TOP_MODULE_NAME}_powerplan
save_lib


# ------------------------------------------------------------------------------
# 4. PG lógico — liga nets VDD/VSS/VDDIO/VSSIO aos pinos
# ------------------------------------------------------------------------------
#connect_pg_net -automatic

# # ------------------------------------------------------------------------------
# # 5. Power ring do core (VDD/VSS em M5/M6)
# # ------------------------------------------------------------------------------
# create_pg_ring_pattern ring_pattern \
#     -horizontal_layer M6 -horizontal_width 5 -horizontal_spacing 2 \
#     -vertical_layer   M5 -vertical_width   5 -vertical_spacing   2 \
#     -track_alignment auto
# set_pg_strategy core_ring -core \
#     -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {5 5}}}
# compile_pg -strategies core_ring

# # ------------------------------------------------------------------------------
# # 6. Mesh de power sobre o core (M5/M6)
# # ------------------------------------------------------------------------------
# create_pg_mesh_pattern mesh_pattern -layers { \
#     {{vertical_layer: M5}   {width: 2} {spacing: minimum} {pitch: 150}} \
#     {{horizontal_layer: M6} {width: 2} {spacing: minimum} {pitch: 150}} }
# set_pg_strategy core_mesh -core \
#     -pattern {{name: mesh_pattern} {nets: {VDD VSS}}}
# compile_pg -strategies core_mesh

#create_pg_mesh_pattern mesh_pattern -layers { \
#    {{horizontal_layer: M5} {width: 1} {spacing: interleaving} {pitch: 90}} \
#    {{vertical_layer:   M6} {width: 1} {spacing: interleaving} {pitch: 90}} }

#set_pg_strategy mesh_strategy -core \
#    -pattern {{name: mesh_pattern} {nets: {VDD VSS}}}

#compile_pg -strategies mesh_strategy

# # ------------------------------------------------------------------------------
# # 7. Placement dos standard cells (ANTES do rail)
# # ------------------------------------------------------------------------------
# create_placement -floorplan -effort high
# legalize_placement

# # ------------------------------------------------------------------------------
# # 8. Rail M1 dos standard cells
# # ------------------------------------------------------------------------------
# create_pg_std_cell_conn_pattern std_rail -layers {M1}
# set_pg_strategy core_rail -core \
#     -pattern {{name: std_rail} {nets: {VDD VSS}}}
# compile_pg -strategies core_rail

# # ------------------------------------------------------------------------------
# # 9. Vias forçados: conecta rail (M1) até a mesh (M6), empilhando pelas camadas
# # ------------------------------------------------------------------------------
# create_pg_vias -nets {VDD VSS} -from_layers M1 -to_layers M6

# # ------------------------------------------------------------------------------
# # 10. Reconecta PG e checa
# # ------------------------------------------------------------------------------
# connect_pg_net -automatic
# check_legality

# # ------------------------------------------------------------------------------
# # 11. Reports e save
# # ------------------------------------------------------------------------------
# report_utilization           > $REPORT_DIR/fp_utilization.rpt
# check_pg_drc                 > $REPORT_DIR/fp_pg_drc.rpt
# check_pg_connectivity        > $REPORT_DIR/fp_pg_connectivity.rpt

# save_block -as ${TOP_MODULE_NAME}_floorplan
# save_lib


###########################################################################################
# TO REVIEW!
###########################################################################################
# file mkdir $REPORT_DIR

# # ------------------------------------------------------------------------------
# # 1. Inicializa floorplan — die fixo 1950x1950, core_offset = 300 (pad) + 50
# # ------------------------------------------------------------------------------
# initialize_floorplan -boundary {{0 0} {1950 1950}} -core_offset 350

# # ------------------------------------------------------------------------------
# # 2. Posiciona os pads no anel (cria io_ring + place_io)
# # ------------------------------------------------------------------------------
# source ../scripts/auto_iopad.tcl


# set_attribute FILLER* reference_orientation R90
# create_io_filler_cells -reference_cells $PAD_FILLER

# # check_io_placement -overlap all
# # check_io_placement -gap

# # ------------------------------------------------------------------------------
# # 4. PG lógico — liga nets VDD/VSS/VDDIO/VSSIO aos pinos
# # ------------------------------------------------------------------------------
# connect_pg_net -automatic

# # ------------------------------------------------------------------------------
# # 5. Power ring do core
# # ------------------------------------------------------------------------------
# create_pg_ring_pattern ring_pattern \
#     -horizontal_layer M6 -horizontal_width 5 -horizontal_spacing 2 \
#     -vertical_layer   M5 -vertical_width   5 -vertical_spacing   2 \
#     -track_alignment auto
# set_pg_strategy core_ring -core \
#     -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {5 5}}}
# compile_pg -strategies core_ring

# # ------------------------------------------------------------------------------
# # 6. Mesh de power sobre o core
# # ------------------------------------------------------------------------------
# create_pg_mesh_pattern mesh_pattern -layers { \
#     {{vertical_layer: M5}   {width: 2} {spacing: minimum} {pitch: 150}} \
#     {{horizontal_layer: M6} {width: 2} {spacing: minimum} {pitch: 150}} }
# set_pg_strategy core_mesh -core \
#     -pattern {{name: mesh_pattern} {nets: {VDD VSS}}}
# compile_pg -strategies core_mesh

# # ------------------------------------------------------------------------------
# # 7. Placement dos standard cells (ANTES do rail)
# # ------------------------------------------------------------------------------
# create_placement -floorplan -effort high
# legalize_placement

# # ------------------------------------------------------------------------------
# # 8. Rail M1 dos standard cells + via rule pra conectar na mesh
# # ------------------------------------------------------------------------------
# create_pg_std_cell_conn_pattern std_rail -layers {M1}
# set_pg_strategy core_rail -core \
#     -pattern {{name: std_rail} {nets: {VDD VSS}}}

# # Via rule: conecta os rails (core_rail) às straps existentes (mesh/ring)
# set_pg_strategy_via_rule core_rail_via -via_rule {
#     {{{existing: strap}} {strategies: core_rail} {via_master: default}}
#     {{intersection: undefined} {via_master: nil}}
# }

# compile_pg -strategies core_rail -via_rule core_rail_via

# # ------------------------------------------------------------------------------
# # 9. Reconecta PG e checa
# # ------------------------------------------------------------------------------
# connect_pg_net -automatic
# check_legality




# ########################################
# # ICC2
# ########################################

# file mkdir $REPORT_DIR

# initialize_floorplan \
#     -shape R \
#     -orientation N \
#     -core_offset 350 \
#     -honor_pad_limit 

# create_io_ring -name io_ring
# #create_io_ring -name io_ring -pad_cell_list [get_cells * -filter design_type==pad]

# place_io

# set_attribute FILLER* reference_orientation R90
# #create_io_filler_cells -reference_cells {FILLER1 FILLER01}

# # pads collection
# #set all_pads   [get_cells * -filter "design_type==pad"]
# #set corner_ins [get_cells * -filter "ref_name==CORNER"]
# #set ring_pads  [remove_from_collection $all_pads $corner_ins]
# #puts "total pads   : [sizeof_collection $all_pads]"
# #puts "corners      : [sizeof_collection $corner_ins]"
# #puts "ring (no cnr): [sizeof_collection $ring_pads]"
# #72 / 4 / 68

# # ring with 68 
# #create_io_ring -name outer_ring -pad_cell_list $ring_pads

# # corners
# #set bb [get_attribute [current_block] boundary]
# #set dw 0; set dh 0
# #foreach pt $bb {
# #    if {[lindex $pt 0] > $dw} {set dw [lindex $pt 0]}
# #    if {[lindex $pt 1] > $dh} {set dh [lindex $pt 1]}
# #}
# #set cref [get_attribute [get_cells CORNER0] ref_name]
# #set cw [get_attribute [get_lib_cells */$cref] width]
# #set ch [get_attribute [get_lib_cells */$cref] height]

# #set_cell_location -coordinates [list 0             0            ] -orientation R0 -fixed [get_cells CORNER0] ;# BL
# #set_cell_location -coordinates [list [expr {$dw-$cw}] 0          ] -orientation R0 -fixed [get_cells CORNER1] ;# BR
# #set_cell_location -coordinates [list [expr {$dw-$cw}] [expr {$dh-$ch}]] -orientation R0 -fixed [get_cells CORNER2] ;# TR
# #set_cell_location -coordinates [list 0             [expr {$dh-$ch}]] -orientation R0 -fixed [get_cells CORNER3] ;# TL

# # Check
# #foreach c {CORNER0 CORNER1 CORNER2 CORNER3} {
# #    puts "$c : placed=[get_attribute [get_cells $c] is_placed]  origin=[get_attribute [get_cells $c] origin]  orient=[get_attribute [get_cells $c] orientation]"
# #}

# #place_io

# #start_gui
# #return
# # Filler

# # PG lógico
# connect_pg_net -automatic

# # power ring
# create_pg_ring_pattern ring_pattern \
#     -horizontal_layer M6 -horizontal_width 5 -horizontal_spacing 2 \
#     -vertical_layer   M5 -vertical_width   5 -vertical_spacing   2 \
#     -track_alignment auto

# set_pg_strategy core_ring -core \
#     -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {5 5}}}

# compile_pg -strategies core_ring

# # mesh over corer
# create_pg_mesh_pattern mesh_pattern \
#     -layers { \
#         {{vertical_layer: M5}   {width: 2} {spacing: minimum} {pitch: 150}} \
#         {{horizontal_layer: M6} {width: 2} {spacing: minimum} {pitch: 150}} }

# set_pg_strategy core_mesh -core \
#     -pattern {{name: mesh_pattern} {nets: {VDD VSS}}}

# compile_pg -strategies core_mesh

# # rail M1 of the standard cells
# create_pg_std_cell_conn_pattern std_rail -layers {M1}

# set_pg_strategy core_rail -core \
#     -pattern {{name: std_rail} {nets: {VDD VSS}}}

# compile_pg -strategies core_rail

# # trucks
# create_trunk_pin_to_trunk -nets {VDD VSS}

# # placement
# create_placement -floorplan -effort high
# legalize_placement

# # reconnect PG
# connect_pg_net -automatic
# check_legality

# # reports and save
# report_utilization > $REPORT_DIR/fp_utilization.rpt
# save_block -as ${TOP_MODULE_NAME}_floorplan
# save_lib

# ###############################################
# #ICC1
# ################################################
# # #02a-floorplan
# # # remove ideal networks
# # remove_ideal_network [all_fanout -flat -clock_tree]

# # # pads arrange
# # source scripts/auto_iopad.tcl

# # create_floorplan -left_io2core 40 -bottom_io2core 40 -right_io2core 40 -top_io2core 40 -start_first_row -flip_first_row

# # adjust_fp_floorplan -die_height 1950 -die_width 1950

# # # Try "PFILL*"
# # insert_pad_filler -cell "PFILLH PFILLQ PFILL1"
# # source ./scripts/fixpad.tcl
# # create_pad_rings
# # save_mw_cel -as ${TOP_MODULE_NAME}_fp_initial

# # #02b-fp_placement
# # # fp placement
# # #create_fp_placement -timing_driven
# # create_fp_placement -timing_driven -congestion_driven -effort high

# # save_mw_cel -as ${TOP_MODULE_NAME}_fp_placement

# # ##########################
# # #02c-pf_powerplan
# # ##########################
# # # derive pg logical connection
# # source -echo -verbose ./scripts/derive_pg.tcl

# # # Peters's version
# # create_rectilinear_rings -nets {VSS VDD} -offset {10 10} -width {10 10} -space {5 5} -layers {METAL5 METAL6}
 
# # preroute_instances -select_net_by_type pg -primary_routing_layer specified -specified_horizontal_layer METAL5 -specified_vertical_layer {METAL6}

# # preroute_instances -select_net_by_type pg_and_tieup_tiedown -primary_routing_layer specified -specified_horizontal_layer METAL5 -specified_vertical_layer METAL6 

# # preroute_standard_cells -fill_empty_rows -remove_floating_pieces 

# # set_fp_rail_constraints -add_layer -layer METAL5 -direction horizontal -max_strap 7 -max_width 5 -min_width 1 -spacing 1.2 -min_strap 1 

# # set_fp_rail_constraints -add_layer -layer METAL6 -direction vertical -max_strap 7 -max_width 5 -min_width 1 -spacing 1.2 -min_strap 1

# # set_fp_rail_constraints -skip_ring

# # synthesize_fp_rail -nets {VDD VSS} -synthesize_power_plan -synthesize_power_pads -analyze_power -voltage_supply 1.64

# # commit_fp_rail

# # save_mw_cel -as ${TOP_MODULE_NAME}_fp_powerplan


# # #02d-fp_routing
# # # add tap cell
# # #add_tap_cell_array -master_cell_name FILLTIE -distance 80 -offset 40 -pattern stagger_every_other_row -no_tap_cell_under_layers {Met5}

# # # legalize fp placement after power route
# # set_pnet_options -complete {METAL5 METAL6}
# # legalize_fp_placement

# # # fp prototype routing
# # set_route_mode_options -zroute true
# # set_route_zrt_global_options -timing_driven true

# # route_zrt_global

# # # report
# # redirect -f $REPORT_DIR/floorplan_congestion.txt {report_congestion -grc_based -by_layer -routing_stage global}
# # redirect -f $REPORT_DIR/floorplan_timing_max.txt {report_timing -max 10}
# # redirect -f $REPORT_DIR/floorplan_timing_min.txt {report_timing -delay_type min -max 10}
# # redirect -f $REPORT_DIR/floorplan_power.txt {report_power}
# # redirect -f $REPORT_DIR/floorplan_qor.txt {report_qor}
# # redirect -f $REPORT_DIR/floorplan_phy_design.txt {report_design -physical}
# # redirect -f $REPORT_DIR/floorplan_constraint.txt {report_constraint -all}

# # save_mw_cel -as ${TOP_MODULE_NAME}_fp_routing


# # #02e_ipo

# # # in-place optimization
# # optimize_fp_timing -fix_design_rule
# # route_zrt_global

# # # report
# # redirect -f $REPORT_DIR/fp_ipo_congestion.txt {report_congestion -grc_based -by_layer -routing_stage global}
# # redirect -f $REPORT_DIR/fp_ipo_timing_max.txt {report_timing -max 10}
# # redirect -f $REPORT_DIR/fp_ipo_timing_min.txt {report_timing -delay_type min -max 10}
# # redirect -f $REPORT_DIR/fp_ipo_power.txt {report_power}
# # redirect -f $REPORT_DIR/fp_ipo_qor.txt {report_qor}
# # redirect -f $REPORT_DIR/fp_ipo_constraint.txt {report_constraint -all}

# # save_mw_cel -as ${TOP_MODULE_NAME}_fp_ipo
