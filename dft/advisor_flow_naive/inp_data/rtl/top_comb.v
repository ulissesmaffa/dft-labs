module top (a, b, c, d, e, z);
    input  a, b, c, d, e;
    output z;
    wire f, i, j, k;
    and  g1 (f, a, b);
    and  g2 (i, c, d);
    or   g3 (j, f, c);
    or   g4 (k, i, e);
    or   g5 (z, j, k);
endmodule
