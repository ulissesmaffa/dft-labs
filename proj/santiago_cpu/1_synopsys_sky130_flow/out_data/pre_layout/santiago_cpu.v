/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP5-4
// Date      : Thu Jul  9 14:38:59 2026
/////////////////////////////////////////////////////////////


module mux4_WIDTH8_1 ( din1, din2, din3, din4, select, dout );
  input [7:0] din1;
  input [7:0] din2;
  input [7:0] din3;
  input [7:0] din4;
  input [1:0] select;
  output [7:0] dout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  sky130_fd_sc_hd__inv_1 U1 ( .A(select[0]), .Y(n1) );
  sky130_fd_sc_hd__nor2_1 U2 ( .A(select[1]), .B(n1), .Y(n18) );
  sky130_fd_sc_hd__inv_1 U3 ( .A(select[1]), .Y(n2) );
  sky130_fd_sc_hd__nor2_1 U4 ( .A(n2), .B(n1), .Y(n17) );
  sky130_fd_sc_hd__a22oi_1 U5 ( .A1(n18), .A2(din2[0]), .B1(n17), .B2(din4[0]), 
        .Y(n4) );
  sky130_fd_sc_hd__nor2_1 U6 ( .A(select[1]), .B(select[0]), .Y(n20) );
  sky130_fd_sc_hd__nor2_1 U7 ( .A(select[0]), .B(n2), .Y(n19) );
  sky130_fd_sc_hd__a22oi_1 U8 ( .A1(n20), .A2(din1[0]), .B1(n19), .B2(din3[0]), 
        .Y(n3) );
  sky130_fd_sc_hd__nand2_1 U9 ( .A(n4), .B(n3), .Y(dout[0]) );
  sky130_fd_sc_hd__a22oi_1 U10 ( .A1(n18), .A2(din2[1]), .B1(n17), .B2(din4[1]), .Y(n6) );
  sky130_fd_sc_hd__a22oi_1 U11 ( .A1(n20), .A2(din1[1]), .B1(n19), .B2(din3[1]), .Y(n5) );
  sky130_fd_sc_hd__nand2_1 U12 ( .A(n6), .B(n5), .Y(dout[1]) );
  sky130_fd_sc_hd__a22oi_1 U13 ( .A1(n18), .A2(din2[2]), .B1(n17), .B2(din4[2]), .Y(n8) );
  sky130_fd_sc_hd__a22oi_1 U14 ( .A1(n20), .A2(din1[2]), .B1(n19), .B2(din3[2]), .Y(n7) );
  sky130_fd_sc_hd__nand2_1 U15 ( .A(n8), .B(n7), .Y(dout[2]) );
  sky130_fd_sc_hd__a22oi_1 U16 ( .A1(n18), .A2(din2[3]), .B1(n17), .B2(din4[3]), .Y(n10) );
  sky130_fd_sc_hd__a22oi_1 U17 ( .A1(n20), .A2(din1[3]), .B1(n19), .B2(din3[3]), .Y(n9) );
  sky130_fd_sc_hd__nand2_1 U18 ( .A(n10), .B(n9), .Y(dout[3]) );
  sky130_fd_sc_hd__a22oi_1 U19 ( .A1(n18), .A2(din2[4]), .B1(n17), .B2(din4[4]), .Y(n12) );
  sky130_fd_sc_hd__a22oi_1 U20 ( .A1(n20), .A2(din1[4]), .B1(n19), .B2(din3[4]), .Y(n11) );
  sky130_fd_sc_hd__nand2_1 U21 ( .A(n12), .B(n11), .Y(dout[4]) );
  sky130_fd_sc_hd__a22oi_1 U22 ( .A1(n18), .A2(din2[5]), .B1(n17), .B2(din4[5]), .Y(n14) );
  sky130_fd_sc_hd__a22oi_1 U23 ( .A1(n20), .A2(din1[5]), .B1(n19), .B2(din3[5]), .Y(n13) );
  sky130_fd_sc_hd__nand2_1 U24 ( .A(n14), .B(n13), .Y(dout[5]) );
  sky130_fd_sc_hd__a22oi_1 U25 ( .A1(n18), .A2(din2[6]), .B1(n17), .B2(din4[6]), .Y(n16) );
  sky130_fd_sc_hd__a22oi_1 U26 ( .A1(n20), .A2(din1[6]), .B1(n19), .B2(din3[6]), .Y(n15) );
  sky130_fd_sc_hd__nand2_1 U27 ( .A(n16), .B(n15), .Y(dout[6]) );
  sky130_fd_sc_hd__a22oi_1 U28 ( .A1(n18), .A2(din2[7]), .B1(n17), .B2(din4[7]), .Y(n22) );
  sky130_fd_sc_hd__a22oi_1 U29 ( .A1(n20), .A2(din1[7]), .B1(n19), .B2(din3[7]), .Y(n21) );
  sky130_fd_sc_hd__nand2_1 U30 ( .A(n22), .B(n21), .Y(dout[7]) );
endmodule


