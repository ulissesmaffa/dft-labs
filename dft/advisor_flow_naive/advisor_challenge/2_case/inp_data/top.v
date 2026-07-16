module top (
    input       clk, rst, en,
    input [3:0] din,
    output reg [3:0] dout
);
    reg [3:0] hold;
    always @(*)
        if (en) hold = din;

    always @(posedge clk or posedge rst)
        if (rst) dout <= 4'b0;
        else     dout <= hold;
endmodule
