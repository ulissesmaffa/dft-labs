#!/bin/bash
set -euo pipefail

echo ">> Carregando ambiente TestMAX Advisor..."
module load tmadvisor

echo ">> Rodando fluxo SpyGlass DFT (dft_scan_ready)..."
sg_shell -tcl script.tcl

echo ">> Concluído. Relatorios em ./sg_results/santiago/consolidated_reports/"
echo ">> Dashboard HTML em ./sg_results/santiago/html_reports/goals_summary.html"
