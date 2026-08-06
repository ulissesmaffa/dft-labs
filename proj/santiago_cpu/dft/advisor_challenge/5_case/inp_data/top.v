module top (
    input      clk, rst,
    input      err, din,
    output reg dout
);
    wire local_rst = rst | err; 

    always @(posedge clk or posedge local_rst)
        if (local_rst) dout <= 1'b0;
        else           dout <= din;
endmodule
