######################################################
## Fluxo B - uma cadeia, no estilo padrão da ferramenta
##   1. ler bibliotecas, RTL e SDC; elaborar
##   2. setup de DFT (estilo de scan, prefixo, shift enable)
##   3. check_dft_rules (antes de sintetizar)
######################################################

######################################################
## 1. read libs (MMMC: .lib + SDC) e LEF
######################################################
read_mmmc $SCRIPTS_PATH/mmmc.tcl
read_physical -lef $LEF_LIST

######################################################
## read in design
######################################################
set sv_files [split [exec find $SOURCE_PATH -name "*.sv"] "\n"]

if {[llength $sv_files] > 0} {
    read_hdl -sv $sv_files
} else {
    puts "ERROR: No .sv files found in $SOURCE_PATH"
}

elaborate $TOP_MODULE_NAME

init_design
check_design -unresolved
check_design -all > $REPORT_DIR/genus_check_design.rpt

######################################################
## 2. DFT setup (= "DFT constraints" do slide)
######################################################
set_db dft_scan_style muxed_scan     ;# flop comum -> flop com mux (D/SI, seleção SE)
set_db dft_prefix dft_               ;# prefixo da lógica e das portas criadas pelo DFT

define_shift_enable -name scan_en -active high -create_port scan_en

# Não é preciso declarar test clock nem test mode: o Genus identifica o clk
# e o reset assíncrono (rst) sozinho no check_dft_rules (mensagem DFT-303).

######################################################
## 3. Primeira checagem de regras de DFT
## Com os dados da checagem disponíveis, o syn_map já mapeia os flops
## direto para células de scan (scan mapping).
######################################################
check_dft_rules > $REPORT_DIR/DFT_0_check_dft_rules_rtl.rpt
