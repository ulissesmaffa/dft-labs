######################################################
## ATPG passo a passo: circuitos sequenciais SEM scan (netlists/seq)
## Abrir com: ./atpg/run_modus_gui.sh s04_adder
## Rodar UM bloco de cada vez no console. NÃO dar source neste arquivo inteiro.
######################################################

# 0. variáveis (netlist de inp_data/source, PDK, testmode)
source ../../scripts/vars.tcl

# 1. Build Model -> conferir PIs, POs, células e número de flops
build_model -designsource $NETLIST -techlib $STD_VLOG -designtop top

# 2. Build Test Mode -> o assignfile declara só o clock (e o reset, se houver)
build_testmode -testmode $TESTMODE -assignfile $ASSIGNFILE

# 3. Verify Test Structures -> 0 cadeias de scan; flops fora de cadeia
verify_test_structures -testmode $TESTMODE

# 4. Build Fault Model -> total de falhas e falhas colapsadas
build_faultmodel -includedynamic no

# 5. Create Tests -> escolher a profundidade e repetir os passos 5 a 7
#    para D = 1, 2, 3, 4 e 32 (cada rodada fica em um experimento seq_d<D>)
set D 1
create_sequential_tests -testmode $TESTMODE -experiment seq_d$D -sequentialdepth $D

# 6. Lista de falhas -> status de cada falha (arquivo faults_seq_d<D>.txt)
report_faults -testmode $TESTMODE -experiment seq_d$D -faultstatus all -faultlocation cellpin -logfile ./faults_seq_d$D.txt

# 7. Vetores -> sequências, falhas-alvo e pulsos de clock (arquivo vectors_seq_d$D.txt)
report_vectors -testmode $TESTMODE -experiment seq_d$D -format node -targetfault yes -outputfile ./vectors_seq_d$D.txt

# 8. (opcional) ATPG padrão, para comparar com o sequencial
create_logic_tests -testmode $TESTMODE -experiment logic -effort high
report_faults  -testmode $TESTMODE -experiment logic -faultstatus all -faultlocation cellpin -logfile ./faults_logic.txt
report_vectors -testmode $TESTMODE -experiment logic -format node -targetfault yes -outputfile ./vectors_logic.txt
