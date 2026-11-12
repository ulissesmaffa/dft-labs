// s02_counter6: o MESMO contador do s01, com 6 bits; z = 1 só no estado 111111
//   q[i]+ = q[i] ^ c[i]      c[0] = en      c[i+1] = c[i] & q[i]      z = &q
// Para ver z=1 a partir do reset são necessários 63 pulsos de clock com
// en=1 -> o ILA precisaria de 63 time frames. O gerador sequencial tem
// limite de profundidade (-sequentialdepth, máx. 32): as falhas que só
// aparecem perto do estado final ficam sem teste. Com scan: 1 padrão.
module top ( clk, rst_n, en, z );
  input  clk, rst_n, en;
  output z;
  wire   q0, q1, q2, q3, q4, q5;
  wire   d0, d1, d2, d3, d4, d5;
  wire   c1, c2, c3, c4, c5;
  wire   a1, a2, a3, a4;
  // próximo estado: incrementa quando en=1 (carry em cadeia)
  XOR2X1   x0 ( .A(q0), .B(en), .Y(d0) );
  AND2X1   k0 ( .A(q0), .B(en), .Y(c1) );
  XOR2X1   x1 ( .A(q1), .B(c1), .Y(d1) );
  AND2X1   k1 ( .A(q1), .B(c1), .Y(c2) );
  XOR2X1   x2 ( .A(q2), .B(c2), .Y(d2) );
  AND2X1   k2 ( .A(q2), .B(c2), .Y(c3) );
  XOR2X1   x3 ( .A(q3), .B(c3), .Y(d3) );
  AND2X1   k3 ( .A(q3), .B(c3), .Y(c4) );
  XOR2X1   x4 ( .A(q4), .B(c4), .Y(d4) );
  AND2X1   k4 ( .A(q4), .B(c4), .Y(c5) );
  XOR2X1   x5 ( .A(q5), .B(c5), .Y(d5) );
  // estado
  DFFRHQX1 f0 ( .D(d0), .CK(clk), .RN(rst_n), .Q(q0) );
  DFFRHQX1 f1 ( .D(d1), .CK(clk), .RN(rst_n), .Q(q1) );
  DFFRHQX1 f2 ( .D(d2), .CK(clk), .RN(rst_n), .Q(q2) );
  DFFRHQX1 f3 ( .D(d3), .CK(clk), .RN(rst_n), .Q(q3) );
  DFFRHQX1 f4 ( .D(d4), .CK(clk), .RN(rst_n), .Q(q4) );
  DFFRHQX1 f5 ( .D(d5), .CK(clk), .RN(rst_n), .Q(q5) );
  // saída: z = q0 & q1 & ... & q5
  AND2X1   z1 ( .A(q0), .B(q1), .Y(a1) );
  AND2X1   z2 ( .A(a1), .B(q2), .Y(a2) );
  AND2X1   z3 ( .A(a2), .B(q3), .Y(a3) );
  AND2X1   z4 ( .A(a3), .B(q4), .Y(a4) );
  AND2X1   z5 ( .A(a4), .B(q5), .Y(z) );
endmodule
