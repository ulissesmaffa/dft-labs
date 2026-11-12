// s03_timeframe: exemplo clássico de time frame expansion (curso de VLSI
// Testing da NTU, aula "Sequential ATPG Introduction")
//   Y1 = a & y1        Y2 = y2 | (a & y1)        z = a & y1
// Sem reset: o estado começa em X e é inicializado pela entrada (a=0 -> y1=0).
// Falha do exemplo: g2.B (ramo de y1 na AND de baixo) stuck-at-1.
//   frame -1: a=0  justifica y1=0
//   frame  0: a=1  ativa (bom: Y1=0, com falha: Y1=1)
//   frame  1: a=1  propaga até z (bom: 0, com falha: 1)
// Teste esperado em a: 0, 1, 1
module top ( clk, a, z );
  input  clk, a;
  output z;
  wire   y1, y2, n1, n2;
  AND2X1  g1 ( .A(a),  .B(y1), .Y(z)  );   // saída
  AND2X1  g2 ( .A(a),  .B(y1), .Y(n1) );   // próximo estado Y1
  OR2X1   g3 ( .A(y2), .B(n1), .Y(n2) );   // próximo estado Y2
  DFFHQX1 f1 ( .D(n1), .CK(clk), .Q(y1) );
  DFFHQX1 f2 ( .D(n2), .CK(clk), .Q(y2) );
endmodule
