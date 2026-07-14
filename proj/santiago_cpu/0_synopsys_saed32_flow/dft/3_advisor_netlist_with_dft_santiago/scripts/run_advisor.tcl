new_project santiago_with_dft -projectwdir ./out_data -force
set_option top top_santiago_cpu

read_file -type gateslib $STD_LIB_PATH_SETUP/saed32rvt_tt1p05v25c.lib
read_file -type verilog  ./inp_data/santiago_cpu.v
read_file -type sgdc     ./constr/santiago.sgdc

# Methodology
current_methodology $SPYGLASS_HOME/GuideWare/latest/block/netlist_handoff

# Goal 1
current_goal  dft/dft_scan_ready -top top_santiago_cpu
set_parameter dftGenerateStuckAtFaultReport all
set_parameter dft_identify_equivalent_faults on
set_parameter dftDoLogicalRedundancyCheck on
run_goal

# Goal 2
current_goal dft/dft_best_practice -top top_santiago_cpu
run_goal

# Goal 3
current_goal dft/dft_dsm_random_resistance -top top_santiago_cpu
run_goal

# Goal 4
current_goal dft/dft_dsm_best_practice -top top_santiago_cpu
run_goal

save_project
write_aggregate_report html
