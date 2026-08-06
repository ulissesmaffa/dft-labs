#!/bin/bash
set -euo pipefail

echo ">> Carregando ambiente TestMAX Advisor..."
module load tmadvisor

echo ">> Rodando fluxo SpyGlass DFT..."
sg_shell -tcl script.tcl

echo ">> Concluído. Relatorios em ./out_data/santiago/consolidated_reports/"
echo ">> Dashboard HTML em ./out_data/santiago/html_reports/goals_summary.html"
