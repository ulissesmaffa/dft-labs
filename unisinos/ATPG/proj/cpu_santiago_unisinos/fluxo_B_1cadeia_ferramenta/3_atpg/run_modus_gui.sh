#!/bin/bash
# Abre o Modus com GUI para rodar o ATPG passo a passo.
# No console Tcl do Modus, siga scripts/gui_steps.tcl, um bloco de cada vez.
set -euo pipefail

ROOT_DIR=$(dirname "$(readlink -f "$0")")
FLOW_DIR=$(readlink -f "$ROOT_DIR/..")
PROJ_DIR=$(readlink -f "$ROOT_DIR/../..")
export ROOT_DIR

source "$PROJ_DIR/_setup/env.sh"
check_setup
load_tool modus

if [ ! -d "$FLOW_DIR/out_data/pre_layout/modus_ref" ]; then
    echo "ERROR: rode a síntese antes (./2_synthesis/run_genus.sh)"
    exit 1
fi

rm -rf "$ROOT_DIR/.tmp_gui"
mkdir -p "$ROOT_DIR/.tmp_gui"
cd "$ROOT_DIR/.tmp_gui"
modus -gui
