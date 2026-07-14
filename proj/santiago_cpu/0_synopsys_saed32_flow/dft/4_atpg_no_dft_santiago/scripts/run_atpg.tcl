set_messages -log out_data/santiago_atpg_no_dft.log -replace -level expert
read_netlist $STD_VERILOG_PATH_SETUP
read_netlist inp_data/santiago_cpu.v
report_modules -summary

run_build_model top_santiago_cpu
report_rules -fail

# --- clocks (reset async = clock, confirmado pelo template) ---
add_clocks 0 clk -timing [list 10 4.5 5.5 4]
add_clocks 0 rst -timing [list 10 4.5 5.5 4]
run_drc
report_rules -fail
report_nonscan_cells -summary
write_drc_file ./inp_data/santiago_no_scan.spf -replace

# --- ATPG Full-Seq single-process (necessario sem scan) ---
add_faults -all
#set_atpg -full_seq_atpg -abort 20
set_atpg -full_seq_atpg -coverage 90 -abort 20
run_atpg -auto              ;# single-process (nao threaded) para Full-Seq valer
report_summaries

set_faults -fault_coverage
write_patterns ./out_data/santiago_no_dft_pats.stil -format stil -replace
write_faults   ./out_data/santiago_no_dft.faults -all -replace
report_summaries faults patterns primitives sequential_depths   > ./out_data/summaries.rpt
report_faults -class UD -uncollapsed                            > ./out_data/faults_UD.rpt
