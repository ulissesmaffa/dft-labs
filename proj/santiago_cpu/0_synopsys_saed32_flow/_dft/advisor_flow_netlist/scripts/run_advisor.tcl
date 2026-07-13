new_project santiago -projectwdir ./out_data -force
set_option top      top_santiago_cpu

read_file -type gateslib $STD_LIB_PATH_SETUP/saed32rvt_tt1p05v25c.lib
read_file -type verilog  ./inp_data/dc/santiago_cpu.v
read_file -type sgdc     ./santiago.sgdc

# Methodology
current_methodology $SPYGLASS_HOME/GuideWare/latest/block/netlist_handoff

# Goal 1
current_goal dft/dft_scan_ready -top top_santiago_cpu
run_goal

# Goal 2
current_goal dft/dft_best_practice -top top_santiago_cpu
run_goal

save_project
write_aggregate_report html
