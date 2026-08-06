module register_bank #(
  parameter WIDTH = 8
)(
  input clk,
  input rst,
  input wr_en,
  input [WIDTH-1:0] in,
  output logic[WIDTH-1:0] out
);

  always_ff @(posedge clk or posedge rst) begin : RB
    if(rst) begin
        out <= 0;
    end else begin
      if(wr_en)
        out <= in;
    end
  end

endmodule