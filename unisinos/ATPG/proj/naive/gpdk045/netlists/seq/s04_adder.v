// s04_adder: somador serial de 1 bit (Bushnell & Agrawal, Fig. 8.3)
//   soma = a ^ b ^ c        c+ = a.b + (a ^ b).c        c = flop do carry
// Sem reset: o carry começa em X e é inicializado pelas entradas
//   (a=b=0 -> c=0 ; a=b=1 -> c=1). Enquanto c = X, a soma é X.
// Falha do livro: u1.A s-a-0 (ramo de a.b que vai para o XOR).
//   frame -1: a=b=1  inicializa c=1 (s = X)
//   frame  0: a=b=1  ativa e propaga: s = 1 (bom) / 0 (com falha)
module top ( clk, a, b, s );
  input  clk, a, b;
  output s;
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
  DFFHQX1  ff  ( .D(cn), .CK(clk), .Q(c) );
endmodule
