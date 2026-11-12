#!/bin/bash
# Uso: ./run_modus.sh [circuito ...]
#   sem argumentos roda todos os netlists/{comb,seq,scan}/*.v
#   ex.: ./run_modus.sh c01_redundant
set -euo pipefail

ROOT_DIR=$(dirname "$(readlink -f "$0")")
FLOW_ROOT=$(dirname "$ROOT_DIR")
export ROOT_DIR

if [ ! -f "$FLOW_ROOT/_setup/setup.tcl" ]; then
    echo "ERROR: crie _setup/setup.tcl a partir de _setup/setup.tcl.example"
    exit 1
fi

# ambiente: setup_tools.sh do fluxo (se existir), senão module load
if [ -f "$FLOW_ROOT/_setup/setup_tools.sh" ]; then
    set +u; source "$FLOW_ROOT/_setup/setup_tools.sh"; set -u
fi
if ! command -v modus >/dev/null 2>&1 && command -v module >/dev/null 2>&1; then
    module load modus 2>/dev/null || true
fi
command -v modus >/dev/null || { echo "ERROR: modus não está no PATH"; exit 1; }

if [ $# -eq 0 ]; then
    set -- $(cd "$FLOW_ROOT/netlists" && ls */*.v | sed 's|.*/||; s/\.v$//')
fi

for CIRCUIT in "$@"; do
    NETLIST=$(ls "$FLOW_ROOT"/netlists/*/"$CIRCUIT.v" 2>/dev/null | head -1 || true)
    [ -n "$NETLIST" ] || { echo "ERROR: netlists/{comb,seq,scan}/$CIRCUIT.v não existe"; exit 1; }
    GROUP=$(basename "$(dirname "$NETLIST")")
    TMP_DIR="$ROOT_DIR/.tmp/$CIRCUIT"
    OUT_DIR="$FLOW_ROOT/out_data/$GROUP/$CIRCUIT"
    export CIRCUIT NETLIST OUT_DIR GROUP
    rm -rf "$TMP_DIR" "$OUT_DIR"
    mkdir -p "$TMP_DIR" "$OUT_DIR"

    echo "=== ATPG: $CIRCUIT ==="
    cd "$TMP_DIR"
    modus -file "$ROOT_DIR/scripts/modus_top.tcl" 2>&1 | tee -i atpg.log
    cp atpg.log "$OUT_DIR/"
    [ -d testresults/logs ]    && cp -r testresults/logs    "$OUT_DIR/logs"
    [ -d testresults/verilog ] && cp -r testresults/verilog "$OUT_DIR/verilog"
    echo "=== Done: $OUT_DIR ==="
done
