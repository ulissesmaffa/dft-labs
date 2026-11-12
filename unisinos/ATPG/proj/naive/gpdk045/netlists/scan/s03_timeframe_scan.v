// s03_timeframe_scan: exemplo de time frame expansion com scan inserido À MÃO.
// Mesma lógica de netlists/seq/s03_timeframe.v; o que muda:
//   - cada flop virou scan flop (mux na entrada: SE=0 usa D, SE=1 usa SI)
//   - os flops foram ligados em uma cadeia: si -> ... -> so
//   - 3 portas novas: se (scan enable), si (scan in), so (scan out)
module top ( clk, a, z, se, si, so );
  input  clk, a, se, si;
  output z, so;
  wire   y1, y2, n1, n2;
  AND2X1  g1 ( .A(a),  .B(y1), .Y(z)  );   // saída
  AND2X1  g2 ( .A(a),  .B(y1), .Y(n1) );   // próximo estado Y1
  OR2X1   g3 ( .A(y2), .B(n1), .Y(n2) );   // próximo estado Y2
  SDFFHQX1 f1 ( .D(n1), .SI(si), .SE(se), .CK(clk), .Q(y1) );
  SDFFHQX1 f2 ( .D(n2), .SI(y1), .SE(se), .CK(clk), .Q(y2) );
  BUFX2    bso ( .A(y2), .Y(so) );   // saída da cadeia
endmodule
