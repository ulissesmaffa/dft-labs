set_messages -log out_data/santiago_atpg_no_dft.log -replace -level expert
read_netlist $STD_VERILOG_PATH_SETUP
read_netlist inp_data/santiago_cpu.v
run_build_model top_santiago_cpu

# --- Setup sem scan: define protocolo manualmente (Quick STIL) ---
add_clocks 0 clk -timing [list 10 4.5 5.5 4]
add_clocks 0 rst -timing [list 10 4.5 5.5 4]
run_drc

# salva o protocolo gerado para reuso futuro
write_drc_file ./inp_data/santiago_no_scan.spf -replace

# --- ATPG Full-Sequential (necessario sem scan) ---
add_faults -all
set_atpg -full_seq_atpg
run_atpg -auto

set_faults -fault_coverage
set_faults -atpg_effectiveness
write_patterns ./out_data/santiago_no_dft_pats.stil -format stil -replace
write_faults   ./out_data/santiago_no_dft.faults -all -replace
report_faults -all                                              > ./out_data/faults_all.rpt
report_summaries faults patterns primitives sequential_depths   > ./out_data/summaries.rpt
report_faults -summary -collapsed                               > ./out_data/faults_summary.rpt
report_faults -class UD -uncollapsed                            > ./out_data/faults_UD.rpt
