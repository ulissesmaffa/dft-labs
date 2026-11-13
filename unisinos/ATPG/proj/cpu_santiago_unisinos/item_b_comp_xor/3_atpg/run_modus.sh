#!/bin/bash
# ATPG com o Modus, pelos scripts que o Genus gerou (write_dft_atpg).
# Uso: ./3_atpg/run_modus.sh  (depois da síntese)
# Roda todos os runmodus*.tcl de out_data/pre_layout/modus_ref: com compressão
# o Genus gera um script por modo de teste (FULLSCAN e compressão).
set -euo pipefail

ROOT_DIR=$(dirname "$(readlink -f "$0")")
FLOW_DIR=$(readlink -f "$ROOT_DIR/..")
PROJ_DIR=$(readlink -f "$ROOT_DIR/../..")
export ROOT_DIR

source "$PROJ_DIR/_setup/env.sh"
check_setup
load_tool modus

MODUS_REF="$FLOW_DIR/out_data/pre_layout/modus_ref"
REPORT_DIR="$FLOW_DIR/out_data/reports/atpg"
ATPG_DIR="$FLOW_DIR/out_data/atpg"

if [ ! -d "$MODUS_REF" ]; then
    echo "ERROR: rode a síntese antes (./2_synthesis/run_genus.sh)"
    exit 1
fi

rm -rf "$REPORT_DIR" "$ATPG_DIR"
mkdir -p "$REPORT_DIR" "$ATPG_DIR"

echo "=== Arquivos gerados pelo Genus (modus_ref) ==="
ls -l "$MODUS_REF" | tee "$REPORT_DIR/modus_ref_files.txt"

cd "$MODUS_REF"
shopt -s nullglob
scripts=(runmodus*.tcl)
if [ ${#scripts[@]} -eq 0 ]; then
    echo "ERROR: nenhum runmodus*.tcl em $MODUS_REF"
    exit 1
fi

for s in "${scripts[@]}"; do
    tag="${s%.tcl}"
    echo "=== Running $s ==="
    modus -file "$s" 2>&1 | tee -i "$REPORT_DIR/$tag.log"
    # cada script recomeça do zero: guarda os vetores e os logs deste
    if [ -d testresults ]; then
        cp -r testresults "$ATPG_DIR/$tag"
        # logs completos de cada comando (cobertura, padrões, ciclos)
        mkdir -p "$REPORT_DIR/logs_$tag"
        cp testresults/logs/log_* "$REPORT_DIR/logs_$tag/" 2>/dev/null || true
    fi
done
echo "=== Done: resultados em out_data/reports/atpg/ ==="
