#!/bin/bash
# ATPG com o Modus.  Uso: ./3_atpg/run_modus.sh  (depois da síntese)
set -euo pipefail

ROOT_DIR=$(dirname "$(readlink -f "$0")")
FLOW_DIR=$(readlink -f "$ROOT_DIR/..")
PROJ_DIR=$(readlink -f "$ROOT_DIR/../..")
export ROOT_DIR

source "$PROJ_DIR/_setup/env.sh"
check_setup
load_tool modus

if [ ! -d "$FLOW_DIR/out_data/pre_layout" ]; then
    echo "ERROR: rode a síntese antes (./2_synthesis/run_genus.sh)"
    exit 1
fi

rm -rf "$ROOT_DIR/.tmp" "$FLOW_DIR/out_data/reports/atpg" "$FLOW_DIR/out_data/atpg"
mkdir -p "$ROOT_DIR/.tmp" "$FLOW_DIR/out_data/reports/atpg" "$FLOW_DIR/out_data/atpg"

echo "=== Running ATPG ==="
cd "$ROOT_DIR/.tmp"
modus -file "$ROOT_DIR/scripts/modus_top.tcl" 2>&1 | tee -i atpg.log
cp atpg.log "$FLOW_DIR/out_data/reports/atpg/"
# logs completos de cada comando (cobertura, padrões, ciclos)
cp -r testresults/logs "$FLOW_DIR/out_data/reports/atpg/logs" 2>/dev/null || true
echo "=== Done: resultados em out_data/reports/atpg/ ==="
