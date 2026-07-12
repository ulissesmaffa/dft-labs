new_project santiago -projectwdir ./sg_results -force
read_file -type sourcelist ./santiago_sources.f
read_file -type sgdc       ./santiago.sgdc
set_option top      top_santiago_cpu
set_option enableSV yes
current_methodology $SPYGLASS_HOME/GuideWare/latest/block/rtl_handoff
current_goal dft/dft_scan_ready -top top_santiago_cpu
save_project
run_goal

