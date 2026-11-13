# Funções comuns dos run_*.sh (não é preciso editar)

check_setup() {
    if [ ! -f "$PROJ_DIR/_setup/setup.tcl" ]; then
        echo "ERROR: crie _setup/setup.tcl a partir de _setup/setup.tcl.example"
        exit 1
    fi
}

# load_tool genus | load_tool modus
#   1. se existir _setup/setup_tools.sh, carrega o ambiente a partir dele
#   2. se a ferramenta ainda não estiver no PATH, tenta "module load"
load_tool() {
    set +u
    if [ -f "$PROJ_DIR/_setup/setup_tools.sh" ]; then
        source "$PROJ_DIR/_setup/setup_tools.sh"
    fi
    if ! command -v "$1" >/dev/null 2>&1; then
        module load "$1" 2>/dev/null || true
    fi
    set -u
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "ERROR: $1 não está no PATH. Carregue o ambiente das ferramentas"
        echo "       antes de rodar, ou copie o script de ambiente para _setup/setup_tools.sh"
        exit 1
    fi
}
