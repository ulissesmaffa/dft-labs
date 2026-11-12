#!/bin/bash
# Abre o Modus GUI numa pasta vazia para rodar o ATPG passo a passo.
# Uso: ./atpg/run_modus_gui.sh
# No console do Modus, rodar UM bloco de cada vez de atpg/scripts/atpg.tcl
set -euo pipefail

ATPG_DIR=$(dirname "$(readlink -f "$0")")
ROOT_DIR=$ATPG_DIR
export ROOT_DIR
FLOW_ROOT=$(dirname "$ATPG_DIR")
WORK="$ATPG_DIR/.tmp/gui"

[ -f "$FLOW_ROOT/_setup/setup.tcl" ] || { echo "ERROR: crie _setup/setup.tcl a partir de _setup/setup.tcl.example"; exit 1; }
[ -f "$FLOW_ROOT/_setup/setup_tools.sh" ] && { set +u; source "$FLOW_ROOT/_setup/setup_tools.sh"; set -u; }
command -v modus >/dev/null || { echo "ERROR: modus não está no PATH"; exit 1; }

# pasta limpa (se um GUI anterior ainda segura arquivos, feche-o antes)
rm -rf "$WORK" || { echo "ERROR: feche o Modus GUI anterior"; exit 1; }
mkdir -p "$WORK"
cd "$WORK"

echo "No console do Modus, comece com:"
echo "  source ../../scripts/vars.tcl"
echo "e depois rode os passos 1 a 7 de atpg/scripts/atpg.tcl"
modus -gui
