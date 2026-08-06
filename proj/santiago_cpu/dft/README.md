# DFT — Synopsys Tooling Studies

**Author:** Ulisses Maffazioli

This folder is dedicated to studying Synopsys **Design-for-Testability (DFT)**
tools, using the `santiago_cpu` design as a working example throughout.

The study is organized tool by tool. **TestMAX Advisor** (SpyGlass) is the
current focus; other tools such as **TestMAX ATPG** and **TestMAX DFT** will be
added as the study progresses.

## Current contents — TestMAX Advisor (SpyGlass)

| Folder                 | Description                                                              |
|------------------------|-------------------------------------------------------------------------|
| `advisor_exemple`      | Minimal example — a single goal (`dft_scan_ready`) on the RTL           |
| `advisor_flow_rtl`     | Full RTL flow — all DFT goals implemented, analyzing the RTL            |
| `advisor_flow_netlist` | Full netlist flow — the same goals, analyzing the post-synthesis netlist|

Each subfolder is self-contained and has its own README with details on how
to run it and what to expect.

## Planned

- TestMAX ATPG — automatic test pattern generation on the scan-inserted netlist
- (further DFT tools to be added as the study advances)

## Notes

- These are study/learning materials for Synopsys DFT tooling.
- The Advisor examples read the design, apply test constraints (SGDC), and run
  one or more DFT goals to report predicted testability and coverage.
