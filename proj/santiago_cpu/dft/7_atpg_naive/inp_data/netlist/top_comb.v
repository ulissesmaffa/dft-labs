module top ( a, b, c, d, e, z );
  input  a, b, c, d, e;
  output z;
  wire   f, i, j, k;
  AND2X1_RVT g1 ( .A1(a), .A2(b), .Y(f) );
  AND2X1_RVT g2 ( .A1(c), .A2(d), .Y(i) );
  OR2X1_RVT  g3 ( .A1(f), .A2(c), .Y(j) );
  OR2X1_RVT  g4 ( .A1(i), .A2(e), .Y(k) );
  OR2X1_RVT  g5 ( .A1(j), .A2(k), .Y(z) );
endmodule
