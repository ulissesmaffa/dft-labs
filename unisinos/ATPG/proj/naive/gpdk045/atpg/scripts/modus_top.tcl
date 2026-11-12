######################################################
## naive: ATPG direto sobre uma netlist escrita à mão
## (sem síntese, sem scan; c* combinacionais, s* sequenciais)
######################################################
source $::env(ROOT_DIR)/../_setup/setup.tcl

set FLOW_ROOT  $FLOW_ROOT_SETUP
set STD_VLOG   $STD_VLOG_SETUP
set CIRCUIT    $::env(CIRCUIT)
set NETLIST    $::env(NETLIST)   ;# netlists/comb/<c>.v ou netlists/seq/<c>.v
set OUT_DIR    $::env(OUT_DIR)
set TESTMODE   FULLSCAN   ;# modedef padrão; sem pinos de teste, vira um modo só PI -> PO

file mkdir $OUT_DIR
set_db workdir ./

# 1. modelo: netlist + modelos Verilog das células
build_model -designsource $NETLIST -techlib $STD_VLOG -designtop top

# 2. testmode
#    - com flop (existe <circuito>.assignfile): clock/reset e, em scan/, SE/SI/SO
#    - combinacional: nenhum pino de teste; se esta versão exigir um
#      assignfile, usa um vazio (só comentário)
set ASSIGNFILE [file rootname $NETLIST].assignfile
set HAS_ASSIGN [file exists $ASSIGNFILE]
# ATPG sequencial só nos circuitos de netlists/seq (com flop e sem scan);
# em netlists/scan a cadeia resolve tudo com o ATPG combinacional
set SEQ [expr {$::env(GROUP) eq "seq"}]
if {$HAS_ASSIGN} {
    build_testmode -testmode $TESTMODE -assignfile $ASSIGNFILE
} elseif {[catch {build_testmode -testmode $TESTMODE} err]} {
    puts "INFO: build_testmode sem assignfile falhou ($err); tentando com assignfile vazio"
    set fh [open ./empty.assignfile w]
    puts $fh "#// circuito combinacional: nenhum pino de teste"
    close $fh
    build_testmode -testmode $TESTMODE -assignfile ./empty.assignfile
}

# 3. DRC do teste (sem cadeias: esperado "0 scan chains")
verify_test_structures -testmode $TESTMODE

# 4. falhas stuck-at nos pinos das células
build_faultmodel -includedynamic no

# 5. ATPG
#    logic: ATPG combinacional (1 time frame; sem scan só enxerga PI -> PO)
#    seq  : ATPG sequencial (desenrola vários ciclos); só nos circuitos com flop
#    Os experimentos são independentes (sem commit): cada cobertura é só dele.
create_logic_tests -testmode $TESTMODE -experiment logic -effort high
set EXPS logic
if {$SEQ} {
    create_sequential_tests -testmode $TESTMODE -experiment seq
    lappend EXPS seq

    # ILA na prática: limita quantos time frames o gerador pode desenrolar.
    # Cobertura por profundidade -> comparar as tabelas finais no log
    # (32 é o máximo aceito pela ferramenta).
    foreach D {1 2 3 4 32} {
        # na profundidade máxima usa também esforço alto (o padrão é low)
        set EFF [expr {$D == 32 ? "high" : "low"}]
        catch {create_sequential_tests -testmode $TESTMODE -experiment seq_d$D \
                  -sequentialdepth $D -effort $EFF}
        catch {report_faults -testmode $TESTMODE -experiment seq_d$D \
                 -faultstatus all -faultlocation cellpin -reportkey yes \
                 -logfile $OUT_DIR/faults_all_seq_d$D.txt}
    }
}

# 6. relatórios por experimento: vetores (com nomes dos pinos e falhas-alvo),
#    falhas redundantes, todas as falhas, e vetores em Verilog
foreach E $EXPS {
    catch {report_vectors -testmode $TESTMODE -experiment $E -format node \
              -targetfault yes -outputfile $OUT_DIR/vectors_node_$E.txt}
    catch {report_faults -testmode $TESTMODE -experiment $E \
             -faultstatus redundant -faultlocation cellpin -reportkey yes \
             -logfile $OUT_DIR/faults_redundant_$E.txt}
    catch {report_faults -testmode $TESTMODE -experiment $E \
             -faultstatus all -faultlocation cellpin \
             -logfile $OUT_DIR/faults_all_$E.txt}
    catch {write_vectors -testmode $TESTMODE -inexperiment $E -language verilog}
}

exit
