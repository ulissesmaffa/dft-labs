//=============================================================================
// top_pad.sv  -  Pad ring (sky130_fd_io / sky130_ef_io) para o core `top`
//
// Core: top #(WIDTH=8)
//   Entradas : clk, rst, cmdin[6:0], din_1[7:0], din_2[7:0], din_3[7:0]   (33)
//   Saidas   : dout_low[7:0], dout_high[7:0], zero, error, cpu_rdy        (19)
//   Total de pads de sinal: 52  (+ alimentacao + corners)
//
// Convencao de nomes:
//   <sinal>_I  -> rede lado-core para PADs de ENTRADA  (PAD.IN  -> core)
//   <sinal>_O  -> rede lado-core para PADs de SAIDA     (core -> PAD.OUT)
//   <sinal>_hi / <sinal>_lo -> tie-hi/tie-lo locais do proprio PAD (via ESD)
//
// Os nomes de instancia PAD_* sao os que voce referencia no arquivo .io.
//=============================================================================
`include "top.sv"

module top_pad (
  // --- pinos fisicos do chip (bond pads) ---
  input  wire        clk,
  input  wire        rst,
  input  wire [6:0]  cmdin,
  input  wire [7:0]  din_1,
  input  wire [7:0]  din_2,
  input  wire [7:0]  din_3,
  output wire [7:0]  dout_low,
  output wire [7:0]  dout_high,
  output wire        zero,
  output wire        error,
  output wire        cpu_rdy
);
 
  // ---------------------------------------------------------------------------
  // Redes internas (lado core)
  // ---------------------------------------------------------------------------
  wire        clk_I, rst_I;
  wire [6:0]  cmdin_I;
  wire [7:0]  din_1_I, din_2_I, din_3_I;
  wire [7:0]  dout_low_O, dout_high_O;
  wire        zero_O, error_O, cpu_rdy_O;
 
  // tie-hi / tie-lo locais por PAD (saidas do gpiov2 via ESD)
  wire        clk_hi, clk_lo;
  wire        rst_hi, rst_lo;
  wire [6:0]  cmdin_hi, cmdin_lo;
  wire [7:0]  din_1_hi, din_1_lo;
  wire [7:0]  din_2_hi, din_2_lo;
  wire [7:0]  din_3_hi, din_3_lo;
  wire [7:0]  dout_low_hi, dout_low_lo;
  wire [7:0]  dout_high_hi, dout_high_lo;
  wire        zero_hi, zero_lo;
  wire        error_hi, error_lo;
  wire        cpu_rdy_hi, cpu_rdy_lo;
 
  // ---------------------------------------------------------------------------
  // Core
  // ---------------------------------------------------------------------------
  top #(.WIDTH(8)) core (
    .clk       (clk_I),
    .rst       (rst_I),
    .cmdin     (cmdin_I),
    .din_1     (din_1_I),
    .din_2     (din_2_I),
    .din_3     (din_3_I),
    .dout_low  (dout_low_O),
    .dout_high (dout_high_O),
    .zero      (zero_O),
    .error     (error_O),
    .cpu_rdy   (cpu_rdy_O)
  );
 
  // ===========================================================================
  // PADs de ENTRADA
  //   INP_DIS=0 (input ativo), OE_N=1 (output off), OUT amarrado em 0
  //   HLD_H_N=hi, ENABLE_H=hi, DM=110 (buffer de entrada padrao)
  // ===========================================================================
  sky130_ef_io__gpiov2_pad PAD_clk (
    .PAD(clk), .IN(clk_I), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(clk_hi), .TIE_LO_ESD(clk_lo),
    .HLD_H_N(clk_hi), .ENABLE_H(clk_hi),
    .DM({clk_hi, clk_hi, clk_lo})
  );
 
  sky130_ef_io__gpiov2_pad PAD_rst (
    .PAD(rst), .IN(rst_I), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(rst_hi), .TIE_LO_ESD(rst_lo),
    .HLD_H_N(rst_hi), .ENABLE_H(rst_hi),
    .DM({rst_hi, rst_hi, rst_lo})
  );
 
  // --- cmdin[6:0] ---
  sky130_ef_io__gpiov2_pad PAD_cmdin_0 (
    .PAD(cmdin[0]), .IN(cmdin_I[0]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(cmdin_hi[0]), .TIE_LO_ESD(cmdin_lo[0]),
    .HLD_H_N(cmdin_hi[0]), .ENABLE_H(cmdin_hi[0]),
    .DM({cmdin_hi[0], cmdin_hi[0], cmdin_lo[0]})
  );
  sky130_ef_io__gpiov2_pad PAD_cmdin_1 (
    .PAD(cmdin[1]), .IN(cmdin_I[1]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(cmdin_hi[1]), .TIE_LO_ESD(cmdin_lo[1]),
    .HLD_H_N(cmdin_hi[1]), .ENABLE_H(cmdin_hi[1]),
    .DM({cmdin_hi[1], cmdin_hi[1], cmdin_lo[1]})
  );
  sky130_ef_io__gpiov2_pad PAD_cmdin_2 (
    .PAD(cmdin[2]), .IN(cmdin_I[2]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(cmdin_hi[2]), .TIE_LO_ESD(cmdin_lo[2]),
    .HLD_H_N(cmdin_hi[2]), .ENABLE_H(cmdin_hi[2]),
    .DM({cmdin_hi[2], cmdin_hi[2], cmdin_lo[2]})
  );
  sky130_ef_io__gpiov2_pad PAD_cmdin_3 (
    .PAD(cmdin[3]), .IN(cmdin_I[3]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(cmdin_hi[3]), .TIE_LO_ESD(cmdin_lo[3]),
    .HLD_H_N(cmdin_hi[3]), .ENABLE_H(cmdin_hi[3]),
    .DM({cmdin_hi[3], cmdin_hi[3], cmdin_lo[3]})
  );
  sky130_ef_io__gpiov2_pad PAD_cmdin_4 (
    .PAD(cmdin[4]), .IN(cmdin_I[4]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(cmdin_hi[4]), .TIE_LO_ESD(cmdin_lo[4]),
    .HLD_H_N(cmdin_hi[4]), .ENABLE_H(cmdin_hi[4]),
    .DM({cmdin_hi[4], cmdin_hi[4], cmdin_lo[4]})
  );
  sky130_ef_io__gpiov2_pad PAD_cmdin_5 (
    .PAD(cmdin[5]), .IN(cmdin_I[5]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(cmdin_hi[5]), .TIE_LO_ESD(cmdin_lo[5]),
    .HLD_H_N(cmdin_hi[5]), .ENABLE_H(cmdin_hi[5]),
    .DM({cmdin_hi[5], cmdin_hi[5], cmdin_lo[5]})
  );
  sky130_ef_io__gpiov2_pad PAD_cmdin_6 (
    .PAD(cmdin[6]), .IN(cmdin_I[6]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(cmdin_hi[6]), .TIE_LO_ESD(cmdin_lo[6]),
    .HLD_H_N(cmdin_hi[6]), .ENABLE_H(cmdin_hi[6]),
    .DM({cmdin_hi[6], cmdin_hi[6], cmdin_lo[6]})
  );
 
  // --- din_1[7:0] ---
  sky130_ef_io__gpiov2_pad PAD_din_1_0 (
    .PAD(din_1[0]), .IN(din_1_I[0]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_1_hi[0]), .TIE_LO_ESD(din_1_lo[0]),
    .HLD_H_N(din_1_hi[0]), .ENABLE_H(din_1_hi[0]),
    .DM({din_1_hi[0], din_1_hi[0], din_1_lo[0]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_1_1 (
    .PAD(din_1[1]), .IN(din_1_I[1]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_1_hi[1]), .TIE_LO_ESD(din_1_lo[1]),
    .HLD_H_N(din_1_hi[1]), .ENABLE_H(din_1_hi[1]),
    .DM({din_1_hi[1], din_1_hi[1], din_1_lo[1]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_1_2 (
    .PAD(din_1[2]), .IN(din_1_I[2]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_1_hi[2]), .TIE_LO_ESD(din_1_lo[2]),
    .HLD_H_N(din_1_hi[2]), .ENABLE_H(din_1_hi[2]),
    .DM({din_1_hi[2], din_1_hi[2], din_1_lo[2]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_1_3 (
    .PAD(din_1[3]), .IN(din_1_I[3]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_1_hi[3]), .TIE_LO_ESD(din_1_lo[3]),
    .HLD_H_N(din_1_hi[3]), .ENABLE_H(din_1_hi[3]),
    .DM({din_1_hi[3], din_1_hi[3], din_1_lo[3]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_1_4 (
    .PAD(din_1[4]), .IN(din_1_I[4]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_1_hi[4]), .TIE_LO_ESD(din_1_lo[4]),
    .HLD_H_N(din_1_hi[4]), .ENABLE_H(din_1_hi[4]),
    .DM({din_1_hi[4], din_1_hi[4], din_1_lo[4]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_1_5 (
    .PAD(din_1[5]), .IN(din_1_I[5]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_1_hi[5]), .TIE_LO_ESD(din_1_lo[5]),
    .HLD_H_N(din_1_hi[5]), .ENABLE_H(din_1_hi[5]),
    .DM({din_1_hi[5], din_1_hi[5], din_1_lo[5]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_1_6 (
    .PAD(din_1[6]), .IN(din_1_I[6]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_1_hi[6]), .TIE_LO_ESD(din_1_lo[6]),
    .HLD_H_N(din_1_hi[6]), .ENABLE_H(din_1_hi[6]),
    .DM({din_1_hi[6], din_1_hi[6], din_1_lo[6]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_1_7 (
    .PAD(din_1[7]), .IN(din_1_I[7]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_1_hi[7]), .TIE_LO_ESD(din_1_lo[7]),
    .HLD_H_N(din_1_hi[7]), .ENABLE_H(din_1_hi[7]),
    .DM({din_1_hi[7], din_1_hi[7], din_1_lo[7]})
  );
 
  // --- din_2[7:0] ---
  sky130_ef_io__gpiov2_pad PAD_din_2_0 (
    .PAD(din_2[0]), .IN(din_2_I[0]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_2_hi[0]), .TIE_LO_ESD(din_2_lo[0]),
    .HLD_H_N(din_2_hi[0]), .ENABLE_H(din_2_hi[0]),
    .DM({din_2_hi[0], din_2_hi[0], din_2_lo[0]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_2_1 (
    .PAD(din_2[1]), .IN(din_2_I[1]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_2_hi[1]), .TIE_LO_ESD(din_2_lo[1]),
    .HLD_H_N(din_2_hi[1]), .ENABLE_H(din_2_hi[1]),
    .DM({din_2_hi[1], din_2_hi[1], din_2_lo[1]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_2_2 (
    .PAD(din_2[2]), .IN(din_2_I[2]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_2_hi[2]), .TIE_LO_ESD(din_2_lo[2]),
    .HLD_H_N(din_2_hi[2]), .ENABLE_H(din_2_hi[2]),
    .DM({din_2_hi[2], din_2_hi[2], din_2_lo[2]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_2_3 (
    .PAD(din_2[3]), .IN(din_2_I[3]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_2_hi[3]), .TIE_LO_ESD(din_2_lo[3]),
    .HLD_H_N(din_2_hi[3]), .ENABLE_H(din_2_hi[3]),
    .DM({din_2_hi[3], din_2_hi[3], din_2_lo[3]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_2_4 (
    .PAD(din_2[4]), .IN(din_2_I[4]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_2_hi[4]), .TIE_LO_ESD(din_2_lo[4]),
    .HLD_H_N(din_2_hi[4]), .ENABLE_H(din_2_hi[4]),
    .DM({din_2_hi[4], din_2_hi[4], din_2_lo[4]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_2_5 (
    .PAD(din_2[5]), .IN(din_2_I[5]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_2_hi[5]), .TIE_LO_ESD(din_2_lo[5]),
    .HLD_H_N(din_2_hi[5]), .ENABLE_H(din_2_hi[5]),
    .DM({din_2_hi[5], din_2_hi[5], din_2_lo[5]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_2_6 (
    .PAD(din_2[6]), .IN(din_2_I[6]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_2_hi[6]), .TIE_LO_ESD(din_2_lo[6]),
    .HLD_H_N(din_2_hi[6]), .ENABLE_H(din_2_hi[6]),
    .DM({din_2_hi[6], din_2_hi[6], din_2_lo[6]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_2_7 (
    .PAD(din_2[7]), .IN(din_2_I[7]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_2_hi[7]), .TIE_LO_ESD(din_2_lo[7]),
    .HLD_H_N(din_2_hi[7]), .ENABLE_H(din_2_hi[7]),
    .DM({din_2_hi[7], din_2_hi[7], din_2_lo[7]})
  );
 
  // --- din_3[7:0] ---
  sky130_ef_io__gpiov2_pad PAD_din_3_0 (
    .PAD(din_3[0]), .IN(din_3_I[0]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_3_hi[0]), .TIE_LO_ESD(din_3_lo[0]),
    .HLD_H_N(din_3_hi[0]), .ENABLE_H(din_3_hi[0]),
    .DM({din_3_hi[0], din_3_hi[0], din_3_lo[0]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_3_1 (
    .PAD(din_3[1]), .IN(din_3_I[1]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_3_hi[1]), .TIE_LO_ESD(din_3_lo[1]),
    .HLD_H_N(din_3_hi[1]), .ENABLE_H(din_3_hi[1]),
    .DM({din_3_hi[1], din_3_hi[1], din_3_lo[1]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_3_2 (
    .PAD(din_3[2]), .IN(din_3_I[2]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_3_hi[2]), .TIE_LO_ESD(din_3_lo[2]),
    .HLD_H_N(din_3_hi[2]), .ENABLE_H(din_3_hi[2]),
    .DM({din_3_hi[2], din_3_hi[2], din_3_lo[2]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_3_3 (
    .PAD(din_3[3]), .IN(din_3_I[3]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_3_hi[3]), .TIE_LO_ESD(din_3_lo[3]),
    .HLD_H_N(din_3_hi[3]), .ENABLE_H(din_3_hi[3]),
    .DM({din_3_hi[3], din_3_hi[3], din_3_lo[3]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_3_4 (
    .PAD(din_3[4]), .IN(din_3_I[4]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_3_hi[4]), .TIE_LO_ESD(din_3_lo[4]),
    .HLD_H_N(din_3_hi[4]), .ENABLE_H(din_3_hi[4]),
    .DM({din_3_hi[4], din_3_hi[4], din_3_lo[4]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_3_5 (
    .PAD(din_3[5]), .IN(din_3_I[5]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_3_hi[5]), .TIE_LO_ESD(din_3_lo[5]),
    .HLD_H_N(din_3_hi[5]), .ENABLE_H(din_3_hi[5]),
    .DM({din_3_hi[5], din_3_hi[5], din_3_lo[5]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_3_6 (
    .PAD(din_3[6]), .IN(din_3_I[6]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_3_hi[6]), .TIE_LO_ESD(din_3_lo[6]),
    .HLD_H_N(din_3_hi[6]), .ENABLE_H(din_3_hi[6]),
    .DM({din_3_hi[6], din_3_hi[6], din_3_lo[6]})
  );
  sky130_ef_io__gpiov2_pad PAD_din_3_7 (
    .PAD(din_3[7]), .IN(din_3_I[7]), .OUT(1'b0),
    .INP_DIS(1'b0), .OE_N(1'b1),
    .TIE_HI_ESD(din_3_hi[7]), .TIE_LO_ESD(din_3_lo[7]),
    .HLD_H_N(din_3_hi[7]), .ENABLE_H(din_3_hi[7]),
    .DM({din_3_hi[7], din_3_hi[7], din_3_lo[7]})
  );
 
  // ===========================================================================
  // PADs de SAIDA
  //   INP_DIS=1 (input off), OE_N=0 (output ativo), IN deixado aberto
  // ===========================================================================
  // --- dout_low[7:0] ---
  sky130_ef_io__gpiov2_pad PAD_dout_low_0 (
    .PAD(dout_low[0]), .IN(), .OUT(dout_low_O[0]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_low_hi[0]), .TIE_LO_ESD(dout_low_lo[0]),
    .HLD_H_N(dout_low_hi[0]), .ENABLE_H(dout_low_hi[0]),
    .DM({dout_low_hi[0], dout_low_hi[0], dout_low_lo[0]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_low_1 (
    .PAD(dout_low[1]), .IN(), .OUT(dout_low_O[1]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_low_hi[1]), .TIE_LO_ESD(dout_low_lo[1]),
    .HLD_H_N(dout_low_hi[1]), .ENABLE_H(dout_low_hi[1]),
    .DM({dout_low_hi[1], dout_low_hi[1], dout_low_lo[1]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_low_2 (
    .PAD(dout_low[2]), .IN(), .OUT(dout_low_O[2]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_low_hi[2]), .TIE_LO_ESD(dout_low_lo[2]),
    .HLD_H_N(dout_low_hi[2]), .ENABLE_H(dout_low_hi[2]),
    .DM({dout_low_hi[2], dout_low_hi[2], dout_low_lo[2]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_low_3 (
    .PAD(dout_low[3]), .IN(), .OUT(dout_low_O[3]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_low_hi[3]), .TIE_LO_ESD(dout_low_lo[3]),
    .HLD_H_N(dout_low_hi[3]), .ENABLE_H(dout_low_hi[3]),
    .DM({dout_low_hi[3], dout_low_hi[3], dout_low_lo[3]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_low_4 (
    .PAD(dout_low[4]), .IN(), .OUT(dout_low_O[4]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_low_hi[4]), .TIE_LO_ESD(dout_low_lo[4]),
    .HLD_H_N(dout_low_hi[4]), .ENABLE_H(dout_low_hi[4]),
    .DM({dout_low_hi[4], dout_low_hi[4], dout_low_lo[4]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_low_5 (
    .PAD(dout_low[5]), .IN(), .OUT(dout_low_O[5]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_low_hi[5]), .TIE_LO_ESD(dout_low_lo[5]),
    .HLD_H_N(dout_low_hi[5]), .ENABLE_H(dout_low_hi[5]),
    .DM({dout_low_hi[5], dout_low_hi[5], dout_low_lo[5]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_low_6 (
    .PAD(dout_low[6]), .IN(), .OUT(dout_low_O[6]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_low_hi[6]), .TIE_LO_ESD(dout_low_lo[6]),
    .HLD_H_N(dout_low_hi[6]), .ENABLE_H(dout_low_hi[6]),
    .DM({dout_low_hi[6], dout_low_hi[6], dout_low_lo[6]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_low_7 (
    .PAD(dout_low[7]), .IN(), .OUT(dout_low_O[7]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_low_hi[7]), .TIE_LO_ESD(dout_low_lo[7]),
    .HLD_H_N(dout_low_hi[7]), .ENABLE_H(dout_low_hi[7]),
    .DM({dout_low_hi[7], dout_low_hi[7], dout_low_lo[7]})
  );
 
  // --- dout_high[7:0] ---
  sky130_ef_io__gpiov2_pad PAD_dout_high_0 (
    .PAD(dout_high[0]), .IN(), .OUT(dout_high_O[0]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_high_hi[0]), .TIE_LO_ESD(dout_high_lo[0]),
    .HLD_H_N(dout_high_hi[0]), .ENABLE_H(dout_high_hi[0]),
    .DM({dout_high_hi[0], dout_high_hi[0], dout_high_lo[0]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_high_1 (
    .PAD(dout_high[1]), .IN(), .OUT(dout_high_O[1]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_high_hi[1]), .TIE_LO_ESD(dout_high_lo[1]),
    .HLD_H_N(dout_high_hi[1]), .ENABLE_H(dout_high_hi[1]),
    .DM({dout_high_hi[1], dout_high_hi[1], dout_high_lo[1]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_high_2 (
    .PAD(dout_high[2]), .IN(), .OUT(dout_high_O[2]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_high_hi[2]), .TIE_LO_ESD(dout_high_lo[2]),
    .HLD_H_N(dout_high_hi[2]), .ENABLE_H(dout_high_hi[2]),
    .DM({dout_high_hi[2], dout_high_hi[2], dout_high_lo[2]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_high_3 (
    .PAD(dout_high[3]), .IN(), .OUT(dout_high_O[3]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_high_hi[3]), .TIE_LO_ESD(dout_high_lo[3]),
    .HLD_H_N(dout_high_hi[3]), .ENABLE_H(dout_high_hi[3]),
    .DM({dout_high_hi[3], dout_high_hi[3], dout_high_lo[3]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_high_4 (
    .PAD(dout_high[4]), .IN(), .OUT(dout_high_O[4]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_high_hi[4]), .TIE_LO_ESD(dout_high_lo[4]),
    .HLD_H_N(dout_high_hi[4]), .ENABLE_H(dout_high_hi[4]),
    .DM({dout_high_hi[4], dout_high_hi[4], dout_high_lo[4]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_high_5 (
    .PAD(dout_high[5]), .IN(), .OUT(dout_high_O[5]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_high_hi[5]), .TIE_LO_ESD(dout_high_lo[5]),
    .HLD_H_N(dout_high_hi[5]), .ENABLE_H(dout_high_hi[5]),
    .DM({dout_high_hi[5], dout_high_hi[5], dout_high_lo[5]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_high_6 (
    .PAD(dout_high[6]), .IN(), .OUT(dout_high_O[6]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_high_hi[6]), .TIE_LO_ESD(dout_high_lo[6]),
    .HLD_H_N(dout_high_hi[6]), .ENABLE_H(dout_high_hi[6]),
    .DM({dout_high_hi[6], dout_high_hi[6], dout_high_lo[6]})
  );
  sky130_ef_io__gpiov2_pad PAD_dout_high_7 (
    .PAD(dout_high[7]), .IN(), .OUT(dout_high_O[7]),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(dout_high_hi[7]), .TIE_LO_ESD(dout_high_lo[7]),
    .HLD_H_N(dout_high_hi[7]), .ENABLE_H(dout_high_hi[7]),
    .DM({dout_high_hi[7], dout_high_hi[7], dout_high_lo[7]})
  );
 
  // --- saidas escalares ---
  sky130_ef_io__gpiov2_pad PAD_zero (
    .PAD(zero), .IN(), .OUT(zero_O),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(zero_hi), .TIE_LO_ESD(zero_lo),
    .HLD_H_N(zero_hi), .ENABLE_H(zero_hi),
    .DM({zero_hi, zero_hi, zero_lo})
  );
  sky130_ef_io__gpiov2_pad PAD_error (
    .PAD(error), .IN(), .OUT(error_O),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(error_hi), .TIE_LO_ESD(error_lo),
    .HLD_H_N(error_hi), .ENABLE_H(error_hi),
    .DM({error_hi, error_hi, error_lo})
  );
  sky130_ef_io__gpiov2_pad PAD_cpu_rdy (
    .PAD(cpu_rdy), .IN(), .OUT(cpu_rdy_O),
    .INP_DIS(1'b1), .OE_N(1'b0),
    .TIE_HI_ESD(cpu_rdy_hi), .TIE_LO_ESD(cpu_rdy_lo),
    .HLD_H_N(cpu_rdy_hi), .ENABLE_H(cpu_rdy_hi),
    .DM({cpu_rdy_hi, cpu_rdy_hi, cpu_rdy_lo})
  );
 
  // ===========================================================================
  // PADs de ALIMENTACAO (variantes _lvc clamped; strap interno liga o bond
  // pad ao rail). Instanciacao vazia: PG resolvido via globalNetConnect.
  //   _0 -> um lado    |   _1 -> lado oposto
  // ===========================================================================
  sky130_ef_io__vccd_lvc_pad  PAD_VDD_core_0 ();
  sky130_ef_io__vssd_lvc_pad  PAD_GND_core_0 ();
  sky130_ef_io__vddio_lvc_pad PAD_VDDR_io_0  ();
  sky130_ef_io__vssio_lvc_pad PAD_GNDR_io_0  ();
  sky130_ef_io__vccd_lvc_pad  PAD_VDD_core_1 ();
  sky130_ef_io__vssd_lvc_pad  PAD_GND_core_1 ();
  sky130_ef_io__vddio_lvc_pad PAD_VDDR_io_1  ();
  sky130_ef_io__vssio_lvc_pad PAD_GNDR_io_1  ();
 
  // ===========================================================================
  // Corners
  // ===========================================================================
  sky130_ef_io__corner_pad PAD_corner_ll ();
  sky130_ef_io__corner_pad PAD_corner_lr ();
  sky130_ef_io__corner_pad PAD_corner_ul ();
  sky130_ef_io__corner_pad PAD_corner_ur ();
 
endmodule
 

// model to follow
// // =============================================================================
// // PADs de ENTRADA
// // INP_DIS=0 (input ativo), OE_N=1 (output desabilitado), OUT=0 (amarrado)
// // HLD_H_N=hi (sem hold), ENABLE_H=hi (pad habilitado)
// // DM=110 (strong pull-up/pull-down, input buffer padrão)
// // =============================================================================

// sky130_ef_io__gpiov2_pad PAD_clock (
//     .PAD(clock),        .IN(clock_I),       .OUT(1'b0),
//     .INP_DIS(1'b0),     .OE_N(1'b1),
//     .TIE_HI_ESD(clock_hi),  .TIE_LO_ESD(clock_lo),
//     .HLD_H_N(clock_hi),     .ENABLE_H(clock_hi),
//     .DM({clock_hi, clock_hi, clock_lo})
// );

// // =============================================================================
// // PADs de SAÍDA
// // INP_DIS=1 (input desabilitado), OE_N=0 (output ativo), IN deixado aberto
// // =============================================================================

// sky130_ef_io__gpiov2_pad PAD_uart_tx (
//     .PAD(uart_tx),      .IN(),              .OUT(uart_tx_I),
//     .INP_DIS(1'b1),     .OE_N(1'b0),
//     .TIE_HI_ESD(uart_tx_hi),  .TIE_LO_ESD(uart_tx_lo),
//     .HLD_H_N(uart_tx_hi),     .ENABLE_H(uart_tx_hi),
//     .DM({uart_tx_hi, uart_tx_hi, uart_tx_lo})
// );

// // =============================================================================
// // PADs de ALIMENTAÇÃO (sky130_ef_io, variantes clamped — strap interno
// // já liga o bond pad ao rail correto). Instanciação vazia: PG via
// // globalNetConnect.
// //   set _0 -> lado TOP    |   set _1 -> lado RIGHT
// // =============================================================================

// sky130_ef_io__vccd_lvc_pad  PAD_VDD_core_0 ();
// sky130_ef_io__vssd_lvc_pad  PAD_GND_core_0 ();
// sky130_ef_io__vddio_lvc_pad PAD_VDDR_io_0  ();
// sky130_ef_io__vssio_lvc_pad PAD_GNDR_io_0  ();

// sky130_ef_io__vccd_lvc_pad  PAD_VDD_core_1 ();
// sky130_ef_io__vssd_lvc_pad  PAD_GND_core_1 ();
// sky130_ef_io__vddio_lvc_pad PAD_VDDR_io_1  ();
// sky130_ef_io__vssio_lvc_pad PAD_GNDR_io_1  ();

// // =============================================================================
// // Corners (sky130_ef_io__corner_pad, 200 x 204 — aritmética inteira)
// // =============================================================================

// sky130_ef_io__corner_pad PAD_corner_ll ();
// sky130_ef_io__corner_pad PAD_corner_lr ();
// sky130_ef_io__corner_pad PAD_corner_ul ();
// sky130_ef_io__corner_pad PAD_corner_ur ();