module top (
    input        clk, rst,
    input  [3:0] a, b,
    output reg [7:0] dout
);
    wire [7:0] result;
    assign result[7:0] = {4'b0000, a & b};

    always @(posedge clk or posedge rst)
        if (rst) dout <= 8'b0;
        else     dout <= result;
endmodule
