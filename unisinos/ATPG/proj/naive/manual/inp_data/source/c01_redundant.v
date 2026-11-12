// c01_redundant: z = a.b + c + c.d + e  =  a.b + c + e
// O termo c.d é absorvido por c: a porta g2 é lógica redundante.
// Esperado: 2 falhas (colapsadas) sem teste possível:
//   - saída de g2 presa em 0 (equivalente a g2.A s-a-0 e g2.B s-a-0)
//   - entrada d presa em 1
// Células da gsclib045 (pinos A, B, Y).
module top ( a, b, c, d, e, z );
  input  a, b, c, d, e;
  output z;
  wire   f, i, j, k;
  AND2X1 g1 ( .A(a), .B(b), .Y(f) );
  AND2X1 g2 ( .A(c), .B(d), .Y(i) );
  OR2X1  g3 ( .A(f), .B(c), .Y(j) );
  OR2X1  g4 ( .A(i), .B(e), .Y(k) );
  OR2X1  g5 ( .A(j), .B(k), .Y(z) );
endmodule
