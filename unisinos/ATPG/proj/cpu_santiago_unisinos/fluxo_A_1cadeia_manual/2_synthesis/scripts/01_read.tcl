######################################################
## Fluxo A - uma cadeia, DFT escrito passo a passo
######################################################

######################################################
## read libs (MMMC) e LEF
######################################################
read_mmmc $SCRIPTS_PATH/mmmc.tcl
read_physical -lef $LEF_LIST

######################################################
## read in design
## do not put testbench in the list below
######################################################
set sv_files [split [exec find $SOURCE_PATH -name "*.sv"] "\n"]

if {[llength $sv_files] > 0} {
    read_hdl -sv $sv_files
} else {
    puts "ERROR: No .sv files found in $SOURCE_PATH"
}

puts $sv_files

elaborate $TOP_MODULE_NAME

init_design
check_design -unresolved
check_design -all > $REPORT_DIR/genus_check_design.rpt

######################################################
## DFT spec
######################################################
set_db dft_scan_style muxed_scan
set_db dft_identify_top_level_test_clocks true
set_db dft_identify_test_signals true

define_dft test_clock -name clk clk
define_dft shift_enable -name scan_en -active high -create_port scan_en
define_dft scan_chain   -name chain1 -sdi scan_in -sdo scan_out -create_ports -shift_enable scan_en
set_compatible_test_clocks -all

dft_checkpoint 0_spec           ;# só a especificação: portas criadas, chain vazia, netlist genérica