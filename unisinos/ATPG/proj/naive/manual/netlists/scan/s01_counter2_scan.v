// s01_counter2_scan: contador de 2 bits com scan inserido À MÃO.
// Mesma lógica de netlists/seq/s01_counter2.v; o que muda:
//   - cada flop virou scan flop (mux na entrada: SE=0 usa D, SE=1 usa SI)
//   - os flops foram ligados em uma cadeia: si -> ... -> so
//   - 3 portas novas: se (scan enable), si (scan in), so (scan out)
module top ( clk, rst_n, en, z, se, si, so );
  input  clk, rst_n, en, se, si;
  output z, so;
  wire   q0, q1, d0, d1, c;
  XOR2X1   g1 ( .A(q0), .B(en), .Y(d0) );
  AND2X1   g2 ( .A(q0), .B(en), .Y(c)  );
  XOR2X1   g3 ( .A(q1), .B(c),  .Y(d1) );
  SDFFRHQX1 f0 ( .D(d0), .SI(si), .SE(se), .CK(clk), .RN(rst_n), .Q(q0) );
  SDFFRHQX1 f1 ( .D(d1), .SI(q0), .SE(se), .CK(clk), .RN(rst_n), .Q(q1) );
  AND2X1   g4 ( .A(q1), .B(q0), .Y(z)  );
  BUFX2    bso ( .A(q1), .Y(so) );   // saída da cadeia
endmodule
