# dft-labs
**Author:** Ulisses Maffazioli
**Created:** 2026-06-30

A collection of **Design-for-Testability (DFT)** labs using Synopsys tooling.
Each design is taken through implementation flows (synthesis, DFT, and — over
time — the rest of RTL-to-GDS), with a focus on studying the DFT tools
(TestMAX Advisor, and later TestMAX ATPG / DFT).

## Organization

```
dft-labs/
└── proj/
    ├── santiago_cpu/     reference design (active)
    │   ├── rtl/          master RTL
    │   ├── tb/           master testbench
    │   ├── 0_synopsys_saed32_flow/   SAED32 flow (active)
    │   └── 1_synopsys_sky130_flow/   sky130 flow (on hold)
    └── rvx_mul/          RISC-V design (planned — SAED32 flow to come)
```

Each design has its own README; each flow and sub-stage has its own README too.

## Conventions

- **Master vs. per-flow sources:** each design keeps a master `rtl/` and `tb/`
  at its top level. These are **copied into each flow** (e.g. under
  `inp_data/`). This duplication is intentional: it lets a flow modify its
  local sources without affecting other flows.
- **PDK setup is not versioned:** paths to the PDK live in a `_setup/` folder
  that is kept out of Git (see `.gitignore`). Scripts source it at runtime.
- Generated outputs (`sg_results/`, `out_data/`, logs, `.prj`) are not
  versioned.

## Designs

| Design         | Status   | Notes                                        |
|----------------|----------|----------------------------------------------|
| `santiago_cpu` | Active   | Reference design; SAED32 flow + DFT studies  |
| `rvx_mul`      | Planned  | RISC-V design; SAED32 flow to be added        |
