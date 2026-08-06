# TestMAX Advisor — DFT Scan-Ready Example

**Author:** Ulisses Maffazioli
**Created:** 2026-07-12 15:11 (BRT)
**Tool:** Synopsys TestMAX Advisor (SpyGlass) W-2024.09-SP2-8

## What this is

A small, **self-contained** example of running a pre-synthesis DFT testability
analysis on a simple RISC-V-style CPU (`top_santiago_cpu`) with TestMAX Advisor.

The flow reads the RTL, applies a minimal set of test constraints (SGDC), and runs
the `dft/dft_scan_ready` goal under the `rtl_handoff` methodology. It reports the
**predicted stuck-at fault/test coverage** the design would reach once scan is
inserted — no DFT logic is added here; this is analysis only.

Everything needed to reproduce the run lives inside this folder.

## Folder contents

| Item                  | Purpose                                                        |
|-----------------------|---------------------------------------------------------------|
| `inp_data/rtl/`       | SystemVerilog source (design under analysis)                  |
| `santiago_sources.f`  | Source list — the RTL files read by the tool                  |
| `santiago.sgdc`       | Test constraints: `test_clock` on `clk`, `test_mode` on `rst` |
| `script.tcl`          | The SpyGlass batch flow (project setup + goal run)            |
| `run_sg.sh`           | Loads the tool environment and runs `script.tcl`              |
| `clean.sh`            | Removes generated output                                      |
| `sg_results/`         | Generated reports (not versioned)                             |

## How to run

From inside this folder:

```bash
./run_sg.sh
```

This loads the `tmadvisor` module and executes the batch flow.

## What to expect

A clean run reports **~99.8% predicted stuck-at fault/test coverage** with
0 errors and 0 warnings. The remaining ~0.2% comes from a small number of
internal undriven ("hanging") nets.

Key outputs after a run:

- **Text reports** (the real data):
  `sg_results/santiago/consolidated_reports/top_santiago_cpu_dft_dft_scan_ready/`
  - `stuck_at_coverage.rpt` — fault counts by type
  - `stuck_at_coverage_audit.rpt` — step-by-step reasons coverage is below 100%
- **HTML dashboard** (visual, optional):
  `sg_results/santiago/html_reports/goals_summary.html`

> Note: the predicted coverage is an *estimate* from the RTL. The final,
> measured coverage is produced later by TestMAX ATPG on the synthesized,
> scan-inserted netlist.

## Cleaning up

```bash
./clean.sh
```

Removes `sg_results/` and session logs so the run can be reproduced from scratch.
