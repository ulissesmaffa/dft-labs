#!/bin/bash
# ATPG em batch do circuito em inp_data/source/ (um único .v)
# Uso: ./atpg/run_modus.sh
set -euo pipefail

ATPG_DIR=$(dirname "$(readlink -f "$0")")
ROOT_DIR=$ATPG_DIR
export ROOT_DIR
FLOW_ROOT=$(dirname "$ATPG_DIR")
WORK="$ATPG_DIR/.tmp/batch"
OUT="$FLOW_ROOT/out_data"

[ -f "$FLOW_ROOT/_setup/setup.tcl" ] || { echo "ERROR: crie _setup/setup.tcl a partir de _setup/setup.tcl.example"; exit 1; }
[ -f "$FLOW_ROOT/_setup/setup_tools.sh" ] && { set +u; source "$FLOW_ROOT/_setup/setup_tools.sh"; set -u; }
command -v modus >/dev/null || { echo "ERROR: modus não está no PATH"; exit 1; }

rm -rf "$WORK"; mkdir -p "$WORK" "$OUT"
cd "$WORK"
echo "source $ATPG_DIR/scripts/atpg.tcl; exit" > run.tcl
modus -file run.tcl 2>&1 | tee -i atpg.log

# resultados
rm -rf "$OUT"/*
cp atpg.log "$OUT/"
[ -d testresults/logs ]    && cp -r testresults/logs    "$OUT/"
[ -d testresults/verilog ] && cp -r testresults/verilog "$OUT/"
echo "=== resultados em out_data/ ==="
