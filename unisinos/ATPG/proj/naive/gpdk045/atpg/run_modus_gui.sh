#!/bin/bash
# Abre o Modus com GUI no workdir de um circuito já rodado por run_modus.sh,
# para ver o esquemático e as falhas.
# Uso: ./run_modus_gui.sh c01_redundant
# Depois de abrir, no console Tcl do Modus:
#   set_db workdir ./
# e clique em refresh no painel Tasks.
set -euo pipefail

ROOT_DIR=$(dirname "$(readlink -f "$0")")
CIRCUIT=${1:?uso: ./run_modus_gui.sh <circuito>}
WORK="$ROOT_DIR/.tmp/$CIRCUIT"

[ -d "$WORK/tbdata" ] || { echo "ERROR: rode antes ./run_modus.sh $CIRCUIT"; exit 1; }

if [ -f "$ROOT_DIR/../_setup/setup_tools.sh" ]; then
    set +u; source "$ROOT_DIR/../_setup/setup_tools.sh"; set -u
fi
if ! command -v modus >/dev/null 2>&1 && command -v module >/dev/null 2>&1; then
    module load modus 2>/dev/null || true
fi
command -v modus >/dev/null || { echo "ERROR: modus não está no PATH"; exit 1; }

cd "$WORK"
modus -gui
