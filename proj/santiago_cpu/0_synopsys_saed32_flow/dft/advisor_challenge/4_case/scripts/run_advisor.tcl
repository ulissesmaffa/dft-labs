new_project project -projectwdir ./out_data -force
set_option top top

read_file -type verilog  ./inp_data/top.v
read_file -type sgdc     ./constr/constr.sgdc

# Methodology
current_methodology $SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff

# Goal 1
current_goal  dft/dft_scan_ready -top top
set_parameter dftGenerateStuckAtFaultReport all
set_parameter dft_identify_equivalent_faults on
set_parameter dftDoLogicalRedundancyCheck on
run_goal

# Goal 2
current_goal dft/dft_best_practice -top top
run_goal

# Goal 3
current_goal dft/dft_dsm_random_resistance -top top
run_goal

# Goal 4
current_goal dft/dft_dsm_best_practice -top top
run_goal

save_project
write_aggregate_report html
