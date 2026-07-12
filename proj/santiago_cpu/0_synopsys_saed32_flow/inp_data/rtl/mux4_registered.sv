module mux4_registered (
  input clk,
  input rst,
  input wr_en,
  input [1:0] sel,
  input [7:0] in1, in2, in3, in4,
  output logic [7:0] out
);

  logic [7:0] w_out;

  mux4 uu_mux4 (
    .din1     (in1    ),
    .din2     (in2    ),
    .din3     (in3    ),
    .din4     (in4    ),
    .select   (sel    ),
    .dout     (w_out  )
  );

  register_bank uu_rb (
    .clk    (clk    ),
    .rst    (rst    ),
    .wr_en  (wr_en  ),
    .in     (w_out  ),
    .out    (out    )
  );

endmodule