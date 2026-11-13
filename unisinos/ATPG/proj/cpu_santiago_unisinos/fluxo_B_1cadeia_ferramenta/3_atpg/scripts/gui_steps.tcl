######################################################
## Fluxo de ATPG passo a passo (para rodar no console do Modus GUI)
## Copie e rode UM bloco de cada vez; depois de cada um, olhe o que mudou
## na GUI e no log. NÃO dê source neste arquivo inteiro.
######################################################

# 0. variáveis e caminhos
source ../scripts/gui_setup.tcl

# 1. Build Model -> olhar o schematic/hierarquia (design, hinsts, prims)
build_model -designsource $NETLIST -techlib $STD_VLOG -designtop $TOP_MODULE_NAME

# 2. Build Test Mode -> olhar a tabela de pinos de teste (clk -ES, rst -SC, scan_en +SE, SI/SO)
build_testmode -testmode $TESTMODE -assignfile $ASSIGNFILE

# 3. Verify / Report Test Structures -> cadeia controlável e observável, 173 bits
verify_test_structures -testmode $TESTMODE
report_test_structures -testmode $TESTMODE -reportscanchain all

# 4. Build Fault Model -> número total de falhas (stuck-at)
build_faultmodel -includedynamic no

# 5. Create Tests -> teste da cadeia e testes de lógica; acompanhar a cobertura
create_logic_tests -testmode $TESTMODE -experiment logic

# 6. Write Vectors -> ciclos de scan e de teste (TVE-005)
write_vectors -testmode $TESTMODE -inexperiment logic -language verilog -scanformat parallel

# 7. Report Vectors -> vetores em formato legível (Scan_Load, clock, Scan_Unload)
report_vectors -testmode $TESTMODE -experiment logic -format node -outputfile ./vectors_node_logic.txt
