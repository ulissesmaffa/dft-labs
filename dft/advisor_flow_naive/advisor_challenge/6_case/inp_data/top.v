module top (
    input      clk, rst, din,
    output reg dout
);
    wire flag = clk & din;         

    always @(posedge clk or posedge rst)
        if (rst) dout <= 1'b0;
        else     dout <= flag;
endmodule
