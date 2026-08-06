module top (
    input      clk, rst,
    input      din,
    output reg dout
);
    reg div_clk;
    always @(posedge clk or posedge rst)
        if (rst) div_clk <= 1'b0;
        else     div_clk <= ~div_clk;   

    always @(posedge div_clk or posedge rst) 
        if (rst) dout <= 1'b0;
        else     dout <= din;
endmodule
