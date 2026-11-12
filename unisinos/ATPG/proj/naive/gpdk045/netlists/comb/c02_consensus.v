// c02_consensus: z = ab + a'c + bc
// O termo bc é o consenso de ab e a'c (teorema do consenso): não muda a
// função, mas cobre o hazard estático-1 quando b=c=1 e "a" troca de valor.
// Lógica redundante colocada DE PROPÓSITO -> falhas indetectáveis.
// Esperado: classe "r s-a-0" redundante (g3.A, g3.B, g3.Y e g5.B s-a-0).
module top ( a, b, c, z );
  input  a, b, c;
  output z;
  wire   an, p, q, r, s;
  INVX1  u1 ( .A(a),  .Y(an) );
  AND2X1 g1 ( .A(a),  .B(b), .Y(p) );   // ab
  AND2X1 g2 ( .A(an), .B(c), .Y(q) );   // a'c
  AND2X1 g3 ( .A(b),  .B(c), .Y(r) );   // bc (consenso)
  OR2X1  g4 ( .A(p),  .B(q), .Y(s) );
  OR2X1  g5 ( .A(s),  .B(r), .Y(z) );
endmodule
