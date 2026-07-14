module top (
    input  clk,
    input  rst,
    input  a,
    input  b,
    input  c,
    input  d,
    input  e,
    output reg z
);
    wire f, i, j, k, z_comb;

    and  g1 (f, a, b);        // f = a & b
    and  g2 (i, c, d);        // i = c & d
    or   g3 (j, f, c);        // j = f | c
    or   g4 (k, i, e);        // k = i | e
    or   g5 (z_comb, j, k);   // z_comb = j | k

    always @(posedge clk or posedge rst) begin
        if (rst)
            z <= 1'b0;
        else
            z <= z_comb;
    end
endmodule
