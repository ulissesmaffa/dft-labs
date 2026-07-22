module top (
    input  clk, rst, x,
    output reg dout
);
    wire p, q;
    //assign p = q & x;
    //assign q = p | x;  
    assign q = x;
    assign p = q & x;		

    always @(posedge clk or posedge rst)
        if (rst) dout <= 1'b0;
        else     dout <= x;
endmodule
