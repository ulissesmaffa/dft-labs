// s01_counter2: contador de 2 bits com enable e reset; z = 1 só no estado 11
//   q0+ = q0 ^ en        q1+ = q1 ^ (q0 & en)        z = q1 & q0
// SEM scan: o estado só é alcançado contando. Para ver z=1 a partir do
// reset são necessários 3 pulsos de clock com en=1 -> o ATPG sequencial
// precisa desenrolar pelo menos 3 time frames (ILA).
module top ( clk, rst_n, en, z );
  input  clk, rst_n, en;
  output z;
  wire   q0, q1, d0, d1, c;
  XOR2X1   g1 ( .A(q0), .B(en), .Y(d0) );
  AND2X1   g2 ( .A(q0), .B(en), .Y(c)  );
  XOR2X1   g3 ( .A(q1), .B(c),  .Y(d1) );
  DFFRHQX1 f0 ( .D(d0), .CK(clk), .RN(rst_n), .Q(q0) );
  DFFRHQX1 f1 ( .D(d1), .CK(clk), .RN(rst_n), .Q(q1) );
  AND2X1   g4 ( .A(q1), .B(q0), .Y(z)  );
endmodule
