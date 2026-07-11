# UM: Vanilla Version
set CLK_PORT                 clk
set CLOCK_PERIOD             10      ;# ns -> 100 MHz
set CLOCK_UNCERTAINTY_SETUP  1       ;# ns (margem de síntese)
set CLOCK_LATENCY            1       ;# ns
set CLOCK_TRANSITION         0.2     ;# ns
set INPUT_DELAY              0.1     ;# ns
set OUTPUT_DELAY             0.1     ;# ns
set INPUT_TRANSITION         0.2     ;# ns
set OUTPUT_LOAD              0.05    ;# pF (carga interna; sky130 usa pF)

# entradas exceto o clock
set ALL_IN_BUT_CLK [remove_from_collection [all_inputs] [get_ports $CLK_PORT]]

# clock
create_clock -period $CLOCK_PERIOD -name MY_CLK [get_ports $CLK_PORT]
set_clock_uncertainty -setup $CLOCK_UNCERTAINTY_SETUP MY_CLK
set_clock_latency    $CLOCK_LATENCY    MY_CLK
set_clock_transition $CLOCK_TRANSITION MY_CLK

# I/O
set_input_delay      $INPUT_DELAY  -clock MY_CLK $ALL_IN_BUT_CLK
set_output_delay     $OUTPUT_DELAY -clock MY_CLK [all_outputs]
set_input_transition $INPUT_TRANSITION $ALL_IN_BUT_CLK
set_load             $OUTPUT_LOAD [all_outputs]

# reset assíncrono não é caminho síncrono de dados
set_false_path -from [get_ports rst]

# UM: Review later 
# Design Constraints
# set CLK_PORT  clk
# set CLOCK_PERIOD 20
# set CLOCK_UNCERTAINTY_SETUP 1
# #set CLOCK_UNCERTAINTY_HOLD  0.08
# set CLOCK_LATENCY 1
# set CLOCK_TRANSITION 0.2
# set INPUT_DELAY 0.1
# set OUTPUT_DELAY 0.1
# set OUTPUT_LOAD 10
# set INPUT_TRANSITION 0.2

# # BestCase & WorstCase Library Setup
# set OC_MAX slow
# set OC_MIN fast
# set OC_MAX_LIB slow
# set OC_MIN_LIB afast

# # Apply Constraints
# set ALL_IN_BUT_CLK [remove_from_collection [all_inputs] $CLK_PORT]
# set ALL_OUT_BUT_CLK [remove_from_collection [all_outputs] $CLK_PORT]

# create_clock -period $CLOCK_PERIOD [get_port $CLK_PORT] -name MY_CLK 
# set_clock_uncertainty -setup $CLOCK_UNCERTAINTY_SETUP MY_CLK
# #set_clock_uncertainty -hold  $CLOCK_UNCERTAINTY_HOLD  MY_CLK
# set_clock_latency $CLOCK_LATENCY MY_CLK
# set_clock_transition $CLOCK_TRANSITION MY_CLK

# set_input_delay $INPUT_DELAY -clock MY_CLK $ALL_IN_BUT_CLK
# set_output_delay $OUTPUT_DELAY -clock MY_CLK [all_outputs]

# set_load $OUTPUT_LOAD $ALL_OUT_BUT_CLK 
# set_input_transition $INPUT_TRANSITION  $ALL_IN_BUT_CLK
# #set_driving_cell  -lib_cell INVX1  [all_inputs]

# set_operating_condition -max $OC_MAX -max_lib $OC_MAX_LIB  -min $OC_MIN -min_lib $OC_MIN_LIB

