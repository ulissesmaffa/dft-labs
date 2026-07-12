## --- Common Options ---
set_option projectwdir ./sg_results
set_option top         top_santiago_cpu
set_option enableSV    yes
set_option dw          yes
set_option enable_save_restore no

## --- Design Import ---
read_file -type sourcelist ./santiago_sources.f
read_file -type sgdc       ./santiago.sgdc

## --- Goal Setup ---
#current_methodology $env(SPYGLASS_HOME)/GuideWare/latest/block/rtl_handoff
current_goal        dft/dft_scan_ready -top top_santiago_cpu

## customizações (sempre DEPOIS do current_goal)
set_parameter dft_coverage_report_depth all

## --- Run ---
run_goal
exit
