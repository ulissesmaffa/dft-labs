module register_bank (
  input clk,
  input rst,
  input wr_en,
  input [7:0] in,
  output logic[7:0] out
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