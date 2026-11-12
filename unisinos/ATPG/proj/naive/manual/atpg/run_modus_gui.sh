#!/bin/bash
# Abre o Modus GUI numa pasta vazia para rodar o ATPG passo a passo.
# Uso: ./atpg/run_modus_gui.sh [circuito]
#   com nome   : copia netlists/*/<circuito>.v (e o .assignfile) para inp_data/source/
#   sem nome   : usa o que já estiver em inp_data/source/
#   ex.: ./atpg/run_modus_gui.sh s04_adder
#   --batch    : abre o resultado do último ./atpg/run_modus.sh (não apaga nada)
#                no console do Modus: set_db workdir ./   e refresh no painel Tasks
# No console do Modus, rodar UM bloco de cada vez:
#   atpg/scripts/atpg.tcl      (combinacionais e scan)
#   atpg/scripts/atpg_seq.tcl  (sequenciais sem scan: profundidade, falhas, vetores)
set -euo pipefail

ATPG_DIR=$(dirname "$(readlink -f "$0")")
ROOT_DIR=$ATPG_DIR
export ROOT_DIR
FLOW_ROOT=$(dirname "$ATPG_DIR")
WORK="$ATPG_DIR/.tmp/gui"
SRC="$FLOW_ROOT/inp_data/source"

[ -f "$FLOW_ROOT/_setup/setup.tcl" ] || { echo "ERROR: falta _setup/setup.tcl"; exit 1; }
if [ -f "$FLOW_ROOT/_setup/setup_tools.sh" ]; then set +u; source "$FLOW_ROOT/_setup/setup_tools.sh"; set -u; fi
command -v modus >/dev/null || { echo "ERROR: modus não está no PATH"; exit 1; }

# resultado do batch: abre a pasta já pronta, sem limpar
if [ "${1:-}" = "--batch" ]; then
    WORK="$ATPG_DIR/.tmp/batch"
    [ -d "$WORK/tbdata" ] || { echo "ERROR: rode antes ./atpg/run_modus.sh"; exit 1; }
    cd "$WORK"
    echo "Abrindo o resultado do batch. No console do Modus:"
    echo "  set_db workdir ./"
    echo "e clique em refresh no painel Tasks."
    exec modus -gui
fi

# circuito pedido -> inp_data/source
if [ $# -ge 1 ]; then
    NETLIST=$(ls "$FLOW_ROOT"/netlists/*/"$1.v" 2>/dev/null | head -1 || true)
    [ -n "$NETLIST" ] || { echo "ERROR: netlists/{comb,seq,scan}/$1.v não existe"; exit 1; }
    mkdir -p "$SRC"; rm -f "$SRC"/*
    cp "$NETLIST" "$SRC/"
    [ -f "${NETLIST%.v}.assignfile" ] && cp "${NETLIST%.v}.assignfile" "$SRC/"
fi
N=$(ls "$SRC"/*.v 2>/dev/null | wc -l)
[ "$N" -eq 1 ] || { echo "ERROR: inp_data/source/ deve ter exatamente um .v (tem $N)"; exit 1; }

# pasta limpa (se um GUI anterior ainda segura arquivos, feche-o antes)
rm -rf "$WORK" || { echo "ERROR: feche o Modus GUI anterior"; exit 1; }
mkdir -p "$WORK"
cd "$WORK"

echo "Circuito: $(basename "$SRC"/*.v .v)"
echo "No console do Modus, rode UM bloco de cada vez, começando por:"
echo "  source ../../scripts/vars.tcl"
echo "Passos: atpg/scripts/atpg.tcl  (sem scan e com flop: atpg/scripts/atpg_seq.tcl)"
echo "Arquivos gerados ficam em: $WORK"
modus -gui
