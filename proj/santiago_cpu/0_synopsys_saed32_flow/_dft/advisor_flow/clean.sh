#!/bin/bash
set -uo pipefail

# Garante que estamos rodando a partir da pasta onde o script está,
# nao de onde o usuario chamou. Evita apagar out_data de outro lugar.
cd "$(dirname "$0")"

echo ">> Limpando resultados em: $(pwd)"

rm -rf out_data/ sg_shell_command.log *.prj

echo ">> Limpeza concluida."
