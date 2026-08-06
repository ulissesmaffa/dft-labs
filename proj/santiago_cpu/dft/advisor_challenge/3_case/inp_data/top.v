module top (
    input  clk, rst, x,
    output reg dout
);
    wire p, q;
    assign p = q & x;
    assign q = p | x;  

    always @(posedge clk or posedge rst)
        if (rst) dout <= 1'b0;
        else     dout <= p;
endmodule
