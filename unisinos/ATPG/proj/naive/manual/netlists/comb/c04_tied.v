// c03_tied: z = (a & 0) & (b | 1) = 0  -> saída constante
// TIELO e TIEHI estão no valor controlador de cada porta:
//   0 na AND bloqueia 'a', 1 na OR bloqueia 'b'.
// Detectáveis: só as s-a-1 que fazem z = 1 (z, g3.Y, g3.A, g1.Y,
// g1.B e TIELO.Y). O resto não tem teste.
module top ( a, b, z );
  input  a, b;
  output z;
  wire   hi, lo, p, q;
  TIELO  t1 ( .Y(lo) );
  TIEHI  t0 ( .Y(hi) );
  AND2X1 g1 ( .A(a), .B(lo), .Y(p) );
  OR2X1  g2 ( .A(b), .B(hi), .Y(q) );
  AND2X1 g3 ( .A(p), .B(q),  .Y(z) );
endmodule
