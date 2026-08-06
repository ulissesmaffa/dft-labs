# DFT

module load tmadvisor/
sg_shell

read_file -type verilog ../out_data/pre_layout/santiago_cpu.v

read_file -type gateslib /.../libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

set_option top top_WIDTH8 
current_goal dft/dft_scan_ready 
run_goal