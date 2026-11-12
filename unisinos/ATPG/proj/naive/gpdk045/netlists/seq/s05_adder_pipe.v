// s05_adder_pipe: o somador do s04 com uma fila de 40 flops na saída
//   soma = a ^ b ^ c        c+ = a.b + (a ^ b).c        c = flop do carry
// A soma só chega na saída s depois de 40 pulsos de clock (p0 -> ... -> p39).
// Sem reset: os flops da fila começam em X, então QUALQUER teste precisa de
//   pelo menos 41 pulsos -> mais que o limite de 32 do -sequentialdepth.
module top ( clk, a, b, s );
  input  clk, a, b;
  output s;
  wire   c, ab, aob, abn, x, xc, xoc, xcn, cn, sum;
  wire   q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, q32, q33, q34, q35, q36, q37, q38;
  AND2X1  g1 ( .A(a),   .B(b),   .Y(ab)  );   // a.b
  OR2X1   g2 ( .A(a),   .B(b),   .Y(aob) );   // a+b
  INVX1   u1 ( .A(ab),  .Y(abn) );
  AND2X1  g3 ( .A(abn), .B(aob), .Y(x)   );   // x = a ^ b
  AND2X1  g4 ( .A(x),   .B(c),   .Y(xc)  );   // x.c
  OR2X1   g5 ( .A(x),   .B(c),   .Y(xoc) );   // x+c
  INVX1   u2 ( .A(xc),  .Y(xcn) );
  AND2X1  g6 ( .A(xoc), .B(xcn), .Y(sum) );   // soma = x ^ c
  OR2X1   g7 ( .A(xc),  .B(ab),  .Y(cn)  );   // próximo carry
  DFFHQX1  ff  ( .D(cn), .CK(clk), .Q(c) );
  // fila de 40 flops entre a soma e a saída
  DFFHQX1  p0  ( .D(sum), .CK(clk), .Q(q0) );
  DFFHQX1  p1  ( .D(q0), .CK(clk), .Q(q1) );
  DFFHQX1  p2  ( .D(q1), .CK(clk), .Q(q2) );
  DFFHQX1  p3  ( .D(q2), .CK(clk), .Q(q3) );
  DFFHQX1  p4  ( .D(q3), .CK(clk), .Q(q4) );
  DFFHQX1  p5  ( .D(q4), .CK(clk), .Q(q5) );
  DFFHQX1  p6  ( .D(q5), .CK(clk), .Q(q6) );
  DFFHQX1  p7  ( .D(q6), .CK(clk), .Q(q7) );
  DFFHQX1  p8  ( .D(q7), .CK(clk), .Q(q8) );
  DFFHQX1  p9  ( .D(q8), .CK(clk), .Q(q9) );
  DFFHQX1  p10 ( .D(q9), .CK(clk), .Q(q10) );
  DFFHQX1  p11 ( .D(q10), .CK(clk), .Q(q11) );
  DFFHQX1  p12 ( .D(q11), .CK(clk), .Q(q12) );
  DFFHQX1  p13 ( .D(q12), .CK(clk), .Q(q13) );
  DFFHQX1  p14 ( .D(q13), .CK(clk), .Q(q14) );
  DFFHQX1  p15 ( .D(q14), .CK(clk), .Q(q15) );
  DFFHQX1  p16 ( .D(q15), .CK(clk), .Q(q16) );
  DFFHQX1  p17 ( .D(q16), .CK(clk), .Q(q17) );
  DFFHQX1  p18 ( .D(q17), .CK(clk), .Q(q18) );
  DFFHQX1  p19 ( .D(q18), .CK(clk), .Q(q19) );
  DFFHQX1  p20 ( .D(q19), .CK(clk), .Q(q20) );
  DFFHQX1  p21 ( .D(q20), .CK(clk), .Q(q21) );
  DFFHQX1  p22 ( .D(q21), .CK(clk), .Q(q22) );
  DFFHQX1  p23 ( .D(q22), .CK(clk), .Q(q23) );
  DFFHQX1  p24 ( .D(q23), .CK(clk), .Q(q24) );
  DFFHQX1  p25 ( .D(q24), .CK(clk), .Q(q25) );
  DFFHQX1  p26 ( .D(q25), .CK(clk), .Q(q26) );
  DFFHQX1  p27 ( .D(q26), .CK(clk), .Q(q27) );
  DFFHQX1  p28 ( .D(q27), .CK(clk), .Q(q28) );
  DFFHQX1  p29 ( .D(q28), .CK(clk), .Q(q29) );
  DFFHQX1  p30 ( .D(q29), .CK(clk), .Q(q30) );
  DFFHQX1  p31 ( .D(q30), .CK(clk), .Q(q31) );
  DFFHQX1  p32 ( .D(q31), .CK(clk), .Q(q32) );
  DFFHQX1  p33 ( .D(q32), .CK(clk), .Q(q33) );
  DFFHQX1  p34 ( .D(q33), .CK(clk), .Q(q34) );
  DFFHQX1  p35 ( .D(q34), .CK(clk), .Q(q35) );
  DFFHQX1  p36 ( .D(q35), .CK(clk), .Q(q36) );
  DFFHQX1  p37 ( .D(q36), .CK(clk), .Q(q37) );
  DFFHQX1  p38 ( .D(q37), .CK(clk), .Q(q38) );
  DFFHQX1  p39 ( .D(q38), .CK(clk), .Q(s) );
endmodule
