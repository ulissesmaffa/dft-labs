# Design Constraints (lido pelo mmmc.tcl)

# Clock
create_clock -name clk -period 10 [get_ports clk]
set_clock_transition -rise 0.1 [get_clocks clk]
set_clock_transition -fall 0.1 [get_clocks clk]
set_clock_uncertainty 0.3 [get_clocks clk]

# IO Constraints
set IN_DELAY  1.5
set OUT_DELAY 1.5
set IN_TRANS  0.5
set OUT_LOAD  0.01

set all_in  [remove_from_collection [all_inputs] [get_ports clk]]
set all_out [all_outputs]

set_input_delay      $IN_DELAY  -clock clk $all_in
set_output_delay     $OUT_DELAY -clock clk $all_out
set_input_transition $IN_TRANS  $all_in
set_load             $OUT_LOAD  $all_out
