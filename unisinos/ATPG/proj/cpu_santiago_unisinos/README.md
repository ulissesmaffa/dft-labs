# cpu_santiago — Laboratório 3: DFT na síntese e ATPG (gpdk045)

O mesmo circuito (`cpu_santiago`, 173 flip-flops) sintetizado com cinco
arquiteturas de scan. Para cada uma: síntese no Genus e ATPG no Modus.

## Pastas

| Pasta | O que é | Estado |
|---|---|---|
| `fluxo_A_1cadeia_manual` | uma cadeia, DFT escrito passo a passo, `assignfile` à mão | pronto |
| `fluxo_B_1cadeia_ferramenta` | uma cadeia, estilo padrão da ferramenta, arquivos do Modus gerados pelo Genus | pronto |
| `item_a_4cadeias` | 4 cadeias | cópia do fluxo A, a alterar |
| `item_b_comp_xor` | compressão XOR | cópia do fluxo B, a alterar |
| `item_c_comp_elastic` | compressão elastic | cópia do fluxo B, a alterar |

Comum a todas: `inp_data/source/rtl` (RTL) e `_setup` (caminho do PDK).
O RTL e o SDC (clock de 10 ns) não mudam em nenhum item.

## Preparação (uma vez)

```bash
cp _setup/setup.tcl.example _setup/setup.tcl    # ajustar o caminho do PDK
```

O Genus e o Modus precisam estar no PATH (carregue o ambiente das ferramentas
antes de rodar).

## Como rodar (igual em todas as pastas)

```bash
cd fluxo_A_1cadeia_manual
./2_synthesis/run_genus.sh
./3_atpg/run_modus.sh
```

Os resultados ficam em `out_data/` dentro da pasta. No fluxo B há também
`./3_atpg/run_modus_gui.sh`, para rodar o ATPG passo a passo na GUI.

## O que fazer nos itens a a c

As pastas `item_*` já rodam como estão, mas ainda geram **uma cadeia**. Em cada
uma, procure por `TODO` nos scripts: ali estão o trecho a alterar e as dicas.

```bash
grep -rn "TODO" item_a_4cadeias
```

| Item | Arquivos a alterar |
|---|---|
| a | `2_synthesis/scripts/01_read.tcl` e `3_atpg/scripts/cpu_santiago.assignfile` |
| b, c | `2_synthesis/scripts/03_compile.tcl` |

Nos itens b e c o ATPG não precisa de alteração: o `run_modus.sh` roda os
scripts que o Genus gera em `out_data/pre_layout/modus_ref`.

## Onde achar os dados para a tabela (em `out_data/reports/`)

| Dado | Arquivo | O que procurar |
|---|---|---|
| Células e área | `syn/*_final_area.rpt` | linha `top`: Cell-Count e Cell-Area |
| Flops | `syn/*_final_gates.rpt` | linha `sequential` |
| Potência | `syn/*_final_power.rpt` | linha `Subtotal`, coluna Total |
| Folga de timing | `syn/*_final_timing.rpt` | linha `Slack` |
| Cadeias | `syn/DFT_scan_chains.rpt` | número e tamanho das cadeias |
| Falhas e cobertura | `atpg/`, log do `create_logic_tests` | linha `Total Static` |
| Padrões | `atpg/`, log do `create_logic_tests` | quadro `Test Sequences`, linha Logic |
| Ciclos de teste | `atpg/`, log do `write_vectors` | mensagens `TVE-005` |

Os logs do Modus ficam em `atpg/logs/` (fluxos A, B e item a) ou em
`atpg/logs_runmodus.*/` (itens b e c, um conjunto por modo de teste).
