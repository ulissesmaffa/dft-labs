new_project santiago -projectwdir ./out_data -force
read_file -type sourcelist ./santiago_sources.f
read_file -type sgdc       ./santiago.sgdc
set_option top      top_santiago_cpu
set_option enableSV yes
current_methodology $SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff

# Goal 1
current_goal dft/dft_scan_ready -top top_santiago_cpu
run_goal

# Goal 2
current_goal dft/dft_best_practice -top top_santiago_cpu
run_goal

save_project
write_aggregate_report html
exit
