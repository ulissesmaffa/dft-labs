#!/bin/bash
# Síntese com o Genus.  Uso: ./2_synthesis/run_genus.sh
set -euo pipefail

ROOT_DIR=$(dirname "$(readlink -f "$0")")
FLOW_DIR=$(readlink -f "$ROOT_DIR/..")
PROJ_DIR=$(readlink -f "$ROOT_DIR/../..")
export ROOT_DIR

source "$PROJ_DIR/_setup/env.sh"
check_setup
load_tool genus

rm -rf "$ROOT_DIR/.tmp" "$FLOW_DIR/out_data/reports/syn" "$FLOW_DIR/out_data/pre_layout"
mkdir -p "$ROOT_DIR/.tmp" "$FLOW_DIR/out_data/reports/syn" "$FLOW_DIR/out_data/pre_layout"

echo "=== Running Synthesis ==="
cd "$ROOT_DIR/.tmp"
genus -f "$ROOT_DIR/scripts/genus_top.tcl" 2>&1 | tee -i syn.log
cp syn.log "$FLOW_DIR/out_data/reports/syn/"
echo "=== Done: resultados em out_data/ ==="
