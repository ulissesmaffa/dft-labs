// s04_adder_scan: somador serial de 1 bit (Bushnell & Agrawal, Fig. 8.3)
//   soma = a ^ b ^ c        c+ = a.b + (a ^ b).c        c = flop do carry
// Mesma lógica de netlists/seq/s04_adder.v, com scan inserido À MÃO:
//   o flop do carry virou scan flop e é a cadeia inteira (si -> ff -> so).
module top ( clk, a, b, s, se, si, so );
  input  clk, a, b, se, si;
  output s, so;
  wire   c, ab, aob, abn, x, xc, xoc, xcn, cn;
  AND2X1  g1 ( .A(a),   .B(b),   .Y(ab)  );   // a.b
  OR2X1   g2 ( .A(a),   .B(b),   .Y(aob) );   // a+b
  INVX1   u1 ( .A(ab),  .Y(abn) );
  AND2X1  g3 ( .A(abn), .B(aob), .Y(x)   );   // x = a ^ b
  AND2X1  g4 ( .A(x),   .B(c),   .Y(xc)  );   // x.c
  OR2X1   g5 ( .A(x),   .B(c),   .Y(xoc) );   // x+c
  INVX1   u2 ( .A(xc),  .Y(xcn) );
  AND2X1  g6 ( .A(xoc), .B(xcn), .Y(s) );   // soma = x ^ c
  OR2X1   g7 ( .A(xc),  .B(ab),  .Y(cn)  );   // próximo carry
  SDFFHQX1 ff  ( .D(cn), .SI(si), .SE(se), .CK(clk), .Q(c) );
  BUFX2    bso ( .A(c), .Y(so) );   // saída da cadeia
endmodule
