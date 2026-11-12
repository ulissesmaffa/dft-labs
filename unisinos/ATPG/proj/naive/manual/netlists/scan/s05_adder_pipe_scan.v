// s05_adder_pipe_scan: o somador do s04 com uma fila de 40 flops na saída
//   soma = a ^ b ^ c        c+ = a.b + (a ^ b).c        c = flop do carry
// Mesma lógica de netlists/seq/s05_adder_pipe.v, com scan inserido À MÃO:
//   cadeia si -> p39 -> ... -> p0 -> ff -> so (41 flops), na ordem inversa da fila
//   para que SI e D de cada flop sejam fios diferentes.
module top ( clk, a, b, s, se, si, so );
  input  clk, a, b, se, si;
  output s, so;
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
  SDFFHQX1 ff  ( .D(cn), .SI(q0), .SE(se), .CK(clk), .Q(c) );
  // fila de 40 flops entre a soma e a saída
  SDFFHQX1 p0  ( .D(sum), .SI(q1), .SE(se), .CK(clk), .Q(q0) );
  SDFFHQX1 p1  ( .D(q0), .SI(q2), .SE(se), .CK(clk), .Q(q1) );
  SDFFHQX1 p2  ( .D(q1), .SI(q3), .SE(se), .CK(clk), .Q(q2) );
  SDFFHQX1 p3  ( .D(q2), .SI(q4), .SE(se), .CK(clk), .Q(q3) );
  SDFFHQX1 p4  ( .D(q3), .SI(q5), .SE(se), .CK(clk), .Q(q4) );
  SDFFHQX1 p5  ( .D(q4), .SI(q6), .SE(se), .CK(clk), .Q(q5) );
  SDFFHQX1 p6  ( .D(q5), .SI(q7), .SE(se), .CK(clk), .Q(q6) );
  SDFFHQX1 p7  ( .D(q6), .SI(q8), .SE(se), .CK(clk), .Q(q7) );
  SDFFHQX1 p8  ( .D(q7), .SI(q9), .SE(se), .CK(clk), .Q(q8) );
  SDFFHQX1 p9  ( .D(q8), .SI(q10), .SE(se), .CK(clk), .Q(q9) );
  SDFFHQX1 p10 ( .D(q9), .SI(q11), .SE(se), .CK(clk), .Q(q10) );
  SDFFHQX1 p11 ( .D(q10), .SI(q12), .SE(se), .CK(clk), .Q(q11) );
  SDFFHQX1 p12 ( .D(q11), .SI(q13), .SE(se), .CK(clk), .Q(q12) );
  SDFFHQX1 p13 ( .D(q12), .SI(q14), .SE(se), .CK(clk), .Q(q13) );
  SDFFHQX1 p14 ( .D(q13), .SI(q15), .SE(se), .CK(clk), .Q(q14) );
  SDFFHQX1 p15 ( .D(q14), .SI(q16), .SE(se), .CK(clk), .Q(q15) );
  SDFFHQX1 p16 ( .D(q15), .SI(q17), .SE(se), .CK(clk), .Q(q16) );
  SDFFHQX1 p17 ( .D(q16), .SI(q18), .SE(se), .CK(clk), .Q(q17) );
  SDFFHQX1 p18 ( .D(q17), .SI(q19), .SE(se), .CK(clk), .Q(q18) );
  SDFFHQX1 p19 ( .D(q18), .SI(q20), .SE(se), .CK(clk), .Q(q19) );
  SDFFHQX1 p20 ( .D(q19), .SI(q21), .SE(se), .CK(clk), .Q(q20) );
  SDFFHQX1 p21 ( .D(q20), .SI(q22), .SE(se), .CK(clk), .Q(q21) );
  SDFFHQX1 p22 ( .D(q21), .SI(q23), .SE(se), .CK(clk), .Q(q22) );
  SDFFHQX1 p23 ( .D(q22), .SI(q24), .SE(se), .CK(clk), .Q(q23) );
  SDFFHQX1 p24 ( .D(q23), .SI(q25), .SE(se), .CK(clk), .Q(q24) );
  SDFFHQX1 p25 ( .D(q24), .SI(q26), .SE(se), .CK(clk), .Q(q25) );
  SDFFHQX1 p26 ( .D(q25), .SI(q27), .SE(se), .CK(clk), .Q(q26) );
  SDFFHQX1 p27 ( .D(q26), .SI(q28), .SE(se), .CK(clk), .Q(q27) );
  SDFFHQX1 p28 ( .D(q27), .SI(q29), .SE(se), .CK(clk), .Q(q28) );
  SDFFHQX1 p29 ( .D(q28), .SI(q30), .SE(se), .CK(clk), .Q(q29) );
  SDFFHQX1 p30 ( .D(q29), .SI(q31), .SE(se), .CK(clk), .Q(q30) );
  SDFFHQX1 p31 ( .D(q30), .SI(q32), .SE(se), .CK(clk), .Q(q31) );
  SDFFHQX1 p32 ( .D(q31), .SI(q33), .SE(se), .CK(clk), .Q(q32) );
  SDFFHQX1 p33 ( .D(q32), .SI(q34), .SE(se), .CK(clk), .Q(q33) );
  SDFFHQX1 p34 ( .D(q33), .SI(q35), .SE(se), .CK(clk), .Q(q34) );
  SDFFHQX1 p35 ( .D(q34), .SI(q36), .SE(se), .CK(clk), .Q(q35) );
  SDFFHQX1 p36 ( .D(q35), .SI(q37), .SE(se), .CK(clk), .Q(q36) );
  SDFFHQX1 p37 ( .D(q36), .SI(q38), .SE(se), .CK(clk), .Q(q37) );
  SDFFHQX1 p38 ( .D(q37), .SI(s), .SE(se), .CK(clk), .Q(q38) );
  SDFFHQX1 p39 ( .D(q38), .SI(si), .SE(se), .CK(clk), .Q(s) );
  BUFX2    bso ( .A(c), .Y(so) );   // saída da cadeia
endmodule
