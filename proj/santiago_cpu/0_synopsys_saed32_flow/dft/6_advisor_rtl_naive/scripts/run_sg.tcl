new_project naive_comb -projectwdir ./out_data -force
read_file -type hdl    ./inp_data/rtl/top_comb.v
read_file -type sgdc   ./constr/constr_comb.sgdc
set_option top         top

# Methodology
current_methodology $SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff

# Goal 1 - Stuck-at
current_goal dft/dft_scan_ready -top top
set_parameter dftGenerateStuckAtFaultReport all
set_parameter dft_identify_equivalent_faults on
set_parameter dftDoLogicalRedundancyCheck on
run_goal

# Goal 2 - Best Practice
current_goal dft/dft_best_practice -top top
run_goal

# Goal 3 - Random Resistant Faults
current_goal dft/dft_dsm_random_resistance -top top
run_goal

# Goal 4 - Best Practice
current_goal dft/dft_dsm_best_practice -top top
run_goal

save_project
write_aggregate_report html

#exit
