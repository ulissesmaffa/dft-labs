// c03_tied: z = (a & 1) & (b | 0) = ab
// Entradas amarradas em constante por células TIEHI/TIELO (como sobra de
// síntese ou um pino de configuração fixo). Um nó que nunca muda não
// consegue ATIVAR a falha do mesmo valor: s-a-1 num fio que é sempre 1
// (e s-a-0 num fio sempre 0) é indetectável.
// Esperado sem teste: TIEHI.Y/g1.B s-a-1 e TIELO.Y/g2.B s-a-0.
// O s-a-0 no fio do TIEHI e o s-a-1 no fio do TIELO SÃO testáveis.
module top ( a, b, z );
  input  a, b;
  output z;
  wire   hi, lo, p, q;
  TIEHI  t1 ( .Y(hi) );
  TIELO  t0 ( .Y(lo) );
  AND2X1 g1 ( .A(a), .B(hi), .Y(p) );
  OR2X1  g2 ( .A(b), .B(lo), .Y(q) );
  AND2X1 g3 ( .A(p), .B(q),  .Y(z) );
endmodule
