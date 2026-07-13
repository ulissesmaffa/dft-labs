# SAED32 Flow — RTL-to-GDS
**Author:** Ulisses Maffazioli
**Created:** 2026-07-12
**Tool:** Synopsys tooling on the SAED32 EDK (32 nm)

> **Work in progress.** This folder is being built up stage by stage toward a
> complete RTL-to-GDS flow. Only some stages exist so far.

This folder implements a Synopsys RTL-to-GDS flow for the `santiago_cpu`
design, targeting the **SAED32** educational technology.

## Current contents

| Stage          | Description                                                      |
|----------------|------------------------------------------------------------------|
| `2_synthesis`  | Logic synthesis (Design Compiler) — RTL to gate-level netlist    |
| `dft`          | DFT studies (TestMAX Advisor / SpyGlass), see its own README     |

## Planned stages

- Floorplanning, Place & Route
- TestMAX ATPG (pattern generation)
- STA sign-off
- GDS export

_(stages to be added as the flow is built out)_

## Notes

- PDK paths are kept in an external setup file, outside version control.
- Each stage is intended to be runnable on its own; see per-stage READMEs
  for details as they are completed.