module register_bank_WIDTH8_test_0 ( clk, rst, in, out, wr_en_BAR, test_si, 
        test_se );
  input [7:0] in;
  output [7:0] out;
  input clk, rst, wr_en_BAR, test_si, test_se;
  wire   n5, n8, n11, n14, n17, n20, n23, n26, n1, n2, n3, n6, n7, n9, n10,
         n12, n13, n15, n16, n18, n19, n21, n22, n24, n25, n27;

  sky130_fd_sc_hd__sdfrtp_1 out_reg_7_ ( .D(n26), .SCD(out[6]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[7]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_6_ ( .D(n23), .SCD(out[5]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[6]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_5_ ( .D(n20), .SCD(out[4]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[5]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_4_ ( .D(n17), .SCD(out[3]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[4]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_3_ ( .D(n14), .SCD(out[2]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[3]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_2_ ( .D(n11), .SCD(out[1]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[2]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_1_ ( .D(n8), .SCD(out[0]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[1]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_0_ ( .D(n5), .SCD(test_si), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[0]) );
  sky130_fd_sc_hd__inv_1 U2 ( .A(wr_en_BAR), .Y(n25) );
  sky130_fd_sc_hd__inv_1 U4 ( .A(rst), .Y(n27) );
  sky130_fd_sc_hd__inv_1 U5 ( .A(out[0]), .Y(n2) );
  sky130_fd_sc_hd__nand2_1 U6 ( .A(in[0]), .B(n25), .Y(n1) );
  sky130_fd_sc_hd__o21ai_1 U7 ( .A1(n25), .A2(n2), .B1(n1), .Y(n5) );
  sky130_fd_sc_hd__inv_1 U8 ( .A(out[1]), .Y(n6) );
  sky130_fd_sc_hd__nand2_1 U9 ( .A(in[1]), .B(n25), .Y(n3) );
  sky130_fd_sc_hd__o21ai_1 U10 ( .A1(n25), .A2(n6), .B1(n3), .Y(n8) );
  sky130_fd_sc_hd__inv_1 U11 ( .A(out[2]), .Y(n9) );
  sky130_fd_sc_hd__nand2_1 U12 ( .A(in[2]), .B(n25), .Y(n7) );
  sky130_fd_sc_hd__o21ai_1 U13 ( .A1(n25), .A2(n9), .B1(n7), .Y(n11) );
  sky130_fd_sc_hd__inv_1 U14 ( .A(out[3]), .Y(n12) );
  sky130_fd_sc_hd__nand2_1 U15 ( .A(in[3]), .B(n25), .Y(n10) );
  sky130_fd_sc_hd__o21ai_1 U16 ( .A1(n25), .A2(n12), .B1(n10), .Y(n14) );
  sky130_fd_sc_hd__inv_1 U17 ( .A(out[4]), .Y(n15) );
  sky130_fd_sc_hd__nand2_1 U18 ( .A(in[4]), .B(n25), .Y(n13) );
  sky130_fd_sc_hd__o21ai_1 U19 ( .A1(n25), .A2(n15), .B1(n13), .Y(n17) );
  sky130_fd_sc_hd__inv_1 U20 ( .A(out[5]), .Y(n18) );
  sky130_fd_sc_hd__nand2_1 U21 ( .A(in[5]), .B(n25), .Y(n16) );
  sky130_fd_sc_hd__o21ai_1 U22 ( .A1(n25), .A2(n18), .B1(n16), .Y(n20) );
  sky130_fd_sc_hd__inv_1 U23 ( .A(out[6]), .Y(n21) );
  sky130_fd_sc_hd__nand2_1 U24 ( .A(in[6]), .B(n25), .Y(n19) );
  sky130_fd_sc_hd__o21ai_1 U25 ( .A1(n25), .A2(n21), .B1(n19), .Y(n23) );
  sky130_fd_sc_hd__inv_1 U26 ( .A(out[7]), .Y(n24) );
  sky130_fd_sc_hd__nand2_1 U27 ( .A(in[7]), .B(n25), .Y(n22) );
  sky130_fd_sc_hd__o21ai_1 U28 ( .A1(n25), .A2(n24), .B1(n22), .Y(n26) );
endmodule


module mux4_registered_WIDTH8_test_0 ( clk, rst, sel, in1, in2, in3, in4, out, 
        wr_en_BAR, test_si, test_se );
  input [1:0] sel;
  input [7:0] in1;
  input [7:0] in2;
  input [7:0] in3;
  input [7:0] in4;
  output [7:0] out;
  input clk, rst, wr_en_BAR, test_si, test_se;

  wire   [7:0] w_out;

  mux4_WIDTH8_1 uu_mux4 ( .din1(in1), .din2(in2), .din3(in3), .din4(in4), 
        .select(sel), .dout(w_out) );
  register_bank_WIDTH8_test_0 uu_rb ( .clk(clk), .rst(rst), .in(w_out), .out(
        out), .wr_en_BAR(wr_en_BAR), .test_si(test_si), .test_se(test_se) );
endmodule


module mux4_WIDTH8_0 ( din1, din2, din3, din4, select, dout );
  input [7:0] din1;
  input [7:0] din2;
  input [7:0] din3;
  input [7:0] din4;
  input [1:0] select;
  output [7:0] dout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  sky130_fd_sc_hd__inv_1 U1 ( .A(select[0]), .Y(n1) );
  sky130_fd_sc_hd__nor2_1 U2 ( .A(select[1]), .B(n1), .Y(n18) );
  sky130_fd_sc_hd__inv_1 U3 ( .A(select[1]), .Y(n2) );
  sky130_fd_sc_hd__nor2_1 U4 ( .A(n2), .B(n1), .Y(n17) );
  sky130_fd_sc_hd__a22oi_1 U5 ( .A1(n18), .A2(din2[0]), .B1(n17), .B2(din4[0]), 
        .Y(n4) );
  sky130_fd_sc_hd__nor2_1 U6 ( .A(select[1]), .B(select[0]), .Y(n20) );
  sky130_fd_sc_hd__nor2_1 U7 ( .A(select[0]), .B(n2), .Y(n19) );
  sky130_fd_sc_hd__a22oi_1 U8 ( .A1(n20), .A2(din1[0]), .B1(n19), .B2(din3[0]), 
        .Y(n3) );
  sky130_fd_sc_hd__nand2_1 U9 ( .A(n4), .B(n3), .Y(dout[0]) );
  sky130_fd_sc_hd__a22oi_1 U10 ( .A1(n18), .A2(din2[1]), .B1(n17), .B2(din4[1]), .Y(n6) );
  sky130_fd_sc_hd__a22oi_1 U11 ( .A1(n20), .A2(din1[1]), .B1(n19), .B2(din3[1]), .Y(n5) );
  sky130_fd_sc_hd__nand2_1 U12 ( .A(n6), .B(n5), .Y(dout[1]) );
  sky130_fd_sc_hd__a22oi_1 U13 ( .A1(n18), .A2(din2[2]), .B1(n17), .B2(din4[2]), .Y(n8) );
  sky130_fd_sc_hd__a22oi_1 U14 ( .A1(n20), .A2(din1[2]), .B1(n19), .B2(din3[2]), .Y(n7) );
  sky130_fd_sc_hd__nand2_1 U15 ( .A(n8), .B(n7), .Y(dout[2]) );
  sky130_fd_sc_hd__a22oi_1 U16 ( .A1(n18), .A2(din2[3]), .B1(n17), .B2(din4[3]), .Y(n10) );
  sky130_fd_sc_hd__a22oi_1 U17 ( .A1(n20), .A2(din1[3]), .B1(n19), .B2(din3[3]), .Y(n9) );
  sky130_fd_sc_hd__nand2_1 U18 ( .A(n10), .B(n9), .Y(dout[3]) );
  sky130_fd_sc_hd__a22oi_1 U19 ( .A1(n18), .A2(din2[4]), .B1(n17), .B2(din4[4]), .Y(n12) );
  sky130_fd_sc_hd__a22oi_1 U20 ( .A1(n20), .A2(din1[4]), .B1(n19), .B2(din3[4]), .Y(n11) );
  sky130_fd_sc_hd__nand2_1 U21 ( .A(n12), .B(n11), .Y(dout[4]) );
  sky130_fd_sc_hd__a22oi_1 U22 ( .A1(n18), .A2(din2[5]), .B1(n17), .B2(din4[5]), .Y(n14) );
  sky130_fd_sc_hd__a22oi_1 U23 ( .A1(n20), .A2(din1[5]), .B1(n19), .B2(din3[5]), .Y(n13) );
  sky130_fd_sc_hd__nand2_1 U24 ( .A(n14), .B(n13), .Y(dout[5]) );
  sky130_fd_sc_hd__a22oi_1 U25 ( .A1(n18), .A2(din2[6]), .B1(n17), .B2(din4[6]), .Y(n16) );
  sky130_fd_sc_hd__a22oi_1 U26 ( .A1(n20), .A2(din1[6]), .B1(n19), .B2(din3[6]), .Y(n15) );
  sky130_fd_sc_hd__nand2_1 U27 ( .A(n16), .B(n15), .Y(dout[6]) );
  sky130_fd_sc_hd__a22oi_1 U28 ( .A1(n18), .A2(din2[7]), .B1(n17), .B2(din4[7]), .Y(n22) );
  sky130_fd_sc_hd__a22oi_1 U29 ( .A1(n20), .A2(din1[7]), .B1(n19), .B2(din3[7]), .Y(n21) );
  sky130_fd_sc_hd__nand2_1 U30 ( .A(n22), .B(n21), .Y(dout[7]) );
endmodule


module register_bank_WIDTH8_test_1 ( clk, rst, in, out, wr_en_BAR, test_si, 
        test_se );
  input [7:0] in;
  output [7:0] out;
  input clk, rst, wr_en_BAR, test_si, test_se;
  wire   n1, n2, n3, n6, n7, n9, n10, n12, n13, n15, n16, n18, n19, n21, n22,
         n24, n25, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  sky130_fd_sc_hd__sdfrtp_1 out_reg_3_ ( .D(n32), .SCD(out[2]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[3]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_2_ ( .D(n33), .SCD(out[1]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[2]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_1_ ( .D(n34), .SCD(out[0]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[1]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_0_ ( .D(n35), .SCD(test_si), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[0]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_6_ ( .D(n29), .SCD(out[5]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[6]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_7_ ( .D(n28), .SCD(out[6]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[7]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_5_ ( .D(n30), .SCD(out[4]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[5]) );
  sky130_fd_sc_hd__sdfrtp_1 out_reg_4_ ( .D(n31), .SCD(out[3]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n27), .Q(out[4]) );
  sky130_fd_sc_hd__inv_1 U2 ( .A(wr_en_BAR), .Y(n25) );
  sky130_fd_sc_hd__inv_1 U4 ( .A(rst), .Y(n27) );
  sky130_fd_sc_hd__inv_1 U5 ( .A(out[0]), .Y(n2) );
  sky130_fd_sc_hd__nand2_1 U6 ( .A(in[0]), .B(n25), .Y(n1) );
  sky130_fd_sc_hd__o21ai_1 U7 ( .A1(n25), .A2(n2), .B1(n1), .Y(n35) );
  sky130_fd_sc_hd__inv_1 U8 ( .A(out[1]), .Y(n6) );
  sky130_fd_sc_hd__nand2_1 U9 ( .A(in[1]), .B(n25), .Y(n3) );
  sky130_fd_sc_hd__inv_1 U11 ( .A(out[2]), .Y(n9) );
  sky130_fd_sc_hd__nand2_1 U12 ( .A(in[2]), .B(n25), .Y(n7) );
  sky130_fd_sc_hd__o21ai_1 U13 ( .A1(n25), .A2(n9), .B1(n7), .Y(n33) );
  sky130_fd_sc_hd__inv_1 U14 ( .A(out[3]), .Y(n12) );
  sky130_fd_sc_hd__nand2_1 U15 ( .A(in[3]), .B(n25), .Y(n10) );
  sky130_fd_sc_hd__o21ai_1 U16 ( .A1(n25), .A2(n12), .B1(n10), .Y(n32) );
  sky130_fd_sc_hd__inv_1 U17 ( .A(out[4]), .Y(n15) );
  sky130_fd_sc_hd__nand2_1 U18 ( .A(in[4]), .B(n25), .Y(n13) );
  sky130_fd_sc_hd__inv_1 U20 ( .A(out[5]), .Y(n18) );
  sky130_fd_sc_hd__nand2_1 U21 ( .A(in[5]), .B(n25), .Y(n16) );
  sky130_fd_sc_hd__o21ai_1 U22 ( .A1(n25), .A2(n18), .B1(n16), .Y(n30) );
  sky130_fd_sc_hd__inv_1 U23 ( .A(out[6]), .Y(n21) );
  sky130_fd_sc_hd__nand2_1 U24 ( .A(in[6]), .B(n25), .Y(n19) );
  sky130_fd_sc_hd__o21ai_1 U25 ( .A1(n25), .A2(n21), .B1(n19), .Y(n29) );
  sky130_fd_sc_hd__inv_1 U26 ( .A(out[7]), .Y(n24) );
  sky130_fd_sc_hd__nand2_1 U27 ( .A(in[7]), .B(n25), .Y(n22) );
  sky130_fd_sc_hd__o21ai_1 U28 ( .A1(n25), .A2(n24), .B1(n22), .Y(n28) );
  sky130_fd_sc_hd__o21ai_0 U3 ( .A1(n25), .A2(n15), .B1(n13), .Y(n31) );
  sky130_fd_sc_hd__o21ai_0 U10 ( .A1(n25), .A2(n6), .B1(n3), .Y(n34) );
endmodule


module mux4_registered_WIDTH8_test_1 ( clk, rst, sel, in1, in2, in3, in4, out, 
        wr_en_BAR, test_si, test_se );
  input [1:0] sel;
  input [7:0] in1;
  input [7:0] in2;
  input [7:0] in3;
  input [7:0] in4;
  output [7:0] out;
  input clk, rst, wr_en_BAR, test_si, test_se;

  wire   [7:0] w_out;

  mux4_WIDTH8_0 uu_mux4 ( .din1(in1), .din2(in2), .din3(in3), .din4(in4), 
        .select(sel), .dout(w_out) );
  register_bank_WIDTH8_test_1 uu_rb ( .clk(clk), .rst(rst), .in(w_out), .out(
        out), .wr_en_BAR(wr_en_BAR), .test_si(test_si), .test_se(test_se) );
endmodule


module alu_WIDTH8 ( in1, in2, op, invalid_data, out, zero, error );
  input [7:0] in1;
  input [7:0] in2;
  input [3:0] op;
  output [15:0] out;
  input invalid_data;
  output zero, error;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n322, n323, n324,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n62, n190, n303
;

  sky130_fd_sc_hd__fa_1 U3 ( .A(n471), .B(n470), .CIN(n469), .COUT(n481), 
        .SUM(n478) );
  sky130_fd_sc_hd__mux2i_1 U4 ( .A0(n159), .A1(n158), .S(n157), .Y(n234) );
  sky130_fd_sc_hd__inv_4 U5 ( .A(n274), .Y(n2) );
  sky130_fd_sc_hd__buf_4 U6 ( .A(in2[2]), .X(n274) );
  sky130_fd_sc_hd__clkbuf_1 U7 ( .A(n256), .X(n257) );
  sky130_fd_sc_hd__nor2_1 U9 ( .A(n570), .B(n545), .Y(n275) );
  sky130_fd_sc_hd__nand2_1 U10 ( .A(in2[1]), .B(in1[1]), .Y(n375) );
  sky130_fd_sc_hd__inv_2 U11 ( .A(in2[3]), .Y(n1) );
  sky130_fd_sc_hd__inv_1 U12 ( .A(n632), .Y(n614) );
  sky130_fd_sc_hd__a21oi_2 U14 ( .A1(n480), .A2(n639), .B1(n479), .Y(n655) );
  sky130_fd_sc_hd__inv_1 U15 ( .A(n38), .Y(n670) );
  sky130_fd_sc_hd__inv_1 U17 ( .A(n230), .Y(n545) );
  sky130_fd_sc_hd__inv_1 U18 ( .A(n277), .Y(n276) );
  sky130_fd_sc_hd__inv_1 U19 ( .A(n639), .Y(n646) );
  sky130_fd_sc_hd__or2_0 U20 ( .A(n72), .B(n73), .X(n572) );
  sky130_fd_sc_hd__or2_0 U21 ( .A(n493), .B(n494), .X(n651) );
  sky130_fd_sc_hd__inv_1 U22 ( .A(n330), .Y(n270) );
  sky130_fd_sc_hd__inv_1 U23 ( .A(n329), .Y(n242) );
  sky130_fd_sc_hd__inv_1 U24 ( .A(n111), .Y(n124) );
  sky130_fd_sc_hd__inv_2 U25 ( .A(in1[5]), .Y(n416) );
  sky130_fd_sc_hd__o21ai_1 U26 ( .A1(n300), .A2(n299), .B1(n298), .Y(n301) );
  sky130_fd_sc_hd__a22o_1 U28 ( .A1(n276), .A2(n278), .B1(n275), .B2(n279), 
        .X(n284) );
  sky130_fd_sc_hd__nor3_1 U29 ( .A(in1[3]), .B(n545), .C(n247), .Y(n248) );
  sky130_fd_sc_hd__nor2_1 U30 ( .A(n570), .B(n230), .Y(n280) );
  sky130_fd_sc_hd__o21ai_1 U31 ( .A1(n226), .A2(n225), .B1(n286), .Y(n230) );
  sky130_fd_sc_hd__nand3_1 U32 ( .A(n224), .B(n223), .C(n222), .Y(n286) );
  sky130_fd_sc_hd__o22a_1 U33 ( .A1(n221), .A2(n220), .B1(n210), .B2(n234), 
        .X(n211) );
  sky130_fd_sc_hd__inv_1 U34 ( .A(n265), .Y(n267) );
  sky130_fd_sc_hd__inv_1 U36 ( .A(n698), .Y(n681) );
  sky130_fd_sc_hd__inv_1 U37 ( .A(n565), .Y(n171) );
  sky130_fd_sc_hd__mux2i_1 U38 ( .A0(n671), .A1(n4), .S(n670), .Y(n679) );
  sky130_fd_sc_hd__and2_1 U39 ( .A(n670), .B(n4), .X(n508) );
  sky130_fd_sc_hd__mux2_2 U40 ( .A0(n382), .A1(n381), .S(n670), .X(n383) );
  sky130_fd_sc_hd__o21ai_1 U41 ( .A1(n39), .A2(n104), .B1(n38), .Y(n672) );
  sky130_fd_sc_hd__inv_1 U42 ( .A(n506), .Y(n598) );
  sky130_fd_sc_hd__nand2_1 U43 ( .A(n3), .B(in1[7]), .Y(n148) );
  sky130_fd_sc_hd__inv_1 U44 ( .A(n583), .Y(n588) );
  sky130_fd_sc_hd__inv_1 U45 ( .A(n537), .Y(n585) );
  sky130_fd_sc_hd__inv_1 U46 ( .A(n668), .Y(n596) );
  sky130_fd_sc_hd__inv_1 U47 ( .A(n378), .Y(n380) );
  sky130_fd_sc_hd__inv_1 U48 ( .A(n538), .Y(n539) );
  sky130_fd_sc_hd__inv_1 U49 ( .A(n555), .Y(n556) );
  sky130_fd_sc_hd__xnor2_1 U50 ( .A(n136), .B(n207), .Y(n341) );
  sky130_fd_sc_hd__inv_1 U51 ( .A(n514), .Y(n515) );
  sky130_fd_sc_hd__inv_1 U52 ( .A(n513), .Y(n22) );
  sky130_fd_sc_hd__inv_1 U53 ( .A(n31), .Y(n32) );
  sky130_fd_sc_hd__inv_1 U54 ( .A(n597), .Y(n599) );
  sky130_fd_sc_hd__inv_1 U55 ( .A(n535), .Y(n580) );
  sky130_fd_sc_hd__or2_0 U56 ( .A(n371), .B(n370), .X(n372) );
  sky130_fd_sc_hd__inv_1 U57 ( .A(n581), .Y(n536) );
  sky130_fd_sc_hd__inv_1 U58 ( .A(n576), .Y(n578) );
  sky130_fd_sc_hd__inv_1 U59 ( .A(n375), .Y(n69) );
  sky130_fd_sc_hd__inv_1 U60 ( .A(n579), .Y(n56) );
  sky130_fd_sc_hd__inv_1 U61 ( .A(n577), .Y(n97) );
  sky130_fd_sc_hd__inv_1 U62 ( .A(n374), .Y(n376) );
  sky130_fd_sc_hd__inv_1 U63 ( .A(n551), .Y(n554) );
  sky130_fd_sc_hd__inv_1 U64 ( .A(n594), .Y(n441) );
  sky130_fd_sc_hd__inv_1 U65 ( .A(n547), .Y(n549) );
  sky130_fd_sc_hd__inv_1 U66 ( .A(n659), .Y(n510) );
  sky130_fd_sc_hd__inv_1 U67 ( .A(n661), .Y(n493) );
  sky130_fd_sc_hd__inv_1 U68 ( .A(n663), .Y(n421) );
  sky130_fd_sc_hd__inv_1 U69 ( .A(n546), .Y(n595) );
  sky130_fd_sc_hd__inv_1 U70 ( .A(n548), .Y(n409) );
  sky130_fd_sc_hd__inv_1 U71 ( .A(n662), .Y(n13) );
  sky130_fd_sc_hd__inv_1 U72 ( .A(n377), .Y(n323) );
  sky130_fd_sc_hd__nand2_1 U73 ( .A(in2[3]), .B(in1[3]), .Y(n577) );
  sky130_fd_sc_hd__nor2_1 U74 ( .A(in2[5]), .B(in2[7]), .Y(n110) );
  sky130_fd_sc_hd__nand2_1 U75 ( .A(in2[5]), .B(in1[5]), .Y(n548) );
  sky130_fd_sc_hd__and2_1 U76 ( .A(n123), .B(n524), .X(n3) );
  sky130_fd_sc_hd__o21a_1 U77 ( .A1(n507), .A2(n506), .B1(n505), .X(n4) );
  sky130_fd_sc_hd__or4_4 U78 ( .A(n685), .B(n682), .C(n687), .D(n695), .X(n5)
         );
  sky130_fd_sc_hd__inv_2 U79 ( .A(in1[7]), .Y(n417) );
  sky130_fd_sc_hd__nand2_1 U80 ( .A(in2[4]), .B(in1[4]), .Y(n594) );
  sky130_fd_sc_hd__o22a_1 U81 ( .A1(n266), .A2(n286), .B1(n265), .B2(n264), 
        .X(n6) );
  sky130_fd_sc_hd__xnor2_1 U83 ( .A(in2[0]), .B(n15), .Y(n329) );
  sky130_fd_sc_hd__fa_1 U84 ( .A(n441), .B(n440), .CIN(n439), .COUT(n433), 
        .SUM(n464) );
  sky130_fd_sc_hd__nand2_1 U85 ( .A(n415), .B(in1[7]), .Y(n500) );
  sky130_fd_sc_hd__nand2_1 U86 ( .A(n171), .B(n168), .Y(n147) );
  sky130_fd_sc_hd__nand2_1 U87 ( .A(n24), .B(in1[5]), .Y(n25) );
  sky130_fd_sc_hd__nor2_1 U88 ( .A(in2[6]), .B(in2[4]), .Y(n109) );
  sky130_fd_sc_hd__nand2_1 U89 ( .A(in2[7]), .B(in1[7]), .Y(n661) );
  sky130_fd_sc_hd__nand2_1 U90 ( .A(in2[6]), .B(in1[6]), .Y(n663) );
  sky130_fd_sc_hd__nand2_1 U91 ( .A(n513), .B(n504), .Y(n507) );
  sky130_fd_sc_hd__nor2_1 U92 ( .A(n227), .B(n275), .Y(n354) );
  sky130_fd_sc_hd__nand2_1 U93 ( .A(n274), .B(in1[2]), .Y(n579) );
  sky130_fd_sc_hd__nand2_1 U94 ( .A(n595), .B(n594), .Y(n597) );
  sky130_fd_sc_hd__nand2_1 U95 ( .A(n13), .B(n661), .Y(n31) );
  sky130_fd_sc_hd__nand3_1 U96 ( .A(n128), .B(n127), .C(n126), .Y(n129) );
  sky130_fd_sc_hd__nand2_1 U97 ( .A(n578), .B(n577), .Y(n583) );
  sky130_fd_sc_hd__o21ai_1 U98 ( .A1(n221), .A2(n187), .B1(n186), .Y(n226) );
  sky130_fd_sc_hd__mux2_2 U100 ( .A0(n35), .A1(n34), .S(n670), .X(n40) );
  sky130_fd_sc_hd__buf_2 U101 ( .A(n226), .X(n570) );
  sky130_fd_sc_hd__nand2_1 U102 ( .A(n301), .B(n415), .Y(n386) );
  sky130_fd_sc_hd__o211ai_1 U103 ( .A1(n608), .A2(n386), .B1(n385), .C1(n384), 
        .Y(out[1]) );
  sky130_fd_sc_hd__nand4_1 U104 ( .A(n369), .B(n368), .C(n367), .D(n366), .Y(
        out[0]) );
  sky130_fd_sc_hd__nor2_1 U106 ( .A(in1[3]), .B(in2[3]), .Y(n576) );
  sky130_fd_sc_hd__nor2_1 U107 ( .A(in1[2]), .B(n274), .Y(n581) );
  sky130_fd_sc_hd__nor2_1 U108 ( .A(n576), .B(n581), .Y(n8) );
  sky130_fd_sc_hd__nand2_1 U109 ( .A(in2[0]), .B(in1[0]), .Y(n377) );
  sky130_fd_sc_hd__nor2_1 U110 ( .A(in1[1]), .B(in2[1]), .Y(n374) );
  sky130_fd_sc_hd__o21ai_1 U111 ( .A1(n377), .A2(n374), .B1(n375), .Y(n535) );
  sky130_fd_sc_hd__o21ai_1 U112 ( .A1(n579), .A2(n576), .B1(n577), .Y(n7) );
  sky130_fd_sc_hd__a21oi_1 U113 ( .A1(n8), .A2(n535), .B1(n7), .Y(n668) );
  sky130_fd_sc_hd__nor2_1 U114 ( .A(in1[6]), .B(in2[6]), .Y(n659) );
  sky130_fd_sc_hd__nor2_1 U115 ( .A(in1[4]), .B(in2[4]), .Y(n546) );
  sky130_fd_sc_hd__nor2_1 U116 ( .A(in1[5]), .B(in2[5]), .Y(n547) );
  sky130_fd_sc_hd__nor2_1 U117 ( .A(n546), .B(n547), .Y(n660) );
  sky130_fd_sc_hd__inv_1 U118 ( .A(n660), .Y(n9) );
  sky130_fd_sc_hd__nor2_1 U119 ( .A(n659), .B(n9), .Y(n12) );
  sky130_fd_sc_hd__o21ai_1 U120 ( .A1(n594), .A2(n547), .B1(n548), .Y(n666) );
  sky130_fd_sc_hd__inv_1 U121 ( .A(n666), .Y(n10) );
  sky130_fd_sc_hd__o21ai_1 U122 ( .A1(n659), .A2(n10), .B1(n663), .Y(n11) );
  sky130_fd_sc_hd__a21oi_1 U123 ( .A1(n596), .A2(n12), .B1(n11), .Y(n14) );
  sky130_fd_sc_hd__nor2_1 U124 ( .A(in1[7]), .B(in2[7]), .Y(n662) );
  sky130_fd_sc_hd__xor2_1 U125 ( .A(n14), .B(n31), .X(n35) );
  sky130_fd_sc_hd__nor2_1 U126 ( .A(in1[3]), .B(n1), .Y(n19) );
  sky130_fd_sc_hd__nor2_1 U127 ( .A(in1[2]), .B(n2), .Y(n586) );
  sky130_fd_sc_hd__nor2_1 U128 ( .A(n19), .B(n586), .Y(n21) );
  sky130_fd_sc_hd__inv_2 U129 ( .A(in2[0]), .Y(n364) );
  sky130_fd_sc_hd__nor2_1 U130 ( .A(in1[0]), .B(n364), .Y(n379) );
  sky130_fd_sc_hd__inv_2 U131 ( .A(in2[1]), .Y(n15) );
  sky130_fd_sc_hd__nor2_1 U132 ( .A(in1[1]), .B(n15), .Y(n17) );
  sky130_fd_sc_hd__nand2_1 U133 ( .A(n15), .B(in1[1]), .Y(n16) );
  sky130_fd_sc_hd__o21ai_1 U134 ( .A1(n379), .A2(n17), .B1(n16), .Y(n537) );
  sky130_fd_sc_hd__nand2_1 U135 ( .A(n2), .B(in1[2]), .Y(n584) );
  sky130_fd_sc_hd__nand2_1 U136 ( .A(n1), .B(in1[3]), .Y(n18) );
  sky130_fd_sc_hd__o21ai_1 U137 ( .A1(n584), .A2(n19), .B1(n18), .Y(n20) );
  sky130_fd_sc_hd__a21oi_1 U138 ( .A1(n21), .A2(n537), .B1(n20), .Y(n506) );
  sky130_fd_sc_hd__nor2_1 U139 ( .A(in1[6]), .B(n27), .Y(n499) );
  sky130_fd_sc_hd__inv_2 U140 ( .A(in2[4]), .Y(n23) );
  sky130_fd_sc_hd__nor2_1 U141 ( .A(in1[4]), .B(n23), .Y(n551) );
  sky130_fd_sc_hd__inv_2 U142 ( .A(in2[5]), .Y(n24) );
  sky130_fd_sc_hd__nor2_1 U143 ( .A(in1[5]), .B(n24), .Y(n26) );
  sky130_fd_sc_hd__nor2_1 U144 ( .A(n551), .B(n26), .Y(n513) );
  sky130_fd_sc_hd__nor2_1 U145 ( .A(n499), .B(n22), .Y(n30) );
  sky130_fd_sc_hd__nand2_1 U146 ( .A(n23), .B(in1[4]), .Y(n552) );
  sky130_fd_sc_hd__o21ai_1 U147 ( .A1(n552), .A2(n26), .B1(n25), .Y(n512) );
  sky130_fd_sc_hd__inv_1 U148 ( .A(n512), .Y(n28) );
  sky130_fd_sc_hd__nand2_1 U149 ( .A(n27), .B(in1[6]), .Y(n502) );
  sky130_fd_sc_hd__a21oi_1 U151 ( .A1(n598), .A2(n30), .B1(n29), .Y(n33) );
  sky130_fd_sc_hd__xor2_1 U152 ( .A(n33), .B(n32), .X(n34) );
  sky130_fd_sc_hd__nor2_1 U153 ( .A(op[0]), .B(op[2]), .Y(n108) );
  sky130_fd_sc_hd__inv_1 U154 ( .A(op[3]), .Y(n37) );
  sky130_fd_sc_hd__nand3_1 U155 ( .A(n108), .B(op[1]), .C(n37), .Y(n38) );
  sky130_fd_sc_hd__inv_1 U156 ( .A(op[2]), .Y(n36) );
  sky130_fd_sc_hd__nand2_1 U157 ( .A(n36), .B(op[0]), .Y(n39) );
  sky130_fd_sc_hd__inv_1 U158 ( .A(op[1]), .Y(n107) );
  sky130_fd_sc_hd__nand2_1 U159 ( .A(n107), .B(n37), .Y(n104) );
  sky130_fd_sc_hd__nand2_1 U160 ( .A(n40), .B(n672), .Y(n120) );
  sky130_fd_sc_hd__nor2_1 U161 ( .A(n99), .B(n1), .Y(n58) );
  sky130_fd_sc_hd__inv_1 U162 ( .A(in1[3]), .Y(n400) );
  sky130_fd_sc_hd__nor2_1 U163 ( .A(n400), .B(n15), .Y(n57) );
  sky130_fd_sc_hd__nor2_1 U164 ( .A(n416), .B(n364), .Y(n48) );
  sky130_fd_sc_hd__inv_1 U165 ( .A(in1[4]), .Y(n411) );
  sky130_fd_sc_hd__nor2_1 U166 ( .A(n411), .B(n15), .Y(n47) );
  sky130_fd_sc_hd__nor2_1 U167 ( .A(n400), .B(n2), .Y(n46) );
  sky130_fd_sc_hd__inv_1 U168 ( .A(in1[2]), .Y(n390) );
  sky130_fd_sc_hd__nor2_1 U169 ( .A(n390), .B(n1), .Y(n43) );
  sky130_fd_sc_hd__nor2_1 U170 ( .A(n411), .B(n364), .Y(n51) );
  sky130_fd_sc_hd__inv_1 U171 ( .A(in1[0]), .Y(n92) );
  sky130_fd_sc_hd__nor2_1 U172 ( .A(n92), .B(n23), .Y(n50) );
  sky130_fd_sc_hd__nor2_1 U173 ( .A(n99), .B(n23), .Y(n45) );
  sky130_fd_sc_hd__nor2_1 U174 ( .A(n92), .B(n24), .Y(n44) );
  sky130_fd_sc_hd__fa_1 U175 ( .A(n43), .B(n42), .CIN(n41), .COUT(n86), .SUM(
        n52) );
  sky130_fd_sc_hd__nor2_1 U176 ( .A(n121), .B(n364), .Y(n98) );
  sky130_fd_sc_hd__ha_1 U177 ( .A(n45), .B(n44), .COUT(n96), .SUM(n41) );
  sky130_fd_sc_hd__nor2_1 U178 ( .A(n99), .B(n24), .Y(n91) );
  sky130_fd_sc_hd__nor2_1 U179 ( .A(n92), .B(n27), .Y(n90) );
  sky130_fd_sc_hd__fa_1 U180 ( .A(n48), .B(n47), .CIN(n46), .COUT(n88), .SUM(
        n53) );
  sky130_fd_sc_hd__nor2_1 U181 ( .A(n390), .B(n23), .Y(n95) );
  sky130_fd_sc_hd__nor2_1 U182 ( .A(n416), .B(n15), .Y(n94) );
  sky130_fd_sc_hd__nor2_1 U183 ( .A(n411), .B(n2), .Y(n93) );
  sky130_fd_sc_hd__nor2_1 U184 ( .A(n81), .B(n82), .Y(n49) );
  sky130_fd_sc_hd__inv_1 U185 ( .A(n49), .Y(n521) );
  sky130_fd_sc_hd__nor2_1 U186 ( .A(n92), .B(n1), .Y(n64) );
  sky130_fd_sc_hd__nor2_1 U187 ( .A(n400), .B(n364), .Y(n63) );
  sky130_fd_sc_hd__ha_1 U188 ( .A(n51), .B(n50), .COUT(n42), .SUM(n60) );
  sky130_fd_sc_hd__nor2_1 U189 ( .A(n390), .B(n15), .Y(n67) );
  sky130_fd_sc_hd__nor2_1 U190 ( .A(n99), .B(n2), .Y(n66) );
  sky130_fd_sc_hd__nor2_1 U191 ( .A(n390), .B(n364), .Y(n68) );
  sky130_fd_sc_hd__fa_1 U192 ( .A(n54), .B(n53), .CIN(n52), .COUT(n81), .SUM(
        n79) );
  sky130_fd_sc_hd__nor2_1 U193 ( .A(n78), .B(n79), .Y(n55) );
  sky130_fd_sc_hd__inv_1 U194 ( .A(n55), .Y(n562) );
  sky130_fd_sc_hd__fa_1 U195 ( .A(n58), .B(n57), .CIN(n56), .COUT(n54), .SUM(
        n75) );
  sky130_fd_sc_hd__fa_1 U196 ( .A(n61), .B(n60), .CIN(n59), .COUT(n78), .SUM(
        n76) );
  sky130_fd_sc_hd__ha_1 U199 ( .A(n64), .B(n63), .COUT(n61), .SUM(n72) );
  sky130_fd_sc_hd__fa_1 U200 ( .A(n67), .B(n66), .CIN(n65), .COUT(n59), .SUM(
        n73) );
  sky130_fd_sc_hd__nor2_1 U201 ( .A(n92), .B(n15), .Y(n370) );
  sky130_fd_sc_hd__nor2_1 U202 ( .A(n99), .B(n364), .Y(n371) );
  sky130_fd_sc_hd__nand2_1 U203 ( .A(n370), .B(n371), .Y(n532) );
  sky130_fd_sc_hd__nor2_1 U204 ( .A(n92), .B(n2), .Y(n70) );
  sky130_fd_sc_hd__ha_1 U205 ( .A(n69), .B(n68), .COUT(n65), .SUM(n71) );
  sky130_fd_sc_hd__nor2_1 U206 ( .A(n70), .B(n71), .Y(n529) );
  sky130_fd_sc_hd__nand2_1 U207 ( .A(n71), .B(n70), .Y(n530) );
  sky130_fd_sc_hd__nand2_1 U209 ( .A(n73), .B(n72), .Y(n571) );
  sky130_fd_sc_hd__inv_1 U210 ( .A(n571), .Y(n74) );
  sky130_fd_sc_hd__a21o_1 U211 ( .A1(n572), .A2(n574), .B1(n74), .X(n606) );
  sky130_fd_sc_hd__nand2_1 U212 ( .A(n76), .B(n75), .Y(n603) );
  sky130_fd_sc_hd__inv_1 U213 ( .A(n603), .Y(n77) );
  sky130_fd_sc_hd__a21o_1 U214 ( .A1(n62), .A2(n606), .B1(n77), .X(n564) );
  sky130_fd_sc_hd__nand2_1 U215 ( .A(n79), .B(n78), .Y(n561) );
  sky130_fd_sc_hd__inv_1 U216 ( .A(n561), .Y(n80) );
  sky130_fd_sc_hd__a21o_1 U217 ( .A1(n562), .A2(n564), .B1(n80), .X(n523) );
  sky130_fd_sc_hd__nand2_1 U218 ( .A(n82), .B(n81), .Y(n520) );
  sky130_fd_sc_hd__inv_1 U219 ( .A(n520), .Y(n83) );
  sky130_fd_sc_hd__a21oi_1 U220 ( .A1(n521), .A2(n523), .B1(n83), .Y(n473) );
  sky130_fd_sc_hd__fa_1 U221 ( .A(n86), .B(n85), .CIN(n84), .COUT(n100), .SUM(
        n82) );
  sky130_fd_sc_hd__fa_1 U222 ( .A(n89), .B(n88), .CIN(n87), .COUT(n456), .SUM(
        n84) );
  sky130_fd_sc_hd__ha_1 U223 ( .A(n91), .B(n90), .COUT(n444), .SUM(n89) );
  sky130_fd_sc_hd__nor2_1 U224 ( .A(n390), .B(n24), .Y(n404) );
  sky130_fd_sc_hd__nor2_1 U225 ( .A(n415), .B(n92), .Y(n403) );
  sky130_fd_sc_hd__fa_2 U226 ( .A(n95), .B(n94), .CIN(n93), .COUT(n442), .SUM(
        n87) );
  sky130_fd_sc_hd__fa_1 U227 ( .A(n98), .B(n97), .CIN(n96), .COUT(n462), .SUM(
        n85) );
  sky130_fd_sc_hd__inv_1 U228 ( .A(in1[1]), .Y(n99) );
  sky130_fd_sc_hd__nor2_1 U229 ( .A(n99), .B(n27), .Y(n393) );
  sky130_fd_sc_hd__nor2_1 U230 ( .A(n121), .B(n15), .Y(n392) );
  sky130_fd_sc_hd__nor2_1 U231 ( .A(n416), .B(n2), .Y(n391) );
  sky130_fd_sc_hd__nor2_1 U232 ( .A(n400), .B(n23), .Y(n396) );
  sky130_fd_sc_hd__nor2_1 U233 ( .A(n417), .B(n364), .Y(n395) );
  sky130_fd_sc_hd__nor2_1 U234 ( .A(n411), .B(n1), .Y(n394) );
  sky130_fd_sc_hd__nor2_1 U235 ( .A(n100), .B(n101), .Y(n474) );
  sky130_fd_sc_hd__inv_1 U236 ( .A(n474), .Y(n102) );
  sky130_fd_sc_hd__nand2_1 U237 ( .A(n101), .B(n100), .Y(n472) );
  sky130_fd_sc_hd__nand2_1 U238 ( .A(n102), .B(n472), .Y(n103) );
  sky130_fd_sc_hd__xor2_1 U239 ( .A(n473), .B(n103), .X(n118) );
  sky130_fd_sc_hd__inv_1 U240 ( .A(n104), .Y(n106) );
  sky130_fd_sc_hd__inv_1 U241 ( .A(op[0]), .Y(n105) );
  sky130_fd_sc_hd__nand3_1 U242 ( .A(n106), .B(op[2]), .C(n105), .Y(n698) );
  sky130_fd_sc_hd__nand3_1 U243 ( .A(n108), .B(op[3]), .C(n107), .Y(n608) );
  sky130_fd_sc_hd__nand2_1 U244 ( .A(n110), .B(n109), .Y(n111) );
  sky130_fd_sc_hd__nor2_1 U245 ( .A(n274), .B(in2[3]), .Y(n135) );
  sky130_fd_sc_hd__nor2_1 U246 ( .A(n417), .B(in2[1]), .Y(n112) );
  sky130_fd_sc_hd__nand3_1 U247 ( .A(n124), .B(n135), .C(n112), .Y(n123) );
  sky130_fd_sc_hd__nand2_1 U248 ( .A(n608), .B(n698), .Y(n116) );
  sky130_fd_sc_hd__nor4_1 U249 ( .A(in2[0]), .B(n274), .C(in2[3]), .D(in2[1]), 
        .Y(n113) );
  sky130_fd_sc_hd__nand2_1 U250 ( .A(n124), .B(n113), .Y(n115) );
  sky130_fd_sc_hd__inv_1 U251 ( .A(invalid_data), .Y(n114) );
  sky130_fd_sc_hd__o21a_1 U252 ( .A1(n115), .A2(n608), .B1(n114), .X(n699) );
  sky130_fd_sc_hd__o21ai_1 U253 ( .A1(n116), .A2(n672), .B1(n699), .Y(n680) );
  sky130_fd_sc_hd__inv_1 U254 ( .A(n680), .Y(n607) );
  sky130_fd_sc_hd__a21oi_1 U256 ( .A1(n118), .A2(n681), .B1(n117), .Y(n119) );
  sky130_fd_sc_hd__nand2_1 U257 ( .A(n120), .B(n119), .Y(out[7]) );
  sky130_fd_sc_hd__inv_1 U258 ( .A(in1[6]), .Y(n121) );
  sky130_fd_sc_hd__a22oi_1 U259 ( .A1(n417), .A2(in2[1]), .B1(in2[0]), .B2(
        n121), .Y(n122) );
  sky130_fd_sc_hd__nand3_2 U260 ( .A(n122), .B(n124), .C(n135), .Y(n524) );
  sky130_fd_sc_hd__nand2_1 U261 ( .A(n148), .B(n274), .Y(n131) );
  sky130_fd_sc_hd__and2_1 U262 ( .A(n124), .B(n1), .X(n130) );
  sky130_fd_sc_hd__o21ai_2 U263 ( .A1(n364), .A2(n524), .B1(in1[6]), .Y(n140)
         );
  sky130_fd_sc_hd__nand2_1 U264 ( .A(n140), .B(in2[1]), .Y(n125) );
  sky130_fd_sc_hd__nand2_1 U265 ( .A(n416), .B(in2[0]), .Y(n167) );
  sky130_fd_sc_hd__nand2_1 U266 ( .A(n125), .B(n167), .Y(n128) );
  sky130_fd_sc_hd__nand3_1 U267 ( .A(n524), .B(in1[6]), .C(n15), .Y(n127) );
  sky130_fd_sc_hd__nand3_1 U268 ( .A(n3), .B(in1[7]), .C(n2), .Y(n126) );
  sky130_fd_sc_hd__nand3_2 U269 ( .A(n131), .B(n130), .C(n129), .Y(n565) );
  sky130_fd_sc_hd__o21ai_1 U270 ( .A1(n274), .A2(in2[0]), .B1(in2[1]), .Y(n134) );
  sky130_fd_sc_hd__xnor2_1 U271 ( .A(n274), .B(in2[3]), .Y(n132) );
  sky130_fd_sc_hd__xnor2_1 U272 ( .A(n134), .B(n132), .Y(n335) );
  sky130_fd_sc_hd__inv_1 U273 ( .A(n335), .Y(n260) );
  sky130_fd_sc_hd__nand2_1 U274 ( .A(n364), .B(in2[1]), .Y(n133) );
  sky130_fd_sc_hd__xnor2_2 U275 ( .A(n2), .B(n133), .Y(n330) );
  sky130_fd_sc_hd__nand2_1 U276 ( .A(n140), .B(n270), .Y(n138) );
  sky130_fd_sc_hd__xnor2_1 U277 ( .A(in2[3]), .B(n23), .Y(n136) );
  sky130_fd_sc_hd__o22ai_1 U278 ( .A1(n2), .A2(n1), .B1(n134), .B2(n135), .Y(
        n207) );
  sky130_fd_sc_hd__nand2_1 U279 ( .A(n411), .B(in2[0]), .Y(n164) );
  sky130_fd_sc_hd__inv_1 U280 ( .A(n164), .Y(n160) );
  sky130_fd_sc_hd__nand2_1 U281 ( .A(n242), .B(n164), .Y(n162) );
  sky130_fd_sc_hd__a22oi_1 U282 ( .A1(n329), .A2(n160), .B1(n162), .B2(n416), 
        .Y(n137) );
  sky130_fd_sc_hd__a21oi_1 U284 ( .A1(n148), .A2(n260), .B1(n139), .Y(n168) );
  sky130_fd_sc_hd__inv_1 U285 ( .A(n124), .Y(n187) );
  sky130_fd_sc_hd__a21oi_1 U286 ( .A1(n148), .A2(in2[3]), .B1(n187), .Y(n145)
         );
  sky130_fd_sc_hd__inv_1 U287 ( .A(n140), .Y(n157) );
  sky130_fd_sc_hd__nand2_1 U288 ( .A(n140), .B(n274), .Y(n142) );
  sky130_fd_sc_hd__nand2_1 U289 ( .A(n15), .B(in1[5]), .Y(n141) );
  sky130_fd_sc_hd__a22oi_1 U290 ( .A1(in2[1]), .A2(n416), .B1(n160), .B2(n141), 
        .Y(n150) );
  sky130_fd_sc_hd__a22oi_1 U291 ( .A1(n157), .A2(n2), .B1(n142), .B2(n150), 
        .Y(n143) );
  sky130_fd_sc_hd__nand3_1 U293 ( .A(n145), .B(n565), .C(n144), .Y(n146) );
  sky130_fd_sc_hd__nand2_2 U294 ( .A(n147), .B(n146), .Y(n176) );
  sky130_fd_sc_hd__nor2_1 U295 ( .A(n176), .B(n171), .Y(n166) );
  sky130_fd_sc_hd__inv_1 U296 ( .A(n166), .Y(n156) );
  sky130_fd_sc_hd__inv_1 U297 ( .A(n148), .Y(n149) );
  sky130_fd_sc_hd__nand2_1 U298 ( .A(n166), .B(n149), .Y(n221) );
  sky130_fd_sc_hd__inv_1 U299 ( .A(n150), .Y(n151) );
  sky130_fd_sc_hd__xnor2_1 U300 ( .A(n274), .B(n151), .Y(n153) );
  sky130_fd_sc_hd__inv_1 U301 ( .A(n153), .Y(n152) );
  sky130_fd_sc_hd__and3_1 U302 ( .A(n176), .B(n565), .C(n152), .X(n159) );
  sky130_fd_sc_hd__nand2_1 U303 ( .A(n565), .B(n153), .Y(n155) );
  sky130_fd_sc_hd__inv_1 U304 ( .A(n176), .Y(n609) );
  sky130_fd_sc_hd__nand3_1 U305 ( .A(n609), .B(n15), .C(n167), .Y(n154) );
  sky130_fd_sc_hd__nand3_1 U306 ( .A(n156), .B(n155), .C(n154), .Y(n158) );
  sky130_fd_sc_hd__nor2_1 U307 ( .A(in2[3]), .B(n234), .Y(n185) );
  sky130_fd_sc_hd__nor2_1 U308 ( .A(n15), .B(n160), .Y(n161) );
  sky130_fd_sc_hd__mux2i_1 U309 ( .A0(n162), .A1(n161), .S(n565), .Y(n163) );
  sky130_fd_sc_hd__o21ai_0 U310 ( .A1(in2[1]), .A2(n164), .B1(n163), .Y(n172)
         );
  sky130_fd_sc_hd__mux2i_1 U311 ( .A0(in2[0]), .A1(n172), .S(n176), .Y(n165)
         );
  sky130_fd_sc_hd__o21ai_1 U312 ( .A1(n166), .A2(n165), .B1(in1[5]), .Y(n175)
         );
  sky130_fd_sc_hd__inv_1 U313 ( .A(n167), .Y(n170) );
  sky130_fd_sc_hd__inv_1 U314 ( .A(n168), .Y(n169) );
  sky130_fd_sc_hd__nand3_1 U315 ( .A(n171), .B(n170), .C(n169), .Y(n174) );
  sky130_fd_sc_hd__nand3_1 U316 ( .A(n172), .B(n416), .C(n176), .Y(n173) );
  sky130_fd_sc_hd__nand3_2 U317 ( .A(n175), .B(n174), .C(n173), .Y(n265) );
  sky130_fd_sc_hd__nand2_1 U318 ( .A(n176), .B(in2[0]), .Y(n177) );
  sky130_fd_sc_hd__xnor2_1 U319 ( .A(in1[4]), .B(n177), .Y(n178) );
  sky130_fd_sc_hd__buf_4 U320 ( .A(n178), .X(n282) );
  sky130_fd_sc_hd__inv_1 U321 ( .A(n282), .Y(n180) );
  sky130_fd_sc_hd__nand2_1 U322 ( .A(n282), .B(n15), .Y(n179) );
  sky130_fd_sc_hd__nor2_1 U323 ( .A(in1[3]), .B(n364), .Y(n272) );
  sky130_fd_sc_hd__a22oi_2 U324 ( .A1(n180), .A2(in2[1]), .B1(n179), .B2(n272), 
        .Y(n256) );
  sky130_fd_sc_hd__o21ai_1 U325 ( .A1(n2), .A2(n265), .B1(n256), .Y(n182) );
  sky130_fd_sc_hd__nand2_1 U326 ( .A(n265), .B(n2), .Y(n181) );
  sky130_fd_sc_hd__nand2_1 U327 ( .A(n182), .B(n181), .Y(n229) );
  sky130_fd_sc_hd__nand2_1 U328 ( .A(n27), .B(n24), .Y(n215) );
  sky130_fd_sc_hd__nor3_1 U329 ( .A(in2[7]), .B(n215), .C(n221), .Y(n183) );
  sky130_fd_sc_hd__a2bb2oi_1 U330 ( .B1(in2[3]), .B2(n234), .A1_N(n124), 
        .A2_N(n183), .Y(n184) );
  sky130_fd_sc_hd__o21ai_1 U331 ( .A1(n185), .A2(n229), .B1(n184), .Y(n186) );
  sky130_fd_sc_hd__inv_1 U332 ( .A(n570), .Y(n189) );
  sky130_fd_sc_hd__inv_1 U333 ( .A(n221), .Y(n188) );
  sky130_fd_sc_hd__nand2_1 U334 ( .A(n189), .B(n188), .Y(n227) );
  sky130_fd_sc_hd__inv_1 U335 ( .A(n234), .Y(n206) );
  sky130_fd_sc_hd__nor2_1 U336 ( .A(in2[4]), .B(n234), .Y(n195) );
  sky130_fd_sc_hd__nand2_1 U337 ( .A(n390), .B(in2[0]), .Y(n244) );
  sky130_fd_sc_hd__nand2_1 U338 ( .A(n244), .B(in1[3]), .Y(n200) );
  sky130_fd_sc_hd__nor2_1 U339 ( .A(in1[3]), .B(n244), .Y(n199) );
  sky130_fd_sc_hd__a21oi_1 U340 ( .A1(in2[1]), .A2(n200), .B1(n199), .Y(n273)
         );
  sky130_fd_sc_hd__o21ai_1 U341 ( .A1(n2), .A2(n282), .B1(n273), .Y(n192) );
  sky130_fd_sc_hd__nand2_1 U342 ( .A(n282), .B(n2), .Y(n191) );
  sky130_fd_sc_hd__nand2_1 U343 ( .A(n192), .B(n191), .Y(n254) );
  sky130_fd_sc_hd__o21ai_1 U344 ( .A1(n1), .A2(n265), .B1(n254), .Y(n194) );
  sky130_fd_sc_hd__nand2_1 U345 ( .A(n265), .B(n1), .Y(n193) );
  sky130_fd_sc_hd__nand2_1 U346 ( .A(n194), .B(n193), .Y(n228) );
  sky130_fd_sc_hd__o22ai_1 U347 ( .A1(n23), .A2(n206), .B1(n195), .B2(n228), 
        .Y(n196) );
  sky130_fd_sc_hd__o21ai_1 U348 ( .A1(in2[5]), .A2(n221), .B1(n196), .Y(n198)
         );
  sky130_fd_sc_hd__nand2_1 U349 ( .A(n221), .B(in2[5]), .Y(n197) );
  sky130_fd_sc_hd__nand4_1 U350 ( .A(n198), .B(n415), .C(n27), .D(n197), .Y(
        n225) );
  sky130_fd_sc_hd__a21oi_1 U351 ( .A1(n329), .A2(n200), .B1(n199), .Y(n269) );
  sky130_fd_sc_hd__o21ai_1 U352 ( .A1(n330), .A2(n282), .B1(n269), .Y(n202) );
  sky130_fd_sc_hd__nand2_1 U353 ( .A(n282), .B(n330), .Y(n201) );
  sky130_fd_sc_hd__nand2_1 U354 ( .A(n202), .B(n201), .Y(n259) );
  sky130_fd_sc_hd__o21ai_1 U355 ( .A1(n335), .A2(n265), .B1(n259), .Y(n204) );
  sky130_fd_sc_hd__nand2_1 U356 ( .A(n265), .B(n335), .Y(n203) );
  sky130_fd_sc_hd__nand2_1 U357 ( .A(n204), .B(n203), .Y(n205) );
  sky130_fd_sc_hd__xnor2_1 U359 ( .A(in2[5]), .B(n23), .Y(n209) );
  sky130_fd_sc_hd__o21ai_1 U361 ( .A1(n1), .A2(n23), .B1(n208), .Y(n213) );
  sky130_fd_sc_hd__xnor2_1 U362 ( .A(n209), .B(n213), .Y(n343) );
  sky130_fd_sc_hd__inv_1 U363 ( .A(n343), .Y(n220) );
  sky130_fd_sc_hd__inv_1 U364 ( .A(n341), .Y(n210) );
  sky130_fd_sc_hd__nand2_1 U365 ( .A(n212), .B(n211), .Y(n224) );
  sky130_fd_sc_hd__o21ai_1 U366 ( .A1(in2[5]), .A2(in2[4]), .B1(n213), .Y(n214) );
  sky130_fd_sc_hd__o21ai_1 U367 ( .A1(n23), .A2(n24), .B1(n214), .Y(n218) );
  sky130_fd_sc_hd__nand2_1 U368 ( .A(n218), .B(n215), .Y(n216) );
  sky130_fd_sc_hd__o21ai_1 U369 ( .A1(n24), .A2(n27), .B1(n216), .Y(n217) );
  sky130_fd_sc_hd__xnor2_1 U370 ( .A(in2[6]), .B(n217), .Y(n353) );
  sky130_fd_sc_hd__a21oi_1 U371 ( .A1(n217), .A2(in2[6]), .B1(in2[7]), .Y(n362) );
  sky130_fd_sc_hd__xnor2_1 U372 ( .A(in2[6]), .B(n24), .Y(n219) );
  sky130_fd_sc_hd__xnor2_1 U373 ( .A(n219), .B(n218), .Y(n351) );
  sky130_fd_sc_hd__and3_1 U374 ( .A(n353), .B(n362), .C(n351), .X(n223) );
  sky130_fd_sc_hd__nand2_1 U375 ( .A(n221), .B(n220), .Y(n222) );
  sky130_fd_sc_hd__nor2_1 U376 ( .A(n27), .B(n354), .Y(n297) );
  sky130_fd_sc_hd__xnor2_1 U377 ( .A(in2[4]), .B(n228), .Y(n233) );
  sky130_fd_sc_hd__nor2_1 U378 ( .A(n233), .B(n570), .Y(n232) );
  sky130_fd_sc_hd__nand2_1 U379 ( .A(n570), .B(n286), .Y(n277) );
  sky130_fd_sc_hd__nor3_1 U380 ( .A(n232), .B(n231), .C(n280), .Y(n236) );
  sky130_fd_sc_hd__nand2_1 U381 ( .A(n275), .B(n233), .Y(n235) );
  sky130_fd_sc_hd__mux2i_1 U382 ( .A0(n236), .A1(n235), .S(n234), .Y(n352) );
  sky130_fd_sc_hd__nor2_1 U383 ( .A(n24), .B(n352), .Y(n237) );
  sky130_fd_sc_hd__nor2_1 U384 ( .A(n297), .B(n237), .Y(n238) );
  sky130_fd_sc_hd__inv_1 U385 ( .A(n238), .Y(n300) );
  sky130_fd_sc_hd__nand2_1 U386 ( .A(n99), .B(in2[0]), .Y(n326) );
  sky130_fd_sc_hd__nor2_1 U387 ( .A(n15), .B(n326), .Y(n241) );
  sky130_fd_sc_hd__o21ai_1 U388 ( .A1(n364), .A2(n545), .B1(in1[2]), .Y(n239)
         );
  sky130_fd_sc_hd__o21a_1 U389 ( .A1(n244), .A2(n545), .B1(n239), .X(n333) );
  sky130_fd_sc_hd__nand2_1 U390 ( .A(n326), .B(n15), .Y(n240) );
  sky130_fd_sc_hd__o21a_1 U391 ( .A1(n241), .A2(n333), .B1(n240), .X(n253) );
  sky130_fd_sc_hd__mux2i_1 U392 ( .A0(n15), .A1(n242), .S(n570), .Y(n243) );
  sky130_fd_sc_hd__xnor2_1 U393 ( .A(n244), .B(n243), .Y(n246) );
  sky130_fd_sc_hd__mux2i_1 U394 ( .A0(n246), .A1(in2[0]), .S(n545), .Y(n245)
         );
  sky130_fd_sc_hd__o21ai_1 U395 ( .A1(n280), .A2(n245), .B1(in1[3]), .Y(n250)
         );
  sky130_fd_sc_hd__inv_1 U396 ( .A(n246), .Y(n247) );
  sky130_fd_sc_hd__a21oi_1 U397 ( .A1(n272), .A2(n276), .B1(n248), .Y(n249) );
  sky130_fd_sc_hd__nor2_1 U398 ( .A(n2), .B(n336), .Y(n252) );
  sky130_fd_sc_hd__nand2_1 U399 ( .A(n336), .B(n2), .Y(n251) );
  sky130_fd_sc_hd__o21ai_1 U400 ( .A1(n253), .A2(n252), .B1(n251), .Y(n294) );
  sky130_fd_sc_hd__xnor2_1 U401 ( .A(in2[3]), .B(n254), .Y(n262) );
  sky130_fd_sc_hd__xnor2_1 U402 ( .A(n274), .B(n257), .Y(n263) );
  sky130_fd_sc_hd__o22ai_1 U403 ( .A1(n262), .A2(n570), .B1(n263), .B2(n277), 
        .Y(n258) );
  sky130_fd_sc_hd__nor2_1 U404 ( .A(n258), .B(n280), .Y(n268) );
  sky130_fd_sc_hd__xnor2_1 U405 ( .A(n260), .B(n259), .Y(n261) );
  sky130_fd_sc_hd__xnor2_1 U406 ( .A(n265), .B(n261), .Y(n266) );
  sky130_fd_sc_hd__a22oi_1 U407 ( .A1(n276), .A2(n263), .B1(n275), .B2(n262), 
        .Y(n264) );
  sky130_fd_sc_hd__o21ai_2 U408 ( .A1(n268), .A2(n267), .B1(n6), .Y(n344) );
  sky130_fd_sc_hd__nor2_1 U409 ( .A(n23), .B(n344), .Y(n290) );
  sky130_fd_sc_hd__xnor2_1 U410 ( .A(n270), .B(n269), .Y(n271) );
  sky130_fd_sc_hd__xnor2_1 U411 ( .A(n271), .B(n282), .Y(n287) );
  sky130_fd_sc_hd__xnor2_1 U412 ( .A(n15), .B(n272), .Y(n278) );
  sky130_fd_sc_hd__xnor2_1 U413 ( .A(n274), .B(n273), .Y(n279) );
  sky130_fd_sc_hd__o22ai_1 U414 ( .A1(n279), .A2(n570), .B1(n278), .B2(n277), 
        .Y(n281) );
  sky130_fd_sc_hd__or2_0 U415 ( .A(n281), .B(n280), .X(n283) );
  sky130_fd_sc_hd__mux2i_1 U416 ( .A0(n284), .A1(n283), .S(n282), .Y(n285) );
  sky130_fd_sc_hd__o21ai_2 U417 ( .A1(n287), .A2(n286), .B1(n285), .Y(n342) );
  sky130_fd_sc_hd__nor2_1 U418 ( .A(n1), .B(n342), .Y(n288) );
  sky130_fd_sc_hd__nor2_1 U419 ( .A(n290), .B(n288), .Y(n293) );
  sky130_fd_sc_hd__nand2_1 U420 ( .A(n342), .B(n1), .Y(n291) );
  sky130_fd_sc_hd__nand2_1 U421 ( .A(n344), .B(n23), .Y(n289) );
  sky130_fd_sc_hd__o21ai_1 U422 ( .A1(n291), .A2(n290), .B1(n289), .Y(n292) );
  sky130_fd_sc_hd__a21oi_1 U423 ( .A1(n294), .A2(n293), .B1(n292), .Y(n299) );
  sky130_fd_sc_hd__nand2_1 U424 ( .A(n352), .B(n24), .Y(n296) );
  sky130_fd_sc_hd__nand2_1 U425 ( .A(n354), .B(n27), .Y(n295) );
  sky130_fd_sc_hd__o21a_1 U426 ( .A1(n297), .A2(n296), .B1(n295), .X(n298) );
  sky130_fd_sc_hd__inv_1 U427 ( .A(n608), .Y(n361) );
  sky130_fd_sc_hd__nor2_1 U428 ( .A(n415), .B(n354), .Y(n318) );
  sky130_fd_sc_hd__nor2_1 U429 ( .A(n27), .B(n352), .Y(n302) );
  sky130_fd_sc_hd__nor2_1 U432 ( .A(n2), .B(n537), .Y(n305) );
  sky130_fd_sc_hd__nand2_1 U433 ( .A(n537), .B(n2), .Y(n304) );
  sky130_fd_sc_hd__o21a_1 U434 ( .A1(n305), .A2(n333), .B1(n304), .X(n308) );
  sky130_fd_sc_hd__nor2_1 U435 ( .A(n1), .B(n336), .Y(n307) );
  sky130_fd_sc_hd__nand2_1 U436 ( .A(n336), .B(n1), .Y(n306) );
  sky130_fd_sc_hd__o21ai_1 U437 ( .A1(n308), .A2(n307), .B1(n306), .Y(n315) );
  sky130_fd_sc_hd__nor2_1 U438 ( .A(n24), .B(n344), .Y(n311) );
  sky130_fd_sc_hd__nor2_1 U439 ( .A(n23), .B(n342), .Y(n309) );
  sky130_fd_sc_hd__nor2_1 U440 ( .A(n311), .B(n309), .Y(n314) );
  sky130_fd_sc_hd__nand2_1 U441 ( .A(n342), .B(n23), .Y(n312) );
  sky130_fd_sc_hd__nand2_1 U442 ( .A(n344), .B(n24), .Y(n310) );
  sky130_fd_sc_hd__o21ai_1 U443 ( .A1(n312), .A2(n311), .B1(n310), .Y(n313) );
  sky130_fd_sc_hd__a21oi_1 U444 ( .A1(n315), .A2(n314), .B1(n313), .Y(n320) );
  sky130_fd_sc_hd__nand2_1 U445 ( .A(n352), .B(n27), .Y(n317) );
  sky130_fd_sc_hd__nand2_1 U446 ( .A(n354), .B(n415), .Y(n316) );
  sky130_fd_sc_hd__o21a_1 U447 ( .A1(n318), .A2(n317), .B1(n316), .X(n319) );
  sky130_fd_sc_hd__o21ai_1 U448 ( .A1(n303), .A2(n320), .B1(n319), .Y(n322) );
  sky130_fd_sc_hd__nand3_1 U449 ( .A(n386), .B(n361), .C(n322), .Y(n369) );
  sky130_fd_sc_hd__a21oi_1 U450 ( .A1(n681), .A2(n323), .B1(n680), .Y(n368) );
  sky130_fd_sc_hd__nor2_1 U451 ( .A(n353), .B(n354), .Y(n357) );
  sky130_fd_sc_hd__nor2_1 U452 ( .A(n351), .B(n352), .Y(n324) );
  sky130_fd_sc_hd__nor2_1 U455 ( .A(in1[0]), .B(n326), .Y(n328) );
  sky130_fd_sc_hd__o21ai_1 U456 ( .A1(in1[0]), .A2(n364), .B1(in1[1]), .Y(n327) );
  sky130_fd_sc_hd__o21ai_1 U457 ( .A1(n329), .A2(n328), .B1(n327), .Y(n331) );
  sky130_fd_sc_hd__nor2_1 U458 ( .A(n330), .B(n331), .Y(n334) );
  sky130_fd_sc_hd__nand2_1 U459 ( .A(n331), .B(n330), .Y(n332) );
  sky130_fd_sc_hd__o21a_1 U460 ( .A1(n334), .A2(n333), .B1(n332), .X(n339) );
  sky130_fd_sc_hd__nor2_1 U461 ( .A(n335), .B(n336), .Y(n338) );
  sky130_fd_sc_hd__nand2_1 U462 ( .A(n336), .B(n335), .Y(n337) );
  sky130_fd_sc_hd__o21ai_1 U463 ( .A1(n339), .A2(n338), .B1(n337), .Y(n350) );
  sky130_fd_sc_hd__nor2_1 U464 ( .A(n343), .B(n344), .Y(n346) );
  sky130_fd_sc_hd__nor2_1 U465 ( .A(n341), .B(n342), .Y(n340) );
  sky130_fd_sc_hd__nor2_1 U466 ( .A(n346), .B(n340), .Y(n349) );
  sky130_fd_sc_hd__nand2_1 U467 ( .A(n342), .B(n341), .Y(n347) );
  sky130_fd_sc_hd__nand2_1 U468 ( .A(n344), .B(n343), .Y(n345) );
  sky130_fd_sc_hd__o21ai_1 U469 ( .A1(n347), .A2(n346), .B1(n345), .Y(n348) );
  sky130_fd_sc_hd__a21oi_1 U470 ( .A1(n350), .A2(n349), .B1(n348), .Y(n359) );
  sky130_fd_sc_hd__nand2_1 U471 ( .A(n352), .B(n351), .Y(n356) );
  sky130_fd_sc_hd__nand2_1 U472 ( .A(n354), .B(n353), .Y(n355) );
  sky130_fd_sc_hd__o21a_1 U473 ( .A1(n357), .A2(n356), .B1(n355), .X(n358) );
  sky130_fd_sc_hd__o21ai_1 U474 ( .A1(n190), .A2(n359), .B1(n358), .Y(n363) );
  sky130_fd_sc_hd__nand3_1 U475 ( .A(n363), .B(n362), .C(n361), .Y(n367) );
  sky130_fd_sc_hd__xnor2_1 U476 ( .A(in1[0]), .B(n364), .Y(n365) );
  sky130_fd_sc_hd__nand2_1 U477 ( .A(n365), .B(n672), .Y(n366) );
  sky130_fd_sc_hd__and2_1 U478 ( .A(n372), .B(n532), .X(n373) );
  sky130_fd_sc_hd__a21oi_1 U479 ( .A1(n681), .A2(n373), .B1(n680), .Y(n385) );
  sky130_fd_sc_hd__nand2_1 U480 ( .A(n376), .B(n375), .Y(n378) );
  sky130_fd_sc_hd__xor2_1 U481 ( .A(n378), .B(n377), .X(n382) );
  sky130_fd_sc_hd__xor2_1 U482 ( .A(n380), .B(n379), .X(n381) );
  sky130_fd_sc_hd__nand2_1 U483 ( .A(n383), .B(n672), .Y(n384) );
  sky130_fd_sc_hd__nor2_1 U484 ( .A(n411), .B(n27), .Y(n407) );
  sky130_fd_sc_hd__nor2_1 U485 ( .A(n417), .B(n1), .Y(n406) );
  sky130_fd_sc_hd__nor2_1 U486 ( .A(n390), .B(n415), .Y(n389) );
  sky130_fd_sc_hd__nor2_1 U487 ( .A(n411), .B(n24), .Y(n388) );
  sky130_fd_sc_hd__nor2_1 U488 ( .A(n416), .B(n23), .Y(n387) );
  sky130_fd_sc_hd__fa_1 U489 ( .A(n389), .B(n388), .CIN(n387), .COUT(n405), 
        .SUM(n447) );
  sky130_fd_sc_hd__nor2_1 U490 ( .A(n400), .B(n27), .Y(n399) );
  sky130_fd_sc_hd__nor2_1 U491 ( .A(n121), .B(n1), .Y(n398) );
  sky130_fd_sc_hd__nor2_1 U492 ( .A(n417), .B(n2), .Y(n397) );
  sky130_fd_sc_hd__nor2_1 U493 ( .A(n390), .B(n27), .Y(n402) );
  sky130_fd_sc_hd__nor2_1 U494 ( .A(n400), .B(n24), .Y(n401) );
  sky130_fd_sc_hd__fa_1 U496 ( .A(n396), .B(n395), .CIN(n394), .COUT(n457), 
        .SUM(n460) );
  sky130_fd_sc_hd__fa_1 U497 ( .A(n399), .B(n398), .CIN(n397), .COUT(n414), 
        .SUM(n446) );
  sky130_fd_sc_hd__nor2_1 U498 ( .A(n400), .B(n415), .Y(n410) );
  sky130_fd_sc_hd__nor2_1 U499 ( .A(n121), .B(n23), .Y(n408) );
  sky130_fd_sc_hd__ha_1 U500 ( .A(n402), .B(n401), .COUT(n435), .SUM(n459) );
  sky130_fd_sc_hd__nor2_1 U501 ( .A(n415), .B(n99), .Y(n438) );
  sky130_fd_sc_hd__nor2_1 U502 ( .A(n417), .B(n15), .Y(n437) );
  sky130_fd_sc_hd__nor2_1 U503 ( .A(n121), .B(n2), .Y(n436) );
  sky130_fd_sc_hd__nor2_1 U504 ( .A(n416), .B(n1), .Y(n440) );
  sky130_fd_sc_hd__ha_1 U505 ( .A(n404), .B(n403), .COUT(n439), .SUM(n443) );
  sky130_fd_sc_hd__fa_1 U506 ( .A(n407), .B(n406), .CIN(n405), .COUT(n432), 
        .SUM(n450) );
  sky130_fd_sc_hd__nor2_1 U507 ( .A(n416), .B(n27), .Y(n426) );
  sky130_fd_sc_hd__fa_1 U508 ( .A(n410), .B(n409), .CIN(n408), .COUT(n425), 
        .SUM(n413) );
  sky130_fd_sc_hd__nor2_1 U509 ( .A(n411), .B(n415), .Y(n420) );
  sky130_fd_sc_hd__nor2_1 U510 ( .A(n121), .B(n24), .Y(n419) );
  sky130_fd_sc_hd__nor2_1 U511 ( .A(n417), .B(n23), .Y(n418) );
  sky130_fd_sc_hd__fa_2 U512 ( .A(n414), .B(n413), .CIN(n412), .COUT(n430), 
        .SUM(n448) );
  sky130_fd_sc_hd__nor2_1 U513 ( .A(n483), .B(n484), .Y(n622) );
  sky130_fd_sc_hd__inv_1 U514 ( .A(n622), .Y(n633) );
  sky130_fd_sc_hd__nor2_1 U515 ( .A(n121), .B(n415), .Y(n453) );
  sky130_fd_sc_hd__nor2_1 U516 ( .A(n417), .B(n27), .Y(n452) );
  sky130_fd_sc_hd__nor2_1 U517 ( .A(n416), .B(n415), .Y(n423) );
  sky130_fd_sc_hd__nor2_1 U518 ( .A(n417), .B(n24), .Y(n422) );
  sky130_fd_sc_hd__fa_1 U519 ( .A(n420), .B(n419), .CIN(n418), .COUT(n429), 
        .SUM(n424) );
  sky130_fd_sc_hd__fa_1 U520 ( .A(n423), .B(n422), .CIN(n421), .COUT(n451), 
        .SUM(n428) );
  sky130_fd_sc_hd__fa_1 U521 ( .A(n426), .B(n425), .CIN(n424), .COUT(n427), 
        .SUM(n431) );
  sky130_fd_sc_hd__nor2_1 U522 ( .A(n487), .B(n488), .Y(n618) );
  sky130_fd_sc_hd__fa_1 U523 ( .A(n429), .B(n428), .CIN(n427), .COUT(n488), 
        .SUM(n485) );
  sky130_fd_sc_hd__fa_1 U524 ( .A(n432), .B(n431), .CIN(n430), .COUT(n486), 
        .SUM(n484) );
  sky130_fd_sc_hd__nor2_1 U525 ( .A(n485), .B(n486), .Y(n624) );
  sky130_fd_sc_hd__nor2_1 U526 ( .A(n618), .B(n624), .Y(n490) );
  sky130_fd_sc_hd__nand2_1 U527 ( .A(n633), .B(n490), .Y(n492) );
  sky130_fd_sc_hd__fa_1 U528 ( .A(n435), .B(n434), .CIN(n433), .COUT(n412), 
        .SUM(n471) );
  sky130_fd_sc_hd__fa_1 U529 ( .A(n438), .B(n437), .CIN(n436), .COUT(n434), 
        .SUM(n465) );
  sky130_fd_sc_hd__fa_1 U530 ( .A(n444), .B(n443), .CIN(n442), .COUT(n463), 
        .SUM(n455) );
  sky130_fd_sc_hd__fa_1 U532 ( .A(n450), .B(n449), .CIN(n448), .COUT(n483), 
        .SUM(n482) );
  sky130_fd_sc_hd__nor2_1 U533 ( .A(n481), .B(n482), .Y(n621) );
  sky130_fd_sc_hd__nor2_1 U534 ( .A(n492), .B(n621), .Y(n652) );
  sky130_fd_sc_hd__fa_1 U535 ( .A(n453), .B(n452), .CIN(n451), .COUT(n494), 
        .SUM(n487) );
  sky130_fd_sc_hd__nand2_1 U536 ( .A(n652), .B(n651), .Y(n497) );
  sky130_fd_sc_hd__fa_1 U537 ( .A(n456), .B(n455), .CIN(n454), .COUT(n475), 
        .SUM(n101) );
  sky130_fd_sc_hd__fa_1 U539 ( .A(n462), .B(n461), .CIN(n460), .COUT(n467), 
        .SUM(n454) );
  sky130_fd_sc_hd__fa_1 U540 ( .A(n465), .B(n464), .CIN(n463), .COUT(n470), 
        .SUM(n466) );
  sky130_fd_sc_hd__nor2_1 U541 ( .A(n475), .B(n476), .Y(n642) );
  sky130_fd_sc_hd__fa_1 U542 ( .A(n468), .B(n467), .CIN(n466), .COUT(n477), 
        .SUM(n476) );
  sky130_fd_sc_hd__nor2_1 U544 ( .A(n642), .B(n636), .Y(n480) );
  sky130_fd_sc_hd__o21ai_1 U545 ( .A1(n474), .A2(n473), .B1(n472), .Y(n639) );
  sky130_fd_sc_hd__nand2_1 U546 ( .A(n476), .B(n475), .Y(n643) );
  sky130_fd_sc_hd__nand2_1 U547 ( .A(n478), .B(n477), .Y(n637) );
  sky130_fd_sc_hd__o21ai_1 U548 ( .A1(n643), .A2(n636), .B1(n637), .Y(n479) );
  sky130_fd_sc_hd__nand2_1 U549 ( .A(n482), .B(n481), .Y(n647) );
  sky130_fd_sc_hd__nand2_1 U550 ( .A(n484), .B(n483), .Y(n632) );
  sky130_fd_sc_hd__nand2_1 U551 ( .A(n486), .B(n485), .Y(n623) );
  sky130_fd_sc_hd__nand2_1 U552 ( .A(n488), .B(n487), .Y(n619) );
  sky130_fd_sc_hd__a21oi_1 U554 ( .A1(n490), .A2(n614), .B1(n489), .Y(n491) );
  sky130_fd_sc_hd__o21ai_1 U555 ( .A1(n492), .A2(n647), .B1(n491), .Y(n653) );
  sky130_fd_sc_hd__nand2_1 U556 ( .A(n494), .B(n493), .Y(n650) );
  sky130_fd_sc_hd__inv_1 U557 ( .A(n650), .Y(n495) );
  sky130_fd_sc_hd__a21oi_1 U558 ( .A1(n653), .A2(n651), .B1(n495), .Y(n496) );
  sky130_fd_sc_hd__o21ai_1 U559 ( .A1(n497), .A2(n655), .B1(n496), .Y(n498) );
  sky130_fd_sc_hd__nand2_1 U560 ( .A(n498), .B(n681), .Y(n509) );
  sky130_fd_sc_hd__nor2_1 U561 ( .A(in1[7]), .B(n415), .Y(n501) );
  sky130_fd_sc_hd__nor2_1 U562 ( .A(n499), .B(n501), .Y(n504) );
  sky130_fd_sc_hd__a21oi_1 U564 ( .A1(n512), .A2(n504), .B1(n503), .Y(n505) );
  sky130_fd_sc_hd__nor2_1 U565 ( .A(n508), .B(n680), .Y(n696) );
  sky130_fd_sc_hd__nand2_1 U566 ( .A(n509), .B(n696), .Y(out[15]) );
  sky130_fd_sc_hd__a21oi_1 U567 ( .A1(n596), .A2(n660), .B1(n666), .Y(n511) );
  sky130_fd_sc_hd__nand2_1 U568 ( .A(n510), .B(n663), .Y(n514) );
  sky130_fd_sc_hd__xor2_1 U569 ( .A(n511), .B(n514), .X(n518) );
  sky130_fd_sc_hd__a21oi_1 U570 ( .A1(n598), .A2(n513), .B1(n512), .Y(n516) );
  sky130_fd_sc_hd__xor2_1 U571 ( .A(n516), .B(n515), .X(n517) );
  sky130_fd_sc_hd__mux2_2 U572 ( .A0(n518), .A1(n517), .S(n670), .X(n519) );
  sky130_fd_sc_hd__nand2_1 U573 ( .A(n519), .B(n672), .Y(n528) );
  sky130_fd_sc_hd__nand2_1 U574 ( .A(n521), .B(n520), .Y(n522) );
  sky130_fd_sc_hd__xnor2_1 U575 ( .A(n523), .B(n522), .Y(n526) );
  sky130_fd_sc_hd__o21ai_1 U576 ( .A1(n608), .A2(n524), .B1(n607), .Y(n525) );
  sky130_fd_sc_hd__a21oi_1 U577 ( .A1(n526), .A2(n681), .B1(n525), .Y(n527) );
  sky130_fd_sc_hd__nand2_1 U578 ( .A(n528), .B(n527), .Y(out[6]) );
  sky130_fd_sc_hd__inv_1 U579 ( .A(n529), .Y(n531) );
  sky130_fd_sc_hd__nand2_1 U580 ( .A(n531), .B(n530), .Y(n533) );
  sky130_fd_sc_hd__xor2_1 U581 ( .A(n533), .B(n532), .X(n534) );
  sky130_fd_sc_hd__a21oi_1 U582 ( .A1(n681), .A2(n534), .B1(n680), .Y(n544) );
  sky130_fd_sc_hd__nand2_1 U583 ( .A(n536), .B(n579), .Y(n538) );
  sky130_fd_sc_hd__xor2_1 U584 ( .A(n580), .B(n538), .X(n541) );
  sky130_fd_sc_hd__xor2_1 U585 ( .A(n585), .B(n539), .X(n540) );
  sky130_fd_sc_hd__mux2_2 U586 ( .A0(n541), .A1(n540), .S(n670), .X(n542) );
  sky130_fd_sc_hd__nand2_1 U587 ( .A(n542), .B(n672), .Y(n543) );
  sky130_fd_sc_hd__o211ai_1 U588 ( .A1(n545), .A2(n608), .B1(n544), .C1(n543), 
        .Y(out[2]) );
  sky130_fd_sc_hd__a21oi_1 U589 ( .A1(n596), .A2(n595), .B1(n441), .Y(n550) );
  sky130_fd_sc_hd__nand2_1 U590 ( .A(n549), .B(n548), .Y(n555) );
  sky130_fd_sc_hd__xor2_1 U591 ( .A(n550), .B(n555), .X(n559) );
  sky130_fd_sc_hd__inv_1 U592 ( .A(n552), .Y(n553) );
  sky130_fd_sc_hd__a21oi_1 U593 ( .A1(n598), .A2(n554), .B1(n553), .Y(n557) );
  sky130_fd_sc_hd__xor2_1 U594 ( .A(n557), .B(n556), .X(n558) );
  sky130_fd_sc_hd__mux2_2 U595 ( .A0(n559), .A1(n558), .S(n670), .X(n560) );
  sky130_fd_sc_hd__nand2_1 U596 ( .A(n560), .B(n672), .Y(n569) );
  sky130_fd_sc_hd__nand2_1 U597 ( .A(n562), .B(n561), .Y(n563) );
  sky130_fd_sc_hd__xnor2_1 U598 ( .A(n564), .B(n563), .Y(n567) );
  sky130_fd_sc_hd__o21ai_1 U599 ( .A1(n608), .A2(n565), .B1(n607), .Y(n566) );
  sky130_fd_sc_hd__a21oi_1 U600 ( .A1(n567), .A2(n681), .B1(n566), .Y(n568) );
  sky130_fd_sc_hd__nand2_1 U601 ( .A(n569), .B(n568), .Y(out[5]) );
  sky130_fd_sc_hd__nand2_1 U602 ( .A(n572), .B(n571), .Y(n573) );
  sky130_fd_sc_hd__xnor2_1 U603 ( .A(n574), .B(n573), .Y(n575) );
  sky130_fd_sc_hd__a21oi_1 U604 ( .A1(n681), .A2(n575), .B1(n680), .Y(n593) );
  sky130_fd_sc_hd__o21ai_1 U605 ( .A1(n581), .A2(n580), .B1(n579), .Y(n582) );
  sky130_fd_sc_hd__xnor2_1 U606 ( .A(n583), .B(n582), .Y(n590) );
  sky130_fd_sc_hd__xnor2_1 U608 ( .A(n588), .B(n587), .Y(n589) );
  sky130_fd_sc_hd__mux2_2 U609 ( .A0(n590), .A1(n589), .S(n670), .X(n591) );
  sky130_fd_sc_hd__nand2_1 U610 ( .A(n591), .B(n672), .Y(n592) );
  sky130_fd_sc_hd__o211ai_1 U611 ( .A1(n189), .A2(n608), .B1(n593), .C1(n592), 
        .Y(out[3]) );
  sky130_fd_sc_hd__xnor2_1 U612 ( .A(n597), .B(n596), .Y(n601) );
  sky130_fd_sc_hd__xnor2_1 U613 ( .A(n599), .B(n598), .Y(n600) );
  sky130_fd_sc_hd__nand2_1 U614 ( .A(n602), .B(n672), .Y(n613) );
  sky130_fd_sc_hd__nand2_1 U615 ( .A(n62), .B(n603), .Y(n605) );
  sky130_fd_sc_hd__xnor2_1 U616 ( .A(n606), .B(n605), .Y(n611) );
  sky130_fd_sc_hd__a21oi_1 U618 ( .A1(n611), .A2(n681), .B1(n610), .Y(n612) );
  sky130_fd_sc_hd__nand2_1 U619 ( .A(n613), .B(n612), .Y(out[4]) );
  sky130_fd_sc_hd__a21oi_1 U621 ( .A1(n634), .A2(n633), .B1(n614), .Y(n617) );
  sky130_fd_sc_hd__inv_1 U622 ( .A(n624), .Y(n615) );
  sky130_fd_sc_hd__nand2_1 U623 ( .A(n615), .B(n623), .Y(n616) );
  sky130_fd_sc_hd__xor2_1 U624 ( .A(n617), .B(n616), .X(n691) );
  sky130_fd_sc_hd__inv_1 U625 ( .A(n618), .Y(n620) );
  sky130_fd_sc_hd__nand2_1 U626 ( .A(n620), .B(n619), .Y(n631) );
  sky130_fd_sc_hd__inv_1 U627 ( .A(n621), .Y(n648) );
  sky130_fd_sc_hd__nor2_1 U628 ( .A(n624), .B(n622), .Y(n627) );
  sky130_fd_sc_hd__nand2_1 U629 ( .A(n648), .B(n627), .Y(n629) );
  sky130_fd_sc_hd__inv_1 U630 ( .A(n647), .Y(n626) );
  sky130_fd_sc_hd__a21oi_1 U632 ( .A1(n627), .A2(n626), .B1(n625), .Y(n628) );
  sky130_fd_sc_hd__o21ai_1 U633 ( .A1(n629), .A2(n655), .B1(n628), .Y(n630) );
  sky130_fd_sc_hd__xnor2_1 U634 ( .A(n631), .B(n630), .Y(n693) );
  sky130_fd_sc_hd__nand2_1 U635 ( .A(n633), .B(n632), .Y(n635) );
  sky130_fd_sc_hd__xnor2_1 U636 ( .A(n635), .B(n634), .Y(n689) );
  sky130_fd_sc_hd__inv_1 U637 ( .A(n636), .Y(n638) );
  sky130_fd_sc_hd__nand2_1 U638 ( .A(n638), .B(n637), .Y(n641) );
  sky130_fd_sc_hd__o21ai_1 U639 ( .A1(n642), .A2(n646), .B1(n643), .Y(n640) );
  sky130_fd_sc_hd__xnor2_1 U640 ( .A(n641), .B(n640), .Y(n685) );
  sky130_fd_sc_hd__inv_1 U641 ( .A(n642), .Y(n644) );
  sky130_fd_sc_hd__nand2_1 U642 ( .A(n644), .B(n643), .Y(n645) );
  sky130_fd_sc_hd__xor2_1 U643 ( .A(n646), .B(n645), .X(n682) );
  sky130_fd_sc_hd__nand2_1 U644 ( .A(n648), .B(n647), .Y(n649) );
  sky130_fd_sc_hd__xor2_1 U645 ( .A(n655), .B(n649), .X(n687) );
  sky130_fd_sc_hd__nand2_1 U646 ( .A(n651), .B(n650), .Y(n658) );
  sky130_fd_sc_hd__inv_1 U647 ( .A(n652), .Y(n656) );
  sky130_fd_sc_hd__inv_1 U648 ( .A(n653), .Y(n654) );
  sky130_fd_sc_hd__xnor2_1 U649 ( .A(n658), .B(n657), .Y(n695) );
  sky130_fd_sc_hd__nor2_1 U651 ( .A(n659), .B(n662), .Y(n665) );
  sky130_fd_sc_hd__nand2_1 U652 ( .A(n660), .B(n665), .Y(n669) );
  sky130_fd_sc_hd__o21ai_1 U653 ( .A1(n663), .A2(n662), .B1(n661), .Y(n664) );
  sky130_fd_sc_hd__a21oi_1 U654 ( .A1(n666), .A2(n665), .B1(n664), .Y(n667) );
  sky130_fd_sc_hd__o21ai_1 U655 ( .A1(n669), .A2(n668), .B1(n667), .Y(n671) );
  sky130_fd_sc_hd__inv_1 U656 ( .A(n672), .Y(n684) );
  sky130_fd_sc_hd__nor2_1 U657 ( .A(n679), .B(n684), .Y(n675) );
  sky130_fd_sc_hd__or3_1 U658 ( .A(out[3]), .B(out[4]), .C(out[7]), .X(n673)
         );
  sky130_fd_sc_hd__or4_1 U659 ( .A(out[6]), .B(out[2]), .C(out[5]), .D(n673), 
        .X(n674) );
  sky130_fd_sc_hd__nor3_1 U660 ( .A(n675), .B(out[15]), .C(n674), .Y(n676) );
  sky130_fd_sc_hd__o21ai_1 U661 ( .A1(n677), .A2(n698), .B1(n676), .Y(n678) );
  sky130_fd_sc_hd__nor3_1 U662 ( .A(out[0]), .B(n678), .C(out[1]), .Y(zero) );
  sky130_fd_sc_hd__a21oi_1 U663 ( .A1(n682), .A2(n681), .B1(n680), .Y(n683) );
  sky130_fd_sc_hd__o21ai_1 U664 ( .A1(n684), .A2(n679), .B1(n683), .Y(out[8])
         );
  sky130_fd_sc_hd__inv_1 U665 ( .A(n685), .Y(n686) );
  sky130_fd_sc_hd__inv_1 U667 ( .A(n687), .Y(n688) );
  sky130_fd_sc_hd__o21ai_1 U668 ( .A1(n698), .A2(n688), .B1(n696), .Y(out[10])
         );
  sky130_fd_sc_hd__inv_1 U669 ( .A(n689), .Y(n690) );
  sky130_fd_sc_hd__o21ai_1 U670 ( .A1(n698), .A2(n690), .B1(n696), .Y(out[11])
         );
  sky130_fd_sc_hd__inv_1 U671 ( .A(n691), .Y(n692) );
  sky130_fd_sc_hd__o21ai_1 U672 ( .A1(n698), .A2(n692), .B1(n696), .Y(out[12])
         );
  sky130_fd_sc_hd__inv_1 U673 ( .A(n693), .Y(n694) );
  sky130_fd_sc_hd__o21ai_1 U674 ( .A1(n698), .A2(n694), .B1(n696), .Y(out[13])
         );
  sky130_fd_sc_hd__inv_1 U675 ( .A(n695), .Y(n697) );
  sky130_fd_sc_hd__inv_1 U677 ( .A(n699), .Y(error) );
  sky130_fd_sc_hd__fa_2 U495 ( .A(n393), .B(n392), .CIN(n391), .COUT(n458), 
        .SUM(n461) );
  sky130_fd_sc_hd__nor4_2 U650 ( .A(n691), .B(n693), .C(n689), .D(n5), .Y(n677) );
  sky130_fd_sc_hd__clkinv_1 U16 ( .A(in2[7]), .Y(n415) );
  sky130_fd_sc_hd__fa_1 U531 ( .A(n447), .B(n446), .CIN(n445), .COUT(n449), 
        .SUM(n469) );
  sky130_fd_sc_hd__and3_1 U8 ( .A(n229), .B(n1), .C(n276), .X(n231) );
  sky130_fd_sc_hd__o21ai_0 U13 ( .A1(in2[3]), .A2(in2[4]), .B1(n207), .Y(n208)
         );
  sky130_fd_sc_hd__o21ai_0 U27 ( .A1(in2[3]), .A2(n148), .B1(n143), .Y(n144)
         );
  sky130_fd_sc_hd__fa_2 U35 ( .A(n459), .B(n458), .CIN(n457), .COUT(n445), 
        .SUM(n468) );
  sky130_fd_sc_hd__o21ai_0 U82 ( .A1(n618), .A2(n623), .B1(n619), .Y(n489) );
  sky130_fd_sc_hd__o21ai_0 U99 ( .A1(n624), .A2(n632), .B1(n623), .Y(n625) );
  sky130_fd_sc_hd__o21ai_0 U105 ( .A1(n499), .A2(n28), .B1(n502), .Y(n29) );
  sky130_fd_sc_hd__o21ai_0 U150 ( .A1(n341), .A2(n206), .B1(n205), .Y(n212) );
  sky130_fd_sc_hd__nor2_1 U197 ( .A(n477), .B(n478), .Y(n636) );
  sky130_fd_sc_hd__o21ai_0 U198 ( .A1(n502), .A2(n501), .B1(n500), .Y(n503) );
  sky130_fd_sc_hd__inv_1 U208 ( .A(in2[6]), .Y(n27) );
  sky130_fd_sc_hd__o21ai_0 U255 ( .A1(n586), .A2(n585), .B1(n584), .Y(n587) );
  sky130_fd_sc_hd__o21ai_0 U283 ( .A1(n656), .A2(n655), .B1(n654), .Y(n657) );
  sky130_fd_sc_hd__o21ai_0 U292 ( .A1(n621), .A2(n655), .B1(n647), .Y(n634) );
  sky130_fd_sc_hd__or2_0 U358 ( .A(n318), .B(n302), .X(n303) );
  sky130_fd_sc_hd__o21ai_0 U360 ( .A1(n532), .A2(n529), .B1(n530), .Y(n574) );
  sky130_fd_sc_hd__o21ai_0 U430 ( .A1(n609), .A2(n608), .B1(n607), .Y(n610) );
  sky130_fd_sc_hd__mux2_1 U431 ( .A0(n601), .A1(n600), .S(n670), .X(n602) );
  sky130_fd_sc_hd__o21ai_0 U453 ( .A1(n608), .A2(n123), .B1(n607), .Y(n117) );
  sky130_fd_sc_hd__o21ai_0 U454 ( .A1(n698), .A2(n697), .B1(n696), .Y(out[14])
         );
  sky130_fd_sc_hd__o21ai_0 U538 ( .A1(n698), .A2(n686), .B1(n696), .Y(out[9])
         );
  sky130_fd_sc_hd__or2_0 U543 ( .A(n75), .B(n76), .X(n62) );
  sky130_fd_sc_hd__nand3_1 U553 ( .A(n137), .B(n138), .C(n341), .Y(n139) );
  sky130_fd_sc_hd__nand2_1 U563 ( .A(n249), .B(n250), .Y(n336) );
  sky130_fd_sc_hd__or2_1 U607 ( .A(n357), .B(n324), .X(n190) );
endmodule


module memory_WIDTH8_test_1 ( clk, memoryWrite, memoryRead, memoryWriteData, 
        memoryAddress, memoryOutData, test_si, test_so, test_se );
  input [15:0] memoryWriteData;
  input [2:0] memoryAddress;
  output [15:0] memoryOutData;
  input clk, memoryWrite, memoryRead, test_si, test_se;
  output test_so;
  wire   mem_0__15_, mem_0__14_, mem_0__13_, mem_0__12_, mem_0__11_,
         mem_0__10_, mem_0__9_, mem_0__8_, mem_0__7_, mem_0__6_, mem_0__5_,
         mem_0__4_, mem_0__3_, mem_0__2_, mem_0__1_, mem_0__0_, mem_1__15_,
         mem_1__14_, mem_1__13_, mem_1__12_, mem_1__11_, mem_1__10_, mem_1__9_,
         mem_1__8_, mem_1__7_, mem_1__6_, mem_1__5_, mem_1__4_, mem_1__3_,
         mem_1__2_, mem_1__1_, mem_1__0_, mem_2__15_, mem_2__14_, mem_2__13_,
         mem_2__12_, mem_2__11_, mem_2__10_, mem_2__9_, mem_2__8_, mem_2__7_,
         mem_2__6_, mem_2__5_, mem_2__4_, mem_2__3_, mem_2__2_, mem_2__1_,
         mem_2__0_, mem_3__15_, mem_3__14_, mem_3__13_, mem_3__12_, mem_3__11_,
         mem_3__10_, mem_3__9_, mem_3__8_, mem_3__7_, mem_3__6_, mem_3__5_,
         mem_3__4_, mem_3__3_, mem_3__2_, mem_3__1_, mem_3__0_, mem_4__15_,
         mem_4__14_, mem_4__13_, mem_4__12_, mem_4__11_, mem_4__10_, mem_4__9_,
         mem_4__8_, mem_4__7_, mem_4__6_, mem_4__5_, mem_4__4_, mem_4__3_,
         mem_4__2_, mem_4__1_, mem_4__0_, mem_5__15_, mem_5__14_, mem_5__13_,
         mem_5__12_, mem_5__11_, mem_5__10_, mem_5__9_, mem_5__8_, mem_5__7_,
         mem_5__6_, mem_5__5_, mem_5__4_, mem_5__3_, mem_5__2_, mem_5__1_,
         mem_5__0_, mem_6__15_, mem_6__14_, mem_6__13_, mem_6__12_, mem_6__11_,
         mem_6__10_, mem_6__9_, mem_6__8_, mem_6__7_, mem_6__6_, mem_6__5_,
         mem_6__4_, mem_6__3_, mem_6__2_, mem_6__1_, mem_6__0_, mem_7__14_,
         mem_7__13_, mem_7__12_, mem_7__11_, mem_7__10_, mem_7__9_, mem_7__8_,
         mem_7__7_, mem_7__6_, mem_7__5_, mem_7__4_, mem_7__3_, mem_7__2_,
         mem_7__1_, mem_7__0_, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111;

  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__15_ ( .D(n364), .SCD(mem_0__14_), .SCE(
        n108), .CLK(clk), .Q(mem_0__15_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__14_ ( .D(n363), .SCD(mem_0__13_), .SCE(
        n108), .CLK(clk), .Q(mem_0__14_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__13_ ( .D(n362), .SCD(mem_0__12_), .SCE(
        n108), .CLK(clk), .Q(mem_0__13_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__12_ ( .D(n361), .SCD(mem_0__11_), .SCE(
        n107), .CLK(clk), .Q(mem_0__12_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__11_ ( .D(n360), .SCD(mem_0__10_), .SCE(
        n107), .CLK(clk), .Q(mem_0__11_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__10_ ( .D(n359), .SCD(mem_0__9_), .SCE(
        n107), .CLK(clk), .Q(mem_0__10_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__9_ ( .D(n358), .SCD(mem_0__8_), .SCE(
        n107), .CLK(clk), .Q(mem_0__9_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__8_ ( .D(n357), .SCD(mem_0__7_), .SCE(
        n107), .CLK(clk), .Q(mem_0__8_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__7_ ( .D(n356), .SCD(mem_0__6_), .SCE(
        n107), .CLK(clk), .Q(mem_0__7_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__6_ ( .D(n355), .SCD(mem_0__5_), .SCE(
        n107), .CLK(clk), .Q(mem_0__6_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__5_ ( .D(n354), .SCD(mem_0__4_), .SCE(
        n107), .CLK(clk), .Q(mem_0__5_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__4_ ( .D(n353), .SCD(mem_0__3_), .SCE(
        n107), .CLK(clk), .Q(mem_0__4_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__3_ ( .D(n352), .SCD(mem_0__2_), .SCE(
        n107), .CLK(clk), .Q(mem_0__3_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__2_ ( .D(n351), .SCD(mem_0__1_), .SCE(
        n107), .CLK(clk), .Q(mem_0__2_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__1_ ( .D(n350), .SCD(mem_0__0_), .SCE(
        n107), .CLK(clk), .Q(mem_0__1_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_0__0_ ( .D(n349), .SCD(test_si), .SCE(n107), .CLK(clk), .Q(mem_0__0_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__15_ ( .D(n348), .SCD(mem_1__14_), .SCE(
        n109), .CLK(clk), .Q(mem_1__15_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__14_ ( .D(n347), .SCD(mem_1__13_), .SCE(
        n109), .CLK(clk), .Q(mem_1__14_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__13_ ( .D(n346), .SCD(mem_1__12_), .SCE(
        n109), .CLK(clk), .Q(mem_1__13_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__12_ ( .D(n345), .SCD(mem_1__11_), .SCE(
        n109), .CLK(clk), .Q(mem_1__12_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__11_ ( .D(n344), .SCD(mem_1__10_), .SCE(
        n109), .CLK(clk), .Q(mem_1__11_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__10_ ( .D(n343), .SCD(mem_1__9_), .SCE(
        n109), .CLK(clk), .Q(mem_1__10_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__9_ ( .D(n342), .SCD(mem_1__8_), .SCE(
        n108), .CLK(clk), .Q(mem_1__9_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__8_ ( .D(n341), .SCD(mem_1__7_), .SCE(
        n108), .CLK(clk), .Q(mem_1__8_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__7_ ( .D(n340), .SCD(mem_1__6_), .SCE(
        n108), .CLK(clk), .Q(mem_1__7_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__6_ ( .D(n339), .SCD(mem_1__5_), .SCE(
        n108), .CLK(clk), .Q(mem_1__6_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__5_ ( .D(n338), .SCD(mem_1__4_), .SCE(
        n108), .CLK(clk), .Q(mem_1__5_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__4_ ( .D(n337), .SCD(mem_1__3_), .SCE(
        n108), .CLK(clk), .Q(mem_1__4_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__3_ ( .D(n336), .SCD(mem_1__2_), .SCE(
        n108), .CLK(clk), .Q(mem_1__3_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__2_ ( .D(n335), .SCD(mem_1__1_), .SCE(
        n108), .CLK(clk), .Q(mem_1__2_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__1_ ( .D(n334), .SCD(mem_1__0_), .SCE(
        n108), .CLK(clk), .Q(mem_1__1_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_1__0_ ( .D(n333), .SCD(mem_0__15_), .SCE(
        n108), .CLK(clk), .Q(mem_1__0_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__15_ ( .D(n332), .SCD(mem_2__14_), .SCE(
        n110), .CLK(clk), .Q(mem_2__15_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__14_ ( .D(n331), .SCD(mem_2__13_), .SCE(
        n109), .CLK(clk), .Q(mem_2__14_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__13_ ( .D(n330), .SCD(mem_2__12_), .SCE(
        n108), .CLK(clk), .Q(mem_2__13_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__12_ ( .D(n329), .SCD(mem_2__11_), .SCE(
        n107), .CLK(clk), .Q(mem_2__12_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__11_ ( .D(n328), .SCD(mem_2__10_), .SCE(
        n110), .CLK(clk), .Q(mem_2__11_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__10_ ( .D(n327), .SCD(mem_2__9_), .SCE(
        test_se), .CLK(clk), .Q(mem_2__10_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__9_ ( .D(n326), .SCD(mem_2__8_), .SCE(
        test_se), .CLK(clk), .Q(mem_2__9_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__8_ ( .D(n325), .SCD(mem_2__7_), .SCE(
        n110), .CLK(clk), .Q(mem_2__8_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__7_ ( .D(n324), .SCD(mem_2__6_), .SCE(
        n109), .CLK(clk), .Q(mem_2__7_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__6_ ( .D(n323), .SCD(mem_2__5_), .SCE(
        n109), .CLK(clk), .Q(mem_2__6_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__5_ ( .D(n322), .SCD(mem_2__4_), .SCE(
        n109), .CLK(clk), .Q(mem_2__5_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__4_ ( .D(n321), .SCD(mem_2__3_), .SCE(
        n109), .CLK(clk), .Q(mem_2__4_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__3_ ( .D(n320), .SCD(mem_2__2_), .SCE(
        n109), .CLK(clk), .Q(mem_2__3_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__2_ ( .D(n319), .SCD(mem_2__1_), .SCE(
        n109), .CLK(clk), .Q(mem_2__2_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__1_ ( .D(n318), .SCD(mem_2__0_), .SCE(
        n109), .CLK(clk), .Q(mem_2__1_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_2__0_ ( .D(n317), .SCD(mem_1__15_), .SCE(
        n109), .CLK(clk), .Q(mem_2__0_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__15_ ( .D(n316), .SCD(mem_3__14_), .SCE(
        n108), .CLK(clk), .Q(mem_3__15_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__14_ ( .D(n315), .SCD(mem_3__13_), .SCE(
        n107), .CLK(clk), .Q(mem_3__14_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__13_ ( .D(n314), .SCD(mem_3__12_), .SCE(
        n111), .CLK(clk), .Q(mem_3__13_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__12_ ( .D(n313), .SCD(mem_3__11_), .SCE(
        n109), .CLK(clk), .Q(mem_3__12_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__11_ ( .D(n312), .SCD(mem_3__10_), .SCE(
        n108), .CLK(clk), .Q(mem_3__11_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__10_ ( .D(n311), .SCD(mem_3__9_), .SCE(
        n107), .CLK(clk), .Q(mem_3__10_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__9_ ( .D(n310), .SCD(mem_3__8_), .SCE(
        n109), .CLK(clk), .Q(mem_3__9_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__8_ ( .D(n309), .SCD(mem_3__7_), .SCE(
        n108), .CLK(clk), .Q(mem_3__8_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__7_ ( .D(n308), .SCD(mem_3__6_), .SCE(
        n107), .CLK(clk), .Q(mem_3__7_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__6_ ( .D(n307), .SCD(mem_3__5_), .SCE(
        n111), .CLK(clk), .Q(mem_3__6_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__5_ ( .D(n306), .SCD(mem_3__4_), .SCE(
        n109), .CLK(clk), .Q(mem_3__5_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__4_ ( .D(n305), .SCD(mem_3__3_), .SCE(
        n108), .CLK(clk), .Q(mem_3__4_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__3_ ( .D(n304), .SCD(mem_3__2_), .SCE(
        test_se), .CLK(clk), .Q(mem_3__3_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__2_ ( .D(n303), .SCD(mem_3__1_), .SCE(
        test_se), .CLK(clk), .Q(mem_3__2_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__1_ ( .D(n302), .SCD(mem_3__0_), .SCE(
        n111), .CLK(clk), .Q(mem_3__1_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_3__0_ ( .D(n301), .SCD(mem_2__15_), .SCE(
        n107), .CLK(clk), .Q(mem_3__0_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__15_ ( .D(n300), .SCD(mem_4__14_), .SCE(
        test_se), .CLK(clk), .Q(mem_4__15_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__14_ ( .D(n299), .SCD(mem_4__13_), .SCE(
        test_se), .CLK(clk), .Q(mem_4__14_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__13_ ( .D(n298), .SCD(mem_4__12_), .SCE(
        n111), .CLK(clk), .Q(mem_4__13_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__12_ ( .D(n297), .SCD(mem_4__11_), .SCE(
        n111), .CLK(clk), .Q(mem_4__12_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__11_ ( .D(n296), .SCD(mem_4__10_), .SCE(
        n110), .CLK(clk), .Q(mem_4__11_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__10_ ( .D(n295), .SCD(mem_4__9_), .SCE(
        test_se), .CLK(clk), .Q(mem_4__10_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__9_ ( .D(n294), .SCD(mem_4__8_), .SCE(
        test_se), .CLK(clk), .Q(mem_4__9_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__8_ ( .D(n293), .SCD(mem_4__7_), .SCE(
        n111), .CLK(clk), .Q(mem_4__8_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__7_ ( .D(n292), .SCD(mem_4__6_), .SCE(
        n110), .CLK(clk), .Q(mem_4__7_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__6_ ( .D(n291), .SCD(mem_4__5_), .SCE(
        test_se), .CLK(clk), .Q(mem_4__6_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__5_ ( .D(n290), .SCD(mem_4__4_), .SCE(
        test_se), .CLK(clk), .Q(mem_4__5_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__4_ ( .D(n289), .SCD(mem_4__3_), .SCE(
        n111), .CLK(clk), .Q(mem_4__4_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__3_ ( .D(n288), .SCD(mem_4__2_), .SCE(
        n110), .CLK(clk), .Q(mem_4__3_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__2_ ( .D(n287), .SCD(mem_4__1_), .SCE(
        test_se), .CLK(clk), .Q(mem_4__2_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__1_ ( .D(n286), .SCD(mem_4__0_), .SCE(
        test_se), .CLK(clk), .Q(mem_4__1_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_4__0_ ( .D(n285), .SCD(mem_3__15_), .SCE(
        n109), .CLK(clk), .Q(mem_4__0_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__15_ ( .D(n284), .SCD(mem_5__14_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__15_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__14_ ( .D(n283), .SCD(mem_5__13_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__14_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__13_ ( .D(n282), .SCD(mem_5__12_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__13_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__12_ ( .D(n281), .SCD(mem_5__11_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__12_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__11_ ( .D(n280), .SCD(mem_5__10_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__11_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__10_ ( .D(n279), .SCD(mem_5__9_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__10_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__9_ ( .D(n278), .SCD(mem_5__8_), .SCE(
        n108), .CLK(clk), .Q(mem_5__9_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__8_ ( .D(n277), .SCD(mem_5__7_), .SCE(
        n107), .CLK(clk), .Q(mem_5__8_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__7_ ( .D(n276), .SCD(mem_5__6_), .SCE(
        n111), .CLK(clk), .Q(mem_5__7_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__6_ ( .D(n275), .SCD(mem_5__5_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__6_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__5_ ( .D(n274), .SCD(mem_5__4_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__5_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__4_ ( .D(n273), .SCD(mem_5__3_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__4_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__3_ ( .D(n272), .SCD(mem_5__2_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__3_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__2_ ( .D(n271), .SCD(mem_5__1_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__2_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__1_ ( .D(n270), .SCD(mem_5__0_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__1_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_5__0_ ( .D(n269), .SCD(mem_4__15_), .SCE(
        test_se), .CLK(clk), .Q(mem_5__0_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__15_ ( .D(n268), .SCD(mem_6__14_), .SCE(
        n110), .CLK(clk), .Q(mem_6__15_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__14_ ( .D(n267), .SCD(mem_6__13_), .SCE(
        n110), .CLK(clk), .Q(mem_6__14_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__13_ ( .D(n266), .SCD(mem_6__12_), .SCE(
        n110), .CLK(clk), .Q(mem_6__13_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__12_ ( .D(n265), .SCD(mem_6__11_), .SCE(
        n110), .CLK(clk), .Q(mem_6__12_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__11_ ( .D(n264), .SCD(mem_6__10_), .SCE(
        n110), .CLK(clk), .Q(mem_6__11_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__10_ ( .D(n263), .SCD(mem_6__9_), .SCE(
        n110), .CLK(clk), .Q(mem_6__10_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__9_ ( .D(n262), .SCD(mem_6__8_), .SCE(
        n110), .CLK(clk), .Q(mem_6__9_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__8_ ( .D(n261), .SCD(mem_6__7_), .SCE(
        n110), .CLK(clk), .Q(mem_6__8_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__7_ ( .D(n260), .SCD(mem_6__6_), .SCE(
        test_se), .CLK(clk), .Q(mem_6__7_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__6_ ( .D(n259), .SCD(mem_6__5_), .SCE(
        test_se), .CLK(clk), .Q(mem_6__6_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__5_ ( .D(n258), .SCD(mem_6__4_), .SCE(
        test_se), .CLK(clk), .Q(mem_6__5_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__4_ ( .D(n257), .SCD(mem_6__3_), .SCE(
        test_se), .CLK(clk), .Q(mem_6__4_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__3_ ( .D(n256), .SCD(mem_6__2_), .SCE(
        test_se), .CLK(clk), .Q(mem_6__3_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__2_ ( .D(n255), .SCD(mem_6__1_), .SCE(
        test_se), .CLK(clk), .Q(mem_6__2_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__1_ ( .D(n254), .SCD(mem_6__0_), .SCE(
        test_se), .CLK(clk), .Q(mem_6__1_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_6__0_ ( .D(n253), .SCD(mem_5__15_), .SCE(
        test_se), .CLK(clk), .Q(mem_6__0_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__15_ ( .D(n252), .SCD(mem_7__14_), .SCE(
        n111), .CLK(clk), .Q(test_so) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__14_ ( .D(n251), .SCD(mem_7__13_), .SCE(
        n111), .CLK(clk), .Q(mem_7__14_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__13_ ( .D(n250), .SCD(mem_7__12_), .SCE(
        n111), .CLK(clk), .Q(mem_7__13_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__12_ ( .D(n249), .SCD(mem_7__11_), .SCE(
        n111), .CLK(clk), .Q(mem_7__12_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__11_ ( .D(n248), .SCD(mem_7__10_), .SCE(
        n111), .CLK(clk), .Q(mem_7__11_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__10_ ( .D(n247), .SCD(mem_7__9_), .SCE(
        n111), .CLK(clk), .Q(mem_7__10_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__9_ ( .D(n246), .SCD(mem_7__8_), .SCE(
        n111), .CLK(clk), .Q(mem_7__9_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__8_ ( .D(n245), .SCD(mem_7__7_), .SCE(
        n111), .CLK(clk), .Q(mem_7__8_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__7_ ( .D(n244), .SCD(mem_7__6_), .SCE(
        n111), .CLK(clk), .Q(mem_7__7_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__6_ ( .D(n243), .SCD(mem_7__5_), .SCE(
        n111), .CLK(clk), .Q(mem_7__6_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__5_ ( .D(n242), .SCD(mem_7__4_), .SCE(
        n111), .CLK(clk), .Q(mem_7__5_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__4_ ( .D(n241), .SCD(mem_7__3_), .SCE(
        n110), .CLK(clk), .Q(mem_7__4_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__3_ ( .D(n240), .SCD(mem_7__2_), .SCE(
        n110), .CLK(clk), .Q(mem_7__3_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__2_ ( .D(n239), .SCD(mem_7__1_), .SCE(
        n110), .CLK(clk), .Q(mem_7__2_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__1_ ( .D(n238), .SCD(mem_7__0_), .SCE(
        n110), .CLK(clk), .Q(mem_7__1_) );
  sky130_fd_sc_hd__sdfxtp_1 mem_reg_7__0_ ( .D(n237), .SCD(mem_6__15_), .SCE(
        n110), .CLK(clk), .Q(mem_7__0_) );
  sky130_fd_sc_hd__or3_1 U2 ( .A(memoryAddress[0]), .B(memoryAddress[1]), .C(
        n9), .X(n26) );
  sky130_fd_sc_hd__or3_1 U3 ( .A(memoryAddress[0]), .B(memoryAddress[1]), .C(
        n7), .X(n8) );
  sky130_fd_sc_hd__nand2b_1 U5 ( .A_N(memoryAddress[1]), .B(memoryAddress[0]), 
        .Y(n32) );
  sky130_fd_sc_hd__inv_1 U6 ( .A(memoryAddress[2]), .Y(n27) );
  sky130_fd_sc_hd__nand2_1 U7 ( .A(memoryWrite), .B(n27), .Y(n7) );
  sky130_fd_sc_hd__or2_2 U8 ( .A(n32), .B(n7), .X(n2) );
  sky130_fd_sc_hd__inv_1 U9 ( .A(memoryWriteData[15]), .Y(n11) );
  sky130_fd_sc_hd__o2bb2ai_1 U10 ( .B1(n2), .B2(n11), .A1_N(n2), .A2_N(
        mem_1__15_), .Y(n348) );
  sky130_fd_sc_hd__inv_1 U11 ( .A(memoryWriteData[14]), .Y(n24) );
  sky130_fd_sc_hd__o2bb2ai_1 U12 ( .B1(n2), .B2(n24), .A1_N(n2), .A2_N(
        mem_1__14_), .Y(n347) );
  sky130_fd_sc_hd__inv_1 U13 ( .A(memoryWriteData[13]), .Y(n12) );
  sky130_fd_sc_hd__o2bb2ai_1 U14 ( .B1(n2), .B2(n12), .A1_N(n2), .A2_N(
        mem_1__13_), .Y(n346) );
  sky130_fd_sc_hd__inv_1 U15 ( .A(memoryWriteData[12]), .Y(n20) );
  sky130_fd_sc_hd__o2bb2ai_1 U16 ( .B1(n2), .B2(n20), .A1_N(n2), .A2_N(
        mem_1__12_), .Y(n345) );
  sky130_fd_sc_hd__inv_1 U17 ( .A(memoryWriteData[11]), .Y(n18) );
  sky130_fd_sc_hd__o2bb2ai_1 U18 ( .B1(n2), .B2(n18), .A1_N(n2), .A2_N(
        mem_1__11_), .Y(n344) );
  sky130_fd_sc_hd__inv_1 U19 ( .A(memoryWriteData[10]), .Y(n22) );
  sky130_fd_sc_hd__o2bb2ai_1 U20 ( .B1(n2), .B2(n22), .A1_N(n2), .A2_N(
        mem_1__10_), .Y(n343) );
  sky130_fd_sc_hd__inv_1 U21 ( .A(memoryWriteData[5]), .Y(n16) );
  sky130_fd_sc_hd__o2bb2ai_1 U22 ( .B1(n2), .B2(n16), .A1_N(n2), .A2_N(
        mem_1__5_), .Y(n338) );
  sky130_fd_sc_hd__nand2_1 U23 ( .A(memoryAddress[0]), .B(memoryAddress[1]), 
        .Y(n34) );
  sky130_fd_sc_hd__or2_2 U24 ( .A(n34), .B(n7), .X(n1) );
  sky130_fd_sc_hd__inv_1 U25 ( .A(memoryWriteData[6]), .Y(n23) );
  sky130_fd_sc_hd__o2bb2ai_1 U26 ( .B1(n1), .B2(n23), .A1_N(n1), .A2_N(
        mem_3__6_), .Y(n307) );
  sky130_fd_sc_hd__inv_1 U27 ( .A(memoryWriteData[8]), .Y(n10) );
  sky130_fd_sc_hd__o2bb2ai_1 U28 ( .B1(n2), .B2(n10), .A1_N(n2), .A2_N(
        mem_1__8_), .Y(n341) );
  sky130_fd_sc_hd__inv_1 U29 ( .A(memoryWriteData[9]), .Y(n17) );
  sky130_fd_sc_hd__o2bb2ai_1 U30 ( .B1(n2), .B2(n17), .A1_N(n2), .A2_N(
        mem_1__9_), .Y(n342) );
  sky130_fd_sc_hd__inv_1 U31 ( .A(memoryWriteData[4]), .Y(n19) );
  sky130_fd_sc_hd__o2bb2ai_1 U32 ( .B1(n1), .B2(n19), .A1_N(n1), .A2_N(
        mem_3__4_), .Y(n305) );
  sky130_fd_sc_hd__inv_1 U33 ( .A(memoryWriteData[2]), .Y(n14) );
  sky130_fd_sc_hd__o2bb2ai_1 U34 ( .B1(n2), .B2(n14), .A1_N(n2), .A2_N(
        mem_1__2_), .Y(n335) );
  sky130_fd_sc_hd__inv_1 U35 ( .A(memoryWriteData[3]), .Y(n13) );
  sky130_fd_sc_hd__o2bb2ai_1 U36 ( .B1(n1), .B2(n13), .A1_N(n1), .A2_N(
        mem_3__3_), .Y(n304) );
  sky130_fd_sc_hd__o2bb2ai_1 U37 ( .B1(n1), .B2(n14), .A1_N(n1), .A2_N(
        mem_3__2_), .Y(n303) );
  sky130_fd_sc_hd__inv_1 U38 ( .A(memoryWriteData[1]), .Y(n25) );
  sky130_fd_sc_hd__o2bb2ai_1 U39 ( .B1(n1), .B2(n25), .A1_N(n1), .A2_N(
        mem_3__1_), .Y(n302) );
  sky130_fd_sc_hd__o2bb2ai_1 U40 ( .B1(n1), .B2(n11), .A1_N(n1), .A2_N(
        mem_3__15_), .Y(n316) );
  sky130_fd_sc_hd__o2bb2ai_1 U41 ( .B1(n1), .B2(n24), .A1_N(n1), .A2_N(
        mem_3__14_), .Y(n315) );
  sky130_fd_sc_hd__o2bb2ai_1 U42 ( .B1(n1), .B2(n10), .A1_N(n1), .A2_N(
        mem_3__8_), .Y(n309) );
  sky130_fd_sc_hd__o2bb2ai_1 U43 ( .B1(n1), .B2(n18), .A1_N(n1), .A2_N(
        mem_3__11_), .Y(n312) );
  sky130_fd_sc_hd__o2bb2ai_1 U44 ( .B1(n1), .B2(n12), .A1_N(n1), .A2_N(
        mem_3__13_), .Y(n314) );
  sky130_fd_sc_hd__o2bb2ai_1 U45 ( .B1(n1), .B2(n20), .A1_N(n1), .A2_N(
        mem_3__12_), .Y(n313) );
  sky130_fd_sc_hd__o2bb2ai_1 U46 ( .B1(n2), .B2(n13), .A1_N(n2), .A2_N(
        mem_1__3_), .Y(n336) );
  sky130_fd_sc_hd__o2bb2ai_1 U47 ( .B1(n1), .B2(n17), .A1_N(n1), .A2_N(
        mem_3__9_), .Y(n310) );
  sky130_fd_sc_hd__o2bb2ai_1 U48 ( .B1(n1), .B2(n22), .A1_N(n1), .A2_N(
        mem_3__10_), .Y(n311) );
  sky130_fd_sc_hd__o2bb2ai_1 U49 ( .B1(n1), .B2(n16), .A1_N(n1), .A2_N(
        mem_3__5_), .Y(n306) );
  sky130_fd_sc_hd__inv_1 U50 ( .A(memoryWriteData[7]), .Y(n21) );
  sky130_fd_sc_hd__o2bb2ai_1 U51 ( .B1(n1), .B2(n21), .A1_N(n1), .A2_N(
        mem_3__7_), .Y(n308) );
  sky130_fd_sc_hd__inv_1 U52 ( .A(memoryWriteData[0]), .Y(n15) );
  sky130_fd_sc_hd__o2bb2ai_1 U53 ( .B1(n2), .B2(n15), .A1_N(n2), .A2_N(
        mem_1__0_), .Y(n333) );
  sky130_fd_sc_hd__o2bb2ai_1 U54 ( .B1(n1), .B2(n15), .A1_N(n1), .A2_N(
        mem_3__0_), .Y(n301) );
  sky130_fd_sc_hd__o2bb2ai_1 U55 ( .B1(n2), .B2(n19), .A1_N(n2), .A2_N(
        mem_1__4_), .Y(n337) );
  sky130_fd_sc_hd__o2bb2ai_1 U56 ( .B1(n2), .B2(n25), .A1_N(n2), .A2_N(
        mem_1__1_), .Y(n334) );
  sky130_fd_sc_hd__o2bb2ai_1 U57 ( .B1(n2), .B2(n21), .A1_N(n2), .A2_N(
        mem_1__7_), .Y(n340) );
  sky130_fd_sc_hd__o2bb2ai_1 U58 ( .B1(n2), .B2(n23), .A1_N(n2), .A2_N(
        mem_1__6_), .Y(n339) );
  sky130_fd_sc_hd__nand2b_1 U59 ( .A_N(memoryAddress[0]), .B(memoryAddress[1]), 
        .Y(n31) );
  sky130_fd_sc_hd__or2_2 U60 ( .A(n31), .B(n7), .X(n3) );
  sky130_fd_sc_hd__o2bb2ai_1 U61 ( .B1(n3), .B2(n23), .A1_N(n3), .A2_N(
        mem_2__6_), .Y(n323) );
  sky130_fd_sc_hd__o2bb2ai_1 U62 ( .B1(n3), .B2(n21), .A1_N(n3), .A2_N(
        mem_2__7_), .Y(n324) );
  sky130_fd_sc_hd__o2bb2ai_1 U63 ( .B1(n3), .B2(n24), .A1_N(n3), .A2_N(
        mem_2__14_), .Y(n331) );
  sky130_fd_sc_hd__o2bb2ai_1 U64 ( .B1(n3), .B2(n18), .A1_N(n3), .A2_N(
        mem_2__11_), .Y(n328) );
  sky130_fd_sc_hd__o2bb2ai_1 U65 ( .B1(n3), .B2(n19), .A1_N(n3), .A2_N(
        mem_2__4_), .Y(n321) );
  sky130_fd_sc_hd__o2bb2ai_1 U66 ( .B1(n3), .B2(n16), .A1_N(n3), .A2_N(
        mem_2__5_), .Y(n322) );
  sky130_fd_sc_hd__o2bb2ai_1 U67 ( .B1(n3), .B2(n20), .A1_N(n3), .A2_N(
        mem_2__12_), .Y(n329) );
  sky130_fd_sc_hd__o2bb2ai_1 U68 ( .B1(n3), .B2(n17), .A1_N(n3), .A2_N(
        mem_2__9_), .Y(n326) );
  sky130_fd_sc_hd__o2bb2ai_1 U69 ( .B1(n3), .B2(n13), .A1_N(n3), .A2_N(
        mem_2__3_), .Y(n320) );
  sky130_fd_sc_hd__o2bb2ai_1 U70 ( .B1(n3), .B2(n12), .A1_N(n3), .A2_N(
        mem_2__13_), .Y(n330) );
  sky130_fd_sc_hd__o2bb2ai_1 U71 ( .B1(n3), .B2(n22), .A1_N(n3), .A2_N(
        mem_2__10_), .Y(n327) );
  sky130_fd_sc_hd__o2bb2ai_1 U72 ( .B1(n3), .B2(n14), .A1_N(n3), .A2_N(
        mem_2__2_), .Y(n319) );
  sky130_fd_sc_hd__o2bb2ai_1 U73 ( .B1(n3), .B2(n10), .A1_N(n3), .A2_N(
        mem_2__8_), .Y(n325) );
  sky130_fd_sc_hd__o2bb2ai_1 U74 ( .B1(n3), .B2(n11), .A1_N(n3), .A2_N(
        mem_2__15_), .Y(n332) );
  sky130_fd_sc_hd__o2bb2ai_1 U75 ( .B1(n3), .B2(n15), .A1_N(n3), .A2_N(
        mem_2__0_), .Y(n317) );
  sky130_fd_sc_hd__o2bb2ai_1 U76 ( .B1(n3), .B2(n25), .A1_N(n3), .A2_N(
        mem_2__1_), .Y(n318) );
  sky130_fd_sc_hd__nand2_1 U77 ( .A(memoryAddress[2]), .B(memoryWrite), .Y(n9)
         );
  sky130_fd_sc_hd__or2_2 U78 ( .A(n32), .B(n9), .X(n5) );
  sky130_fd_sc_hd__o2bb2ai_1 U79 ( .B1(n5), .B2(n11), .A1_N(n5), .A2_N(
        mem_5__15_), .Y(n284) );
  sky130_fd_sc_hd__o2bb2ai_1 U80 ( .B1(n5), .B2(n24), .A1_N(n5), .A2_N(
        mem_5__14_), .Y(n283) );
  sky130_fd_sc_hd__o2bb2ai_1 U81 ( .B1(n5), .B2(n17), .A1_N(n5), .A2_N(
        mem_5__9_), .Y(n278) );
  sky130_fd_sc_hd__o2bb2ai_1 U83 ( .B1(n4), .B2(n15), .A1_N(n4), .A2_N(
        mem_7__0_), .Y(n237) );
  sky130_fd_sc_hd__o2bb2ai_1 U84 ( .B1(n4), .B2(n25), .A1_N(n4), .A2_N(
        mem_7__1_), .Y(n238) );
  sky130_fd_sc_hd__o2bb2ai_1 U85 ( .B1(n4), .B2(n14), .A1_N(n4), .A2_N(
        mem_7__2_), .Y(n239) );
  sky130_fd_sc_hd__o2bb2ai_1 U86 ( .B1(n4), .B2(n13), .A1_N(n4), .A2_N(
        mem_7__3_), .Y(n240) );
  sky130_fd_sc_hd__o2bb2ai_1 U87 ( .B1(n4), .B2(n19), .A1_N(n4), .A2_N(
        mem_7__4_), .Y(n241) );
  sky130_fd_sc_hd__o2bb2ai_1 U88 ( .B1(n4), .B2(n16), .A1_N(n4), .A2_N(
        mem_7__5_), .Y(n242) );
  sky130_fd_sc_hd__o2bb2ai_1 U89 ( .B1(n5), .B2(n12), .A1_N(n5), .A2_N(
        mem_5__13_), .Y(n282) );
  sky130_fd_sc_hd__o2bb2ai_1 U90 ( .B1(n5), .B2(n13), .A1_N(n5), .A2_N(
        mem_5__3_), .Y(n272) );
  sky130_fd_sc_hd__o2bb2ai_1 U91 ( .B1(n4), .B2(n23), .A1_N(n4), .A2_N(
        mem_7__6_), .Y(n243) );
  sky130_fd_sc_hd__o2bb2ai_1 U92 ( .B1(n4), .B2(n21), .A1_N(n4), .A2_N(
        mem_7__7_), .Y(n244) );
  sky130_fd_sc_hd__o2bb2ai_1 U93 ( .B1(n5), .B2(n16), .A1_N(n5), .A2_N(
        mem_5__5_), .Y(n274) );
  sky130_fd_sc_hd__o2bb2ai_1 U94 ( .B1(n4), .B2(n12), .A1_N(n4), .A2_N(
        mem_7__13_), .Y(n250) );
  sky130_fd_sc_hd__o2bb2ai_1 U95 ( .B1(n4), .B2(n10), .A1_N(n4), .A2_N(
        mem_7__8_), .Y(n245) );
  sky130_fd_sc_hd__o2bb2ai_1 U96 ( .B1(n5), .B2(n23), .A1_N(n5), .A2_N(
        mem_5__6_), .Y(n275) );
  sky130_fd_sc_hd__o2bb2ai_1 U97 ( .B1(n4), .B2(n17), .A1_N(n4), .A2_N(
        mem_7__9_), .Y(n246) );
  sky130_fd_sc_hd__o2bb2ai_1 U98 ( .B1(n5), .B2(n18), .A1_N(n5), .A2_N(
        mem_5__11_), .Y(n280) );
  sky130_fd_sc_hd__o2bb2ai_1 U99 ( .B1(n5), .B2(n10), .A1_N(n5), .A2_N(
        mem_5__8_), .Y(n277) );
  sky130_fd_sc_hd__o2bb2ai_1 U100 ( .B1(n4), .B2(n22), .A1_N(n4), .A2_N(
        mem_7__10_), .Y(n247) );
  sky130_fd_sc_hd__o2bb2ai_1 U101 ( .B1(n4), .B2(n18), .A1_N(n4), .A2_N(
        mem_7__11_), .Y(n248) );
  sky130_fd_sc_hd__o2bb2ai_1 U102 ( .B1(n5), .B2(n21), .A1_N(n5), .A2_N(
        mem_5__7_), .Y(n276) );
  sky130_fd_sc_hd__o2bb2ai_1 U103 ( .B1(n4), .B2(n11), .A1_N(n4), .A2_N(
        test_so), .Y(n252) );
  sky130_fd_sc_hd__o2bb2ai_1 U104 ( .B1(n4), .B2(n20), .A1_N(n4), .A2_N(
        mem_7__12_), .Y(n249) );
  sky130_fd_sc_hd__o2bb2ai_1 U105 ( .B1(n5), .B2(n25), .A1_N(n5), .A2_N(
        mem_5__1_), .Y(n270) );
  sky130_fd_sc_hd__o2bb2ai_1 U106 ( .B1(n5), .B2(n20), .A1_N(n5), .A2_N(
        mem_5__12_), .Y(n281) );
  sky130_fd_sc_hd__o2bb2ai_1 U107 ( .B1(n4), .B2(n24), .A1_N(n4), .A2_N(
        mem_7__14_), .Y(n251) );
  sky130_fd_sc_hd__o2bb2ai_1 U108 ( .B1(n5), .B2(n19), .A1_N(n5), .A2_N(
        mem_5__4_), .Y(n273) );
  sky130_fd_sc_hd__o2bb2ai_1 U109 ( .B1(n5), .B2(n14), .A1_N(n5), .A2_N(
        mem_5__2_), .Y(n271) );
  sky130_fd_sc_hd__o2bb2ai_1 U110 ( .B1(n5), .B2(n15), .A1_N(n5), .A2_N(
        mem_5__0_), .Y(n269) );
  sky130_fd_sc_hd__o2bb2ai_1 U111 ( .B1(n5), .B2(n22), .A1_N(n5), .A2_N(
        mem_5__10_), .Y(n279) );
  sky130_fd_sc_hd__or2_2 U112 ( .A(n31), .B(n9), .X(n6) );
  sky130_fd_sc_hd__o2bb2ai_1 U113 ( .B1(n6), .B2(n19), .A1_N(n6), .A2_N(
        mem_6__4_), .Y(n257) );
  sky130_fd_sc_hd__o2bb2ai_1 U114 ( .B1(n6), .B2(n21), .A1_N(n6), .A2_N(
        mem_6__7_), .Y(n260) );
  sky130_fd_sc_hd__o2bb2ai_1 U115 ( .B1(n6), .B2(n11), .A1_N(n6), .A2_N(
        mem_6__15_), .Y(n268) );
  sky130_fd_sc_hd__o2bb2ai_1 U116 ( .B1(n6), .B2(n17), .A1_N(n6), .A2_N(
        mem_6__9_), .Y(n262) );
  sky130_fd_sc_hd__o2bb2ai_1 U117 ( .B1(n6), .B2(n14), .A1_N(n6), .A2_N(
        mem_6__2_), .Y(n255) );
  sky130_fd_sc_hd__o2bb2ai_1 U118 ( .B1(n6), .B2(n12), .A1_N(n6), .A2_N(
        mem_6__13_), .Y(n266) );
  sky130_fd_sc_hd__o2bb2ai_1 U119 ( .B1(n6), .B2(n24), .A1_N(n6), .A2_N(
        mem_6__14_), .Y(n267) );
  sky130_fd_sc_hd__o2bb2ai_1 U120 ( .B1(n6), .B2(n18), .A1_N(n6), .A2_N(
        mem_6__11_), .Y(n264) );
  sky130_fd_sc_hd__o2bb2ai_1 U121 ( .B1(n6), .B2(n10), .A1_N(n6), .A2_N(
        mem_6__8_), .Y(n261) );
  sky130_fd_sc_hd__o2bb2ai_1 U122 ( .B1(n6), .B2(n13), .A1_N(n6), .A2_N(
        mem_6__3_), .Y(n256) );
  sky130_fd_sc_hd__o2bb2ai_1 U123 ( .B1(n6), .B2(n23), .A1_N(n6), .A2_N(
        mem_6__6_), .Y(n259) );
  sky130_fd_sc_hd__o2bb2ai_1 U124 ( .B1(n6), .B2(n20), .A1_N(n6), .A2_N(
        mem_6__12_), .Y(n265) );
  sky130_fd_sc_hd__o2bb2ai_1 U125 ( .B1(n6), .B2(n15), .A1_N(n6), .A2_N(
        mem_6__0_), .Y(n253) );
  sky130_fd_sc_hd__o2bb2ai_1 U126 ( .B1(n6), .B2(n16), .A1_N(n6), .A2_N(
        mem_6__5_), .Y(n258) );
  sky130_fd_sc_hd__o2bb2ai_1 U127 ( .B1(n6), .B2(n25), .A1_N(n6), .A2_N(
        mem_6__1_), .Y(n254) );
  sky130_fd_sc_hd__o2bb2ai_1 U128 ( .B1(n6), .B2(n22), .A1_N(n6), .A2_N(
        mem_6__10_), .Y(n263) );
  sky130_fd_sc_hd__o2bb2ai_1 U129 ( .B1(n8), .B2(n19), .A1_N(n8), .A2_N(
        mem_0__4_), .Y(n353) );
  sky130_fd_sc_hd__o2bb2ai_1 U130 ( .B1(n8), .B2(n18), .A1_N(n8), .A2_N(
        mem_0__11_), .Y(n360) );
  sky130_fd_sc_hd__o2bb2ai_1 U131 ( .B1(n8), .B2(n15), .A1_N(n8), .A2_N(
        mem_0__0_), .Y(n349) );
  sky130_fd_sc_hd__o2bb2ai_1 U132 ( .B1(n8), .B2(n12), .A1_N(n8), .A2_N(
        mem_0__13_), .Y(n362) );
  sky130_fd_sc_hd__o2bb2ai_1 U133 ( .B1(n8), .B2(n25), .A1_N(n8), .A2_N(
        mem_0__1_), .Y(n350) );
  sky130_fd_sc_hd__o2bb2ai_1 U134 ( .B1(n8), .B2(n17), .A1_N(n8), .A2_N(
        mem_0__9_), .Y(n358) );
  sky130_fd_sc_hd__o2bb2ai_1 U135 ( .B1(n8), .B2(n24), .A1_N(n8), .A2_N(
        mem_0__14_), .Y(n363) );
  sky130_fd_sc_hd__o2bb2ai_1 U136 ( .B1(n8), .B2(n11), .A1_N(n8), .A2_N(
        mem_0__15_), .Y(n364) );
  sky130_fd_sc_hd__o2bb2ai_1 U137 ( .B1(n8), .B2(n10), .A1_N(n8), .A2_N(
        mem_0__8_), .Y(n357) );
  sky130_fd_sc_hd__o2bb2ai_1 U138 ( .B1(n8), .B2(n20), .A1_N(n8), .A2_N(
        mem_0__12_), .Y(n361) );
  sky130_fd_sc_hd__o2bb2ai_1 U139 ( .B1(n8), .B2(n16), .A1_N(n8), .A2_N(
        mem_0__5_), .Y(n354) );
  sky130_fd_sc_hd__o2bb2ai_1 U140 ( .B1(n8), .B2(n22), .A1_N(n8), .A2_N(
        mem_0__10_), .Y(n359) );
  sky130_fd_sc_hd__o2bb2ai_1 U141 ( .B1(n8), .B2(n13), .A1_N(n8), .A2_N(
        mem_0__3_), .Y(n352) );
  sky130_fd_sc_hd__o2bb2ai_1 U142 ( .B1(n8), .B2(n23), .A1_N(n8), .A2_N(
        mem_0__6_), .Y(n355) );
  sky130_fd_sc_hd__o2bb2ai_1 U143 ( .B1(n8), .B2(n14), .A1_N(n8), .A2_N(
        mem_0__2_), .Y(n351) );
  sky130_fd_sc_hd__o2bb2ai_1 U144 ( .B1(n8), .B2(n21), .A1_N(n8), .A2_N(
        mem_0__7_), .Y(n356) );
  sky130_fd_sc_hd__o2bb2ai_1 U145 ( .B1(n26), .B2(n10), .A1_N(n26), .A2_N(
        mem_4__8_), .Y(n293) );
  sky130_fd_sc_hd__o2bb2ai_1 U146 ( .B1(n26), .B2(n11), .A1_N(n26), .A2_N(
        mem_4__15_), .Y(n300) );
  sky130_fd_sc_hd__o2bb2ai_1 U147 ( .B1(n26), .B2(n12), .A1_N(n26), .A2_N(
        mem_4__13_), .Y(n298) );
  sky130_fd_sc_hd__o2bb2ai_1 U148 ( .B1(n26), .B2(n13), .A1_N(n26), .A2_N(
        mem_4__3_), .Y(n288) );
  sky130_fd_sc_hd__o2bb2ai_1 U149 ( .B1(n26), .B2(n14), .A1_N(n26), .A2_N(
        mem_4__2_), .Y(n287) );
  sky130_fd_sc_hd__o2bb2ai_1 U150 ( .B1(n26), .B2(n15), .A1_N(n26), .A2_N(
        mem_4__0_), .Y(n285) );
  sky130_fd_sc_hd__o2bb2ai_1 U151 ( .B1(n26), .B2(n16), .A1_N(n26), .A2_N(
        mem_4__5_), .Y(n290) );
  sky130_fd_sc_hd__o2bb2ai_1 U152 ( .B1(n26), .B2(n17), .A1_N(n26), .A2_N(
        mem_4__9_), .Y(n294) );
  sky130_fd_sc_hd__o2bb2ai_1 U153 ( .B1(n26), .B2(n18), .A1_N(n26), .A2_N(
        mem_4__11_), .Y(n296) );
  sky130_fd_sc_hd__o2bb2ai_1 U154 ( .B1(n26), .B2(n19), .A1_N(n26), .A2_N(
        mem_4__4_), .Y(n289) );
  sky130_fd_sc_hd__o2bb2ai_1 U155 ( .B1(n26), .B2(n20), .A1_N(n26), .A2_N(
        mem_4__12_), .Y(n297) );
  sky130_fd_sc_hd__o2bb2ai_1 U156 ( .B1(n26), .B2(n21), .A1_N(n26), .A2_N(
        mem_4__7_), .Y(n292) );
  sky130_fd_sc_hd__o2bb2ai_1 U157 ( .B1(n26), .B2(n22), .A1_N(n26), .A2_N(
        mem_4__10_), .Y(n295) );
  sky130_fd_sc_hd__o2bb2ai_1 U158 ( .B1(n26), .B2(n23), .A1_N(n26), .A2_N(
        mem_4__6_), .Y(n291) );
  sky130_fd_sc_hd__o2bb2ai_1 U159 ( .B1(n26), .B2(n24), .A1_N(n26), .A2_N(
        mem_4__14_), .Y(n299) );
  sky130_fd_sc_hd__o2bb2ai_1 U160 ( .B1(n26), .B2(n25), .A1_N(n26), .A2_N(
        mem_4__1_), .Y(n286) );
  sky130_fd_sc_hd__nand2_1 U161 ( .A(memoryRead), .B(n27), .Y(n29) );
  sky130_fd_sc_hd__nor3_1 U162 ( .A(memoryAddress[0]), .B(memoryAddress[1]), 
        .C(n29), .Y(n28) );
  sky130_fd_sc_hd__clkbuf_1 U163 ( .A(n28), .X(n96) );
  sky130_fd_sc_hd__nor2_1 U164 ( .A(n29), .B(n31), .Y(n95) );
  sky130_fd_sc_hd__a22oi_1 U165 ( .A1(mem_0__0_), .A2(n96), .B1(mem_2__0_), 
        .B2(n95), .Y(n38) );
  sky130_fd_sc_hd__nor2_1 U166 ( .A(n29), .B(n32), .Y(n98) );
  sky130_fd_sc_hd__nor2_1 U167 ( .A(n29), .B(n34), .Y(n97) );
  sky130_fd_sc_hd__a22oi_1 U168 ( .A1(mem_1__0_), .A2(n98), .B1(mem_3__0_), 
        .B2(n97), .Y(n37) );
  sky130_fd_sc_hd__nand2_1 U169 ( .A(memoryAddress[2]), .B(memoryRead), .Y(n33) );
  sky130_fd_sc_hd__nor3_1 U170 ( .A(memoryAddress[0]), .B(memoryAddress[1]), 
        .C(n33), .Y(n30) );
  sky130_fd_sc_hd__clkbuf_1 U171 ( .A(n30), .X(n100) );
  sky130_fd_sc_hd__nor2_1 U172 ( .A(n31), .B(n33), .Y(n99) );
  sky130_fd_sc_hd__a22oi_1 U173 ( .A1(mem_4__0_), .A2(n100), .B1(mem_6__0_), 
        .B2(n99), .Y(n36) );
  sky130_fd_sc_hd__nor2_1 U174 ( .A(n32), .B(n33), .Y(n102) );
  sky130_fd_sc_hd__nor2_1 U175 ( .A(n34), .B(n33), .Y(n101) );
  sky130_fd_sc_hd__a22oi_1 U176 ( .A1(mem_5__0_), .A2(n102), .B1(mem_7__0_), 
        .B2(n101), .Y(n35) );
  sky130_fd_sc_hd__nand4_1 U177 ( .A(n38), .B(n37), .C(n36), .D(n35), .Y(
        memoryOutData[0]) );
  sky130_fd_sc_hd__a22oi_1 U178 ( .A1(n96), .A2(mem_0__1_), .B1(n95), .B2(
        mem_2__1_), .Y(n42) );
  sky130_fd_sc_hd__a22oi_1 U179 ( .A1(n98), .A2(mem_1__1_), .B1(n97), .B2(
        mem_3__1_), .Y(n41) );
  sky130_fd_sc_hd__a22oi_1 U180 ( .A1(n100), .A2(mem_4__1_), .B1(n99), .B2(
        mem_6__1_), .Y(n40) );
  sky130_fd_sc_hd__a22oi_1 U181 ( .A1(n102), .A2(mem_5__1_), .B1(n101), .B2(
        mem_7__1_), .Y(n39) );
  sky130_fd_sc_hd__nand4_1 U182 ( .A(n42), .B(n41), .C(n40), .D(n39), .Y(
        memoryOutData[1]) );
  sky130_fd_sc_hd__a22oi_1 U183 ( .A1(n96), .A2(mem_0__2_), .B1(n95), .B2(
        mem_2__2_), .Y(n46) );
  sky130_fd_sc_hd__a22oi_1 U184 ( .A1(n98), .A2(mem_1__2_), .B1(n97), .B2(
        mem_3__2_), .Y(n45) );
  sky130_fd_sc_hd__a22oi_1 U185 ( .A1(n100), .A2(mem_4__2_), .B1(n99), .B2(
        mem_6__2_), .Y(n44) );
  sky130_fd_sc_hd__a22oi_1 U186 ( .A1(n102), .A2(mem_5__2_), .B1(n101), .B2(
        mem_7__2_), .Y(n43) );
  sky130_fd_sc_hd__nand4_1 U187 ( .A(n46), .B(n45), .C(n44), .D(n43), .Y(
        memoryOutData[2]) );
  sky130_fd_sc_hd__a22oi_1 U188 ( .A1(n96), .A2(mem_0__3_), .B1(n95), .B2(
        mem_2__3_), .Y(n50) );
  sky130_fd_sc_hd__a22oi_1 U189 ( .A1(n98), .A2(mem_1__3_), .B1(n97), .B2(
        mem_3__3_), .Y(n49) );
  sky130_fd_sc_hd__a22oi_1 U190 ( .A1(n100), .A2(mem_4__3_), .B1(n99), .B2(
        mem_6__3_), .Y(n48) );
  sky130_fd_sc_hd__a22oi_1 U191 ( .A1(n102), .A2(mem_5__3_), .B1(n101), .B2(
        mem_7__3_), .Y(n47) );
  sky130_fd_sc_hd__nand4_1 U192 ( .A(n50), .B(n49), .C(n48), .D(n47), .Y(
        memoryOutData[3]) );
  sky130_fd_sc_hd__a22oi_1 U193 ( .A1(n96), .A2(mem_0__4_), .B1(n95), .B2(
        mem_2__4_), .Y(n54) );
  sky130_fd_sc_hd__a22oi_1 U194 ( .A1(n98), .A2(mem_1__4_), .B1(n97), .B2(
        mem_3__4_), .Y(n53) );
  sky130_fd_sc_hd__a22oi_1 U195 ( .A1(n100), .A2(mem_4__4_), .B1(n99), .B2(
        mem_6__4_), .Y(n52) );
  sky130_fd_sc_hd__a22oi_1 U196 ( .A1(n102), .A2(mem_5__4_), .B1(n101), .B2(
        mem_7__4_), .Y(n51) );
  sky130_fd_sc_hd__nand4_1 U197 ( .A(n54), .B(n53), .C(n52), .D(n51), .Y(
        memoryOutData[4]) );
  sky130_fd_sc_hd__a22oi_1 U198 ( .A1(n96), .A2(mem_0__5_), .B1(n95), .B2(
        mem_2__5_), .Y(n58) );
  sky130_fd_sc_hd__a22oi_1 U199 ( .A1(n98), .A2(mem_1__5_), .B1(n97), .B2(
        mem_3__5_), .Y(n57) );
  sky130_fd_sc_hd__a22oi_1 U200 ( .A1(n100), .A2(mem_4__5_), .B1(n99), .B2(
        mem_6__5_), .Y(n56) );
  sky130_fd_sc_hd__a22oi_1 U201 ( .A1(n102), .A2(mem_5__5_), .B1(n101), .B2(
        mem_7__5_), .Y(n55) );
  sky130_fd_sc_hd__nand4_1 U202 ( .A(n58), .B(n57), .C(n56), .D(n55), .Y(
        memoryOutData[5]) );
  sky130_fd_sc_hd__a22oi_1 U203 ( .A1(n96), .A2(mem_0__6_), .B1(n95), .B2(
        mem_2__6_), .Y(n62) );
  sky130_fd_sc_hd__a22oi_1 U204 ( .A1(n98), .A2(mem_1__6_), .B1(n97), .B2(
        mem_3__6_), .Y(n61) );
  sky130_fd_sc_hd__a22oi_1 U205 ( .A1(n100), .A2(mem_4__6_), .B1(n99), .B2(
        mem_6__6_), .Y(n60) );
  sky130_fd_sc_hd__a22oi_1 U206 ( .A1(n102), .A2(mem_5__6_), .B1(n101), .B2(
        mem_7__6_), .Y(n59) );
  sky130_fd_sc_hd__nand4_1 U207 ( .A(n62), .B(n61), .C(n60), .D(n59), .Y(
        memoryOutData[6]) );
  sky130_fd_sc_hd__a22oi_1 U208 ( .A1(n96), .A2(mem_0__7_), .B1(n95), .B2(
        mem_2__7_), .Y(n66) );
  sky130_fd_sc_hd__a22oi_1 U209 ( .A1(n98), .A2(mem_1__7_), .B1(n97), .B2(
        mem_3__7_), .Y(n65) );
  sky130_fd_sc_hd__a22oi_1 U210 ( .A1(n100), .A2(mem_4__7_), .B1(n99), .B2(
        mem_6__7_), .Y(n64) );
  sky130_fd_sc_hd__a22oi_1 U211 ( .A1(n102), .A2(mem_5__7_), .B1(n101), .B2(
        mem_7__7_), .Y(n63) );
  sky130_fd_sc_hd__nand4_1 U212 ( .A(n66), .B(n65), .C(n64), .D(n63), .Y(
        memoryOutData[7]) );
  sky130_fd_sc_hd__a22oi_1 U213 ( .A1(n96), .A2(mem_0__8_), .B1(n95), .B2(
        mem_2__8_), .Y(n70) );
  sky130_fd_sc_hd__a22oi_1 U214 ( .A1(n98), .A2(mem_1__8_), .B1(n97), .B2(
        mem_3__8_), .Y(n69) );
  sky130_fd_sc_hd__a22oi_1 U215 ( .A1(n100), .A2(mem_4__8_), .B1(n99), .B2(
        mem_6__8_), .Y(n68) );
  sky130_fd_sc_hd__a22oi_1 U216 ( .A1(n102), .A2(mem_5__8_), .B1(n101), .B2(
        mem_7__8_), .Y(n67) );
  sky130_fd_sc_hd__nand4_1 U217 ( .A(n70), .B(n69), .C(n68), .D(n67), .Y(
        memoryOutData[8]) );
  sky130_fd_sc_hd__a22oi_1 U218 ( .A1(n96), .A2(mem_0__9_), .B1(n95), .B2(
        mem_2__9_), .Y(n74) );
  sky130_fd_sc_hd__a22oi_1 U219 ( .A1(n98), .A2(mem_1__9_), .B1(n97), .B2(
        mem_3__9_), .Y(n73) );
  sky130_fd_sc_hd__a22oi_1 U220 ( .A1(n100), .A2(mem_4__9_), .B1(n99), .B2(
        mem_6__9_), .Y(n72) );
  sky130_fd_sc_hd__a22oi_1 U221 ( .A1(n102), .A2(mem_5__9_), .B1(n101), .B2(
        mem_7__9_), .Y(n71) );
  sky130_fd_sc_hd__nand4_1 U222 ( .A(n74), .B(n73), .C(n72), .D(n71), .Y(
        memoryOutData[9]) );
  sky130_fd_sc_hd__a22oi_1 U223 ( .A1(n96), .A2(mem_0__10_), .B1(n95), .B2(
        mem_2__10_), .Y(n78) );
  sky130_fd_sc_hd__a22oi_1 U224 ( .A1(n98), .A2(mem_1__10_), .B1(n97), .B2(
        mem_3__10_), .Y(n77) );
  sky130_fd_sc_hd__a22oi_1 U225 ( .A1(n100), .A2(mem_4__10_), .B1(n99), .B2(
        mem_6__10_), .Y(n76) );
  sky130_fd_sc_hd__a22oi_1 U226 ( .A1(n102), .A2(mem_5__10_), .B1(n101), .B2(
        mem_7__10_), .Y(n75) );
  sky130_fd_sc_hd__nand4_1 U227 ( .A(n78), .B(n77), .C(n76), .D(n75), .Y(
        memoryOutData[10]) );
  sky130_fd_sc_hd__a22oi_1 U228 ( .A1(n96), .A2(mem_0__11_), .B1(n95), .B2(
        mem_2__11_), .Y(n82) );
  sky130_fd_sc_hd__a22oi_1 U229 ( .A1(n98), .A2(mem_1__11_), .B1(n97), .B2(
        mem_3__11_), .Y(n81) );
  sky130_fd_sc_hd__a22oi_1 U230 ( .A1(n100), .A2(mem_4__11_), .B1(n99), .B2(
        mem_6__11_), .Y(n80) );
  sky130_fd_sc_hd__a22oi_1 U231 ( .A1(n102), .A2(mem_5__11_), .B1(n101), .B2(
        mem_7__11_), .Y(n79) );
  sky130_fd_sc_hd__nand4_1 U232 ( .A(n82), .B(n81), .C(n80), .D(n79), .Y(
        memoryOutData[11]) );
  sky130_fd_sc_hd__a22oi_1 U233 ( .A1(n96), .A2(mem_0__12_), .B1(n95), .B2(
        mem_2__12_), .Y(n86) );
  sky130_fd_sc_hd__a22oi_1 U234 ( .A1(n98), .A2(mem_1__12_), .B1(n97), .B2(
        mem_3__12_), .Y(n85) );
  sky130_fd_sc_hd__a22oi_1 U235 ( .A1(n100), .A2(mem_4__12_), .B1(n99), .B2(
        mem_6__12_), .Y(n84) );
  sky130_fd_sc_hd__a22oi_1 U236 ( .A1(n102), .A2(mem_5__12_), .B1(n101), .B2(
        mem_7__12_), .Y(n83) );
  sky130_fd_sc_hd__nand4_1 U237 ( .A(n86), .B(n85), .C(n84), .D(n83), .Y(
        memoryOutData[12]) );
  sky130_fd_sc_hd__a22oi_1 U238 ( .A1(n96), .A2(mem_0__13_), .B1(n95), .B2(
        mem_2__13_), .Y(n90) );
  sky130_fd_sc_hd__a22oi_1 U239 ( .A1(n98), .A2(mem_1__13_), .B1(n97), .B2(
        mem_3__13_), .Y(n89) );
  sky130_fd_sc_hd__a22oi_1 U240 ( .A1(n100), .A2(mem_4__13_), .B1(n99), .B2(
        mem_6__13_), .Y(n88) );
  sky130_fd_sc_hd__a22oi_1 U241 ( .A1(n102), .A2(mem_5__13_), .B1(n101), .B2(
        mem_7__13_), .Y(n87) );
  sky130_fd_sc_hd__nand4_1 U242 ( .A(n90), .B(n89), .C(n88), .D(n87), .Y(
        memoryOutData[13]) );
  sky130_fd_sc_hd__a22oi_1 U243 ( .A1(n96), .A2(mem_0__14_), .B1(n95), .B2(
        mem_2__14_), .Y(n94) );
  sky130_fd_sc_hd__a22oi_1 U244 ( .A1(n98), .A2(mem_1__14_), .B1(n97), .B2(
        mem_3__14_), .Y(n93) );
  sky130_fd_sc_hd__a22oi_1 U245 ( .A1(n100), .A2(mem_4__14_), .B1(n99), .B2(
        mem_6__14_), .Y(n92) );
  sky130_fd_sc_hd__a22oi_1 U246 ( .A1(n102), .A2(mem_5__14_), .B1(n101), .B2(
        mem_7__14_), .Y(n91) );
  sky130_fd_sc_hd__nand4_1 U247 ( .A(n94), .B(n93), .C(n92), .D(n91), .Y(
        memoryOutData[14]) );
  sky130_fd_sc_hd__a22oi_1 U248 ( .A1(n96), .A2(mem_0__15_), .B1(n95), .B2(
        mem_2__15_), .Y(n106) );
  sky130_fd_sc_hd__a22oi_1 U249 ( .A1(n98), .A2(mem_1__15_), .B1(n97), .B2(
        mem_3__15_), .Y(n105) );
  sky130_fd_sc_hd__a22oi_1 U250 ( .A1(n100), .A2(mem_4__15_), .B1(n99), .B2(
        mem_6__15_), .Y(n104) );
  sky130_fd_sc_hd__a22oi_1 U251 ( .A1(n102), .A2(mem_5__15_), .B1(n101), .B2(
        test_so), .Y(n103) );
  sky130_fd_sc_hd__nand4_1 U252 ( .A(n106), .B(n105), .C(n104), .D(n103), .Y(
        memoryOutData[15]) );
  sky130_fd_sc_hd__or2_1 U4 ( .A(n34), .B(n9), .X(n4) );
  sky130_fd_sc_hd__buf_1 U82 ( .A(test_se), .X(n110) );
  sky130_fd_sc_hd__buf_1 U253 ( .A(test_se), .X(n109) );
  sky130_fd_sc_hd__buf_1 U254 ( .A(test_se), .X(n108) );
  sky130_fd_sc_hd__buf_1 U255 ( .A(test_se), .X(n107) );
  sky130_fd_sc_hd__buf_1 U256 ( .A(test_se), .X(n111) );
endmodule


module control_test_1 ( clk, rst, cmd_in, p_error, datain_reg_en, memoryWrite, 
        memoryRead, selmux2, cpu_rdy, aluout_reg_en, nvalid_data, in_select_a, 
        in_select_b, opcode, aluin_reg_en_BAR, test_si, test_so, test_se );
  input [6:0] cmd_in;
  output [1:0] in_select_a;
  output [1:0] in_select_b;
  output [3:0] opcode;
  input clk, rst, p_error, test_si, test_se;
  output datain_reg_en, memoryWrite, memoryRead, selmux2, cpu_rdy,
         aluout_reg_en, nvalid_data, aluin_reg_en_BAR, test_so;
  wire   state_2_, state_1_, state_0_, nx_state_0_, n1, n2, n3, n4, n5, n6, n7,
         n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n31, n32, n33, n34;

  sky130_fd_sc_hd__sdfrtp_1 state_reg_3_ ( .D(n32), .SCD(state_2_), .SCE(
        test_se), .CLK(clk), .RESET_B(n34), .Q(test_so) );
  sky130_fd_sc_hd__sdfrtp_1 state_reg_2_ ( .D(n33), .SCD(state_1_), .SCE(
        test_se), .CLK(clk), .RESET_B(n34), .Q(state_2_) );
  sky130_fd_sc_hd__sdfrtp_1 state_reg_1_ ( .D(datain_reg_en), .SCD(n31), .SCE(
        test_se), .CLK(clk), .RESET_B(n34), .Q(state_1_) );
  sky130_fd_sc_hd__sdfsbp_1 state_reg_0_ ( .D(nx_state_0_), .SCD(test_si), 
        .SCE(test_se), .CLK(clk), .SET_B(n34), .Q(state_0_), .Q_N(n31) );
  sky130_fd_sc_hd__inv_1 U3 ( .A(n27), .Y(cpu_rdy) );
  sky130_fd_sc_hd__nor2_1 U5 ( .A(test_so), .B(state_0_), .Y(n17) );
  sky130_fd_sc_hd__inv_1 U6 ( .A(state_1_), .Y(n16) );
  sky130_fd_sc_hd__nand3_1 U7 ( .A(n17), .B(state_2_), .C(n16), .Y(n26) );
  sky130_fd_sc_hd__inv_1 U8 ( .A(n26), .Y(n32) );
  sky130_fd_sc_hd__nand2_1 U9 ( .A(cmd_in[4]), .B(cmd_in[3]), .Y(n2) );
  sky130_fd_sc_hd__nand2_1 U10 ( .A(cmd_in[6]), .B(cmd_in[5]), .Y(n1) );
  sky130_fd_sc_hd__nand2_1 U11 ( .A(n2), .B(n1), .Y(n3) );
  sky130_fd_sc_hd__nand2_1 U12 ( .A(n3), .B(p_error), .Y(n25) );
  sky130_fd_sc_hd__nand2_1 U13 ( .A(n25), .B(cmd_in[2]), .Y(n4) );
  sky130_fd_sc_hd__nor2_1 U14 ( .A(cmd_in[1]), .B(n4), .Y(n10) );
  sky130_fd_sc_hd__inv_1 U15 ( .A(cmd_in[0]), .Y(n15) );
  sky130_fd_sc_hd__and3_1 U16 ( .A(n10), .B(n32), .C(n15), .X(memoryRead) );
  sky130_fd_sc_hd__clkbuf_1 U17 ( .A(memoryRead), .X(selmux2) );
  sky130_fd_sc_hd__inv_1 U18 ( .A(n4), .Y(n5) );
  sky130_fd_sc_hd__inv_1 U19 ( .A(cmd_in[1]), .Y(n13) );
  sky130_fd_sc_hd__nand2_1 U20 ( .A(n13), .B(n15), .Y(n12) );
  sky130_fd_sc_hd__a21oi_1 U21 ( .A1(n5), .A2(n12), .B1(n26), .Y(aluout_reg_en) );
  sky130_fd_sc_hd__nor2_1 U22 ( .A(state_1_), .B(state_2_), .Y(n8) );
  sky130_fd_sc_hd__nand3_1 U23 ( .A(n8), .B(test_so), .C(n31), .Y(n27) );
  sky130_fd_sc_hd__inv_1 U24 ( .A(state_2_), .Y(n6) );
  sky130_fd_sc_hd__nand3_1 U25 ( .A(n17), .B(state_1_), .C(n6), .Y(
        aluin_reg_en_BAR) );
  sky130_fd_sc_hd__inv_1 U26 ( .A(rst), .Y(n34) );
  sky130_fd_sc_hd__inv_1 U27 ( .A(test_so), .Y(n7) );
  sky130_fd_sc_hd__a31o_2 U28 ( .A1(n8), .A2(state_0_), .A3(n7), .B1(cpu_rdy), 
        .X(datain_reg_en) );
  sky130_fd_sc_hd__and3_1 U29 ( .A(n10), .B(cmd_in[0]), .C(cpu_rdy), .X(
        memoryWrite) );
  sky130_fd_sc_hd__inv_1 U30 ( .A(cmd_in[2]), .Y(n11) );
  sky130_fd_sc_hd__nand3_1 U31 ( .A(n32), .B(n25), .C(n11), .Y(n14) );
  sky130_fd_sc_hd__nor2_1 U32 ( .A(n12), .B(n14), .Y(opcode[0]) );
  sky130_fd_sc_hd__nor3_1 U33 ( .A(cmd_in[0]), .B(n13), .C(n14), .Y(opcode[2])
         );
  sky130_fd_sc_hd__nor3_1 U34 ( .A(n15), .B(n13), .C(n14), .Y(opcode[3]) );
  sky130_fd_sc_hd__nor3_1 U35 ( .A(cmd_in[1]), .B(n15), .C(n14), .Y(opcode[1])
         );
  sky130_fd_sc_hd__inv_1 U36 ( .A(aluin_reg_en_BAR), .Y(n33) );
  sky130_fd_sc_hd__a21oi_1 U37 ( .A1(n17), .A2(n16), .B1(state_2_), .Y(n20) );
  sky130_fd_sc_hd__inv_1 U38 ( .A(n17), .Y(n18) );
  sky130_fd_sc_hd__a22oi_1 U39 ( .A1(state_0_), .A2(test_so), .B1(n18), .B2(
        state_1_), .Y(n19) );
  sky130_fd_sc_hd__o21ai_1 U40 ( .A1(n20), .A2(n32), .B1(n19), .Y(nx_state_0_)
         );
  sky130_fd_sc_hd__inv_1 U41 ( .A(cmd_in[3]), .Y(n21) );
  sky130_fd_sc_hd__nor2_1 U42 ( .A(n21), .B(aluin_reg_en_BAR), .Y(
        in_select_b[0]) );
  sky130_fd_sc_hd__inv_1 U43 ( .A(cmd_in[4]), .Y(n22) );
  sky130_fd_sc_hd__nor2_1 U44 ( .A(n22), .B(aluin_reg_en_BAR), .Y(
        in_select_b[1]) );
  sky130_fd_sc_hd__inv_1 U45 ( .A(cmd_in[5]), .Y(n23) );
  sky130_fd_sc_hd__nor2_1 U46 ( .A(n23), .B(aluin_reg_en_BAR), .Y(
        in_select_a[0]) );
  sky130_fd_sc_hd__inv_1 U47 ( .A(cmd_in[6]), .Y(n24) );
  sky130_fd_sc_hd__nor2_1 U48 ( .A(n24), .B(aluin_reg_en_BAR), .Y(
        in_select_a[1]) );
  sky130_fd_sc_hd__a21oi_1 U49 ( .A1(n27), .A2(n26), .B1(n25), .Y(nvalid_data)
         );
endmodule


module top_WIDTH8 ( clk, rst, cmdin, din_1, din_2, din_3, dout_low, dout_high, 
        zero, error, cpu_rdy, test_si, test_so, test_se );
  input [6:0] cmdin;
  input [7:0] din_1;
  input [7:0] din_2;
  input [7:0] din_3;
  output [7:0] dout_low;
  output [7:0] dout_high;
  input clk, rst, test_si, test_se;
  output zero, error, cpu_rdy, test_so;
  wire   w_aluin_reg_en, w_datain_reg_en, w_invalid_data, w_zero, w_error,
         w_memoryWrite, w_memoryRead, w_selmux2, w_aluout_reg_en, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n124, n125;
  wire   [1:0] w_in_select_a;
  wire   [7:0] w_muxA;
  wire   [1:0] w_in_select_b;
  wire   [7:0] w_muxB;
  wire   [6:0] ff_cmd_in;
  wire   [3:0] w_opcode;
  wire   [15:0] w_alu_out;
  wire   [15:0] w_memoryOutData;

  sky130_fd_sc_hd__sdfrtp_1 ff_cmd_in_reg_6_ ( .D(n46), .SCD(ff_cmd_in[5]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(ff_cmd_in[6]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_cmd_in_reg_5_ ( .D(n45), .SCD(ff_cmd_in[4]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(ff_cmd_in[5]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_cmd_in_reg_4_ ( .D(n44), .SCD(ff_cmd_in[3]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(ff_cmd_in[4]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_cmd_in_reg_3_ ( .D(n43), .SCD(n121), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(ff_cmd_in[3]) );
  sky130_fd_sc_hd__sdfrtp_1 zero_reg ( .D(n42), .SCD(w_muxB[7]), .SCE(test_se), 
        .CLK(clk), .RESET_B(n122), .Q(zero) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_3_ ( .D(n60), .SCD(dout_low[2]), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(dout_low[3]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_5_ ( .D(n58), .SCD(dout_low[4]), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(dout_low[5]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_0_ ( .D(n63), .SCD(ff_cmd_in[6]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(dout_low[0]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_15_ ( .D(n48), .SCD(dout_high[6]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(dout_high[7]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_1_ ( .D(n62), .SCD(dout_low[0]), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(dout_low[1]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_2_ ( .D(n61), .SCD(dout_low[1]), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(dout_low[2]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_6_ ( .D(n57), .SCD(dout_low[5]), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(dout_low[6]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_7_ ( .D(n56), .SCD(dout_low[6]), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(dout_low[7]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_8_ ( .D(n55), .SCD(dout_low[7]), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(dout_high[0]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_9_ ( .D(n54), .SCD(dout_high[0]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(dout_high[1]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_10_ ( .D(n53), .SCD(dout_high[1]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(dout_high[2]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_11_ ( .D(n52), .SCD(dout_high[2]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(dout_high[3]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_12_ ( .D(n51), .SCD(dout_high[3]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(dout_high[4]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_13_ ( .D(n50), .SCD(dout_high[4]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(dout_high[5]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_14_ ( .D(n49), .SCD(dout_high[5]), 
        .SCE(test_se), .CLK(clk), .RESET_B(n122), .Q(dout_high[6]) );
  sky130_fd_sc_hd__sdfrtp_1 ff_dout_reg_4_ ( .D(n59), .SCD(dout_low[3]), .SCE(
        test_se), .CLK(clk), .RESET_B(n122), .Q(dout_low[4]) );
  sky130_fd_sc_hd__sdfrtp_1 error_reg ( .D(n47), .SCD(test_si), .SCE(test_se), 
        .CLK(clk), .RESET_B(n122), .Q(error) );
  sky130_fd_sc_hd__sdfsbp_1 ff_cmd_in_reg_2_ ( .D(n118), .SCD(n120), .SCE(
        test_se), .CLK(clk), .SET_B(n122), .Q(ff_cmd_in[2]), .Q_N(n121) );
  sky130_fd_sc_hd__sdfsbp_1 ff_cmd_in_reg_1_ ( .D(n117), .SCD(n119), .SCE(
        test_se), .CLK(clk), .SET_B(n122), .Q(ff_cmd_in[1]), .Q_N(n120) );
  sky130_fd_sc_hd__sdfsbp_1 ff_cmd_in_reg_0_ ( .D(n116), .SCD(error), .SCE(
        test_se), .CLK(clk), .SET_B(n122), .Q(ff_cmd_in[0]), .Q_N(n119) );
  sky130_fd_sc_hd__inv_1 U65 ( .A(w_aluout_reg_en), .Y(n105) );
  sky130_fd_sc_hd__inv_1 U66 ( .A(n80), .Y(n113) );
  sky130_fd_sc_hd__or2_0 U67 ( .A(w_aluout_reg_en), .B(n64), .X(n65) );
  sky130_fd_sc_hd__nand2_1 U69 ( .A(w_zero), .B(w_aluout_reg_en), .Y(n66) );
  sky130_fd_sc_hd__inv_1 U70 ( .A(zero), .Y(n64) );
  sky130_fd_sc_hd__nand2_1 U71 ( .A(n66), .B(n65), .Y(n42) );
  sky130_fd_sc_hd__inv_1 U72 ( .A(rst), .Y(n122) );
  sky130_fd_sc_hd__inv_1 U73 ( .A(error), .Y(n68) );
  sky130_fd_sc_hd__nand2_1 U74 ( .A(w_error), .B(w_aluout_reg_en), .Y(n67) );
  sky130_fd_sc_hd__o21ai_1 U75 ( .A1(w_aluout_reg_en), .A2(n68), .B1(n67), .Y(
        n47) );
  sky130_fd_sc_hd__nand2_1 U76 ( .A(w_datain_reg_en), .B(cmdin[0]), .Y(n69) );
  sky130_fd_sc_hd__nand2_1 U78 ( .A(w_datain_reg_en), .B(cmdin[1]), .Y(n70) );
  sky130_fd_sc_hd__o21ai_1 U79 ( .A1(w_datain_reg_en), .A2(n120), .B1(n70), 
        .Y(n117) );
  sky130_fd_sc_hd__nand2_1 U80 ( .A(w_datain_reg_en), .B(cmdin[2]), .Y(n71) );
  sky130_fd_sc_hd__o21ai_1 U81 ( .A1(w_datain_reg_en), .A2(n121), .B1(n71), 
        .Y(n118) );
  sky130_fd_sc_hd__inv_1 U82 ( .A(ff_cmd_in[3]), .Y(n73) );
  sky130_fd_sc_hd__nand2_1 U83 ( .A(w_datain_reg_en), .B(cmdin[3]), .Y(n72) );
  sky130_fd_sc_hd__o21ai_1 U84 ( .A1(w_datain_reg_en), .A2(n73), .B1(n72), .Y(
        n43) );
  sky130_fd_sc_hd__inv_1 U85 ( .A(ff_cmd_in[4]), .Y(n75) );
  sky130_fd_sc_hd__nand2_1 U86 ( .A(w_datain_reg_en), .B(cmdin[4]), .Y(n74) );
  sky130_fd_sc_hd__o21ai_1 U87 ( .A1(w_datain_reg_en), .A2(n75), .B1(n74), .Y(
        n44) );
  sky130_fd_sc_hd__inv_1 U88 ( .A(ff_cmd_in[5]), .Y(n77) );
  sky130_fd_sc_hd__nand2_1 U89 ( .A(w_datain_reg_en), .B(cmdin[5]), .Y(n76) );
  sky130_fd_sc_hd__o21ai_1 U90 ( .A1(w_datain_reg_en), .A2(n77), .B1(n76), .Y(
        n45) );
  sky130_fd_sc_hd__inv_1 U91 ( .A(ff_cmd_in[6]), .Y(n79) );
  sky130_fd_sc_hd__nand2_1 U92 ( .A(w_datain_reg_en), .B(cmdin[6]), .Y(n78) );
  sky130_fd_sc_hd__o21ai_1 U93 ( .A1(w_datain_reg_en), .A2(n79), .B1(n78), .Y(
        n46) );
  sky130_fd_sc_hd__nor2_1 U94 ( .A(n105), .B(w_selmux2), .Y(n112) );
  sky130_fd_sc_hd__nand2_1 U95 ( .A(w_alu_out[8]), .B(n112), .Y(n82) );
  sky130_fd_sc_hd__nand2b_1 U96 ( .A_N(n105), .B(w_selmux2), .Y(n80) );
  sky130_fd_sc_hd__a22oi_1 U97 ( .A1(dout_high[0]), .A2(n105), .B1(
        w_memoryOutData[8]), .B2(n113), .Y(n81) );
  sky130_fd_sc_hd__nand2_1 U98 ( .A(n82), .B(n81), .Y(n55) );
  sky130_fd_sc_hd__nand2_1 U99 ( .A(w_alu_out[9]), .B(n112), .Y(n84) );
  sky130_fd_sc_hd__a22oi_1 U100 ( .A1(dout_high[1]), .A2(n105), .B1(
        w_memoryOutData[9]), .B2(n113), .Y(n83) );
  sky130_fd_sc_hd__nand2_1 U101 ( .A(n84), .B(n83), .Y(n54) );
  sky130_fd_sc_hd__nand2_1 U102 ( .A(w_alu_out[10]), .B(n112), .Y(n86) );
  sky130_fd_sc_hd__a22oi_1 U103 ( .A1(dout_high[2]), .A2(n105), .B1(
        w_memoryOutData[10]), .B2(n113), .Y(n85) );
  sky130_fd_sc_hd__nand2_1 U104 ( .A(n86), .B(n85), .Y(n53) );
  sky130_fd_sc_hd__nand2_1 U105 ( .A(w_alu_out[11]), .B(n112), .Y(n88) );
  sky130_fd_sc_hd__a22oi_1 U106 ( .A1(dout_high[3]), .A2(n105), .B1(
        w_memoryOutData[11]), .B2(n113), .Y(n87) );
  sky130_fd_sc_hd__nand2_1 U107 ( .A(n88), .B(n87), .Y(n52) );
  sky130_fd_sc_hd__nand2_1 U108 ( .A(w_alu_out[12]), .B(n112), .Y(n90) );
  sky130_fd_sc_hd__a22oi_1 U109 ( .A1(dout_high[4]), .A2(n105), .B1(
        w_memoryOutData[12]), .B2(n113), .Y(n89) );
  sky130_fd_sc_hd__nand2_1 U110 ( .A(n90), .B(n89), .Y(n51) );
  sky130_fd_sc_hd__nand2_1 U111 ( .A(w_alu_out[13]), .B(n112), .Y(n92) );
  sky130_fd_sc_hd__a22oi_1 U112 ( .A1(dout_high[5]), .A2(n105), .B1(
        w_memoryOutData[13]), .B2(n113), .Y(n91) );
  sky130_fd_sc_hd__nand2_1 U113 ( .A(n92), .B(n91), .Y(n50) );
  sky130_fd_sc_hd__nand2_1 U114 ( .A(w_alu_out[14]), .B(n112), .Y(n94) );
  sky130_fd_sc_hd__a22oi_1 U115 ( .A1(dout_high[6]), .A2(n105), .B1(
        w_memoryOutData[14]), .B2(n113), .Y(n93) );
  sky130_fd_sc_hd__nand2_1 U116 ( .A(n94), .B(n93), .Y(n49) );
  sky130_fd_sc_hd__nand2_1 U117 ( .A(w_alu_out[15]), .B(n112), .Y(n96) );
  sky130_fd_sc_hd__a22oi_1 U118 ( .A1(dout_high[7]), .A2(n105), .B1(
        w_memoryOutData[15]), .B2(n113), .Y(n95) );
  sky130_fd_sc_hd__nand2_1 U119 ( .A(n96), .B(n95), .Y(n48) );
  sky130_fd_sc_hd__nand2_1 U120 ( .A(w_alu_out[0]), .B(n112), .Y(n98) );
  sky130_fd_sc_hd__a22oi_1 U121 ( .A1(dout_low[0]), .A2(n105), .B1(
        w_memoryOutData[0]), .B2(n113), .Y(n97) );
  sky130_fd_sc_hd__nand2_1 U122 ( .A(n98), .B(n97), .Y(n63) );
  sky130_fd_sc_hd__nand2_1 U123 ( .A(w_alu_out[1]), .B(n112), .Y(n100) );
  sky130_fd_sc_hd__a22oi_1 U124 ( .A1(dout_low[1]), .A2(n105), .B1(
        w_memoryOutData[1]), .B2(n113), .Y(n99) );
  sky130_fd_sc_hd__nand2_1 U125 ( .A(n100), .B(n99), .Y(n62) );
  sky130_fd_sc_hd__nand2_1 U126 ( .A(w_alu_out[2]), .B(n112), .Y(n102) );
  sky130_fd_sc_hd__a22oi_1 U127 ( .A1(dout_low[2]), .A2(n105), .B1(
        w_memoryOutData[2]), .B2(n113), .Y(n101) );
  sky130_fd_sc_hd__nand2_1 U128 ( .A(n102), .B(n101), .Y(n61) );
  sky130_fd_sc_hd__nand2_1 U129 ( .A(w_alu_out[6]), .B(n112), .Y(n104) );
  sky130_fd_sc_hd__a22oi_1 U130 ( .A1(dout_low[6]), .A2(n105), .B1(
        w_memoryOutData[6]), .B2(n113), .Y(n103) );
  sky130_fd_sc_hd__nand2_1 U131 ( .A(n104), .B(n103), .Y(n57) );
  sky130_fd_sc_hd__nand2_1 U132 ( .A(w_alu_out[7]), .B(n112), .Y(n107) );
  sky130_fd_sc_hd__a22oi_1 U133 ( .A1(dout_low[7]), .A2(n105), .B1(
        w_memoryOutData[7]), .B2(n113), .Y(n106) );
  sky130_fd_sc_hd__nand2_1 U134 ( .A(n107), .B(n106), .Y(n56) );
  sky130_fd_sc_hd__inv_1 U135 ( .A(dout_low[3]), .Y(n109) );
  sky130_fd_sc_hd__a22oi_1 U136 ( .A1(n113), .A2(w_memoryOutData[3]), .B1(n112), .B2(w_alu_out[3]), .Y(n108) );
  sky130_fd_sc_hd__o21ai_1 U137 ( .A1(w_aluout_reg_en), .A2(n109), .B1(n108), 
        .Y(n60) );
  sky130_fd_sc_hd__inv_1 U138 ( .A(dout_low[4]), .Y(n111) );
  sky130_fd_sc_hd__a22oi_1 U139 ( .A1(n113), .A2(w_memoryOutData[4]), .B1(n112), .B2(w_alu_out[4]), .Y(n110) );
  sky130_fd_sc_hd__o21ai_1 U140 ( .A1(w_aluout_reg_en), .A2(n111), .B1(n110), 
        .Y(n59) );
  sky130_fd_sc_hd__inv_1 U141 ( .A(dout_low[5]), .Y(n115) );
  sky130_fd_sc_hd__a22oi_1 U142 ( .A1(n113), .A2(w_memoryOutData[5]), .B1(n112), .B2(w_alu_out[5]), .Y(n114) );
  sky130_fd_sc_hd__buf_1 U68 ( .A(zero), .X(test_so) );
  mux4_registered_WIDTH8_test_0 uu_muxA ( .clk(clk), .rst(rst), .sel(
        w_in_select_a), .in1(din_1), .in2(din_2), .in3(din_3), .in4(dout_high), 
        .out(w_muxA), .wr_en_BAR(w_aluin_reg_en), .test_si(n124), .test_se(
        test_se) );
  mux4_registered_WIDTH8_test_1 uu_muxB ( .clk(clk), .rst(rst), .sel(
        w_in_select_b), .in1(din_1), .in2(din_2), .in3(din_3), .in4(dout_low), 
        .out(w_muxB), .wr_en_BAR(w_aluin_reg_en), .test_si(w_muxA[7]), 
        .test_se(test_se) );
  alu_WIDTH8 uu_alu ( .in1(w_muxA), .in2(w_muxB), .op(w_opcode), 
        .invalid_data(w_invalid_data), .out(w_alu_out), .zero(w_zero), .error(
        w_error) );
  memory_WIDTH8_test_1 uu_mem ( .clk(clk), .memoryWrite(w_memoryWrite), 
        .memoryRead(w_memoryRead), .memoryWriteData({dout_high, dout_low}), 
        .memoryAddress(w_muxA[2:0]), .memoryOutData(w_memoryOutData), 
        .test_si(n125), .test_so(n124), .test_se(test_se) );
  control_test_1 uu_ctrl ( .clk(clk), .rst(rst), .cmd_in(ff_cmd_in), .p_error(
        error), .datain_reg_en(w_datain_reg_en), .memoryWrite(w_memoryWrite), 
        .memoryRead(w_memoryRead), .selmux2(w_selmux2), .cpu_rdy(cpu_rdy), 
        .aluout_reg_en(w_aluout_reg_en), .nvalid_data(w_invalid_data), 
        .in_select_a(w_in_select_a), .in_select_b(w_in_select_b), .opcode(
        w_opcode), .aluin_reg_en_BAR(w_aluin_reg_en), .test_si(dout_high[7]), 
        .test_so(n125), .test_se(test_se) );
  sky130_fd_sc_hd__o21ai_0 U77 ( .A1(w_datain_reg_en), .A2(n119), .B1(n69), 
        .Y(n116) );
  sky130_fd_sc_hd__o21ai_0 U143 ( .A1(w_aluout_reg_en), .A2(n115), .B1(n114), 
        .Y(n58) );
endmodule

