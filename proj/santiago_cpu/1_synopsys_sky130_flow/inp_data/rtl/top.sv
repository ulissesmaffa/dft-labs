module top #(
  parameter WIDTH= 8
  )(
  // inputs
  input  logic               clk,
  input  logic               rst,
  input  logic       [6:0] cmdin,
  input  logic [WIDTH-1:0] din_1,
  input  logic [WIDTH-1:0] din_2,
  input  logic [WIDTH-1:0] din_3,
  
  // outputs
  output logic [WIDTH-1:0] dout_low,
  output logic [WIDTH-1:0] dout_high,
  output logic zero,
  output logic error,
  output logic cpu_rdy
);

  logic w_aluin_reg_en;

  /* ##################################################
   * 
   * [MUXA] MUX4 - Registered
   * 
     ################################################## */
  logic[1:0] w_in_select_a;
  logic [WIDTH-1:0] w_muxA;

  mux4_registered #(
    .WIDTH            (WIDTH            )
  ) uu_muxA           (
    .clk              (clk              ),
    .rst              (rst              ),
    .wr_en            (w_aluin_reg_en   ),
    .sel              (w_in_select_a    ),
    .in1              (din_1            ),
    .in2              (din_2            ),
    .in3              (din_3            ),
    .in4              (dout_high        ),
    .out              (w_muxA           )
  );

  /* ##################################################
   * 
   * [MUXB] MUX4 - Registered
   * 
     ################################################## */
  logic[1:0] w_in_select_b;
  logic [WIDTH-1:0] w_muxB;

  mux4_registered #(
    .WIDTH            (WIDTH            )
  ) uu_muxB (
    .clk              (clk              ),
    .rst              (rst              ),
    .wr_en            (w_aluin_reg_en   ),
    .sel              (w_in_select_b    ),
    .in1              (din_1            ),
    .in2              (din_2            ),
    .in3              (din_3            ),
    .in4              (dout_low         ),
    .out              (w_muxB           )
  );

  /* ##################################################
   * 
   * [CMD-IN FLOP]
   * 
     ################################################## */
  logic w_datain_reg_en;
  logic [6:0] ff_cmd_in;

  always_ff @(posedge clk or posedge rst) begin : CMD_IN_FF
    if(rst) begin
      ff_cmd_in <= {2'b00, 2'b00, 3'b111}; // NOP
    end else begin
      if(w_datain_reg_en)
        ff_cmd_in <= cmdin;
    end
  end

  /* ##################################################
   * 
   * [ALU]
   * 
     ################################################## */
  logic w_invalid_data;
  logic[3:0] w_opcode;
  logic [2*WIDTH-1:0] w_alu_out;
  logic w_zero, w_error;

  alu #(
    .WIDTH            (WIDTH            )
  ) uu_alu (
    .in1              (w_muxA           ),
    .in2              (w_muxB           ),
    .op               (w_opcode         ),
    .invalid_data     (w_invalid_data   ),
    .out              (w_alu_out        ),
    .zero             (w_zero           ),
    .error            (w_error          )
  );

  /* ##################################################
   * 
   * [MEMORY BLOCK]
   * 
     ################################################## */
  logic [2*WIDTH-1:0] ff_dout;
  logic w_memoryWrite, w_memoryRead;
  logic [2*WIDTH-1:0] w_memoryOutData;

  memory #(
    .WIDTH            (WIDTH            )
  ) uu_mem (
    .clk              (clk              ),
    .memoryWrite      (w_memoryWrite    ),
    .memoryRead       (w_memoryRead     ),
    .memoryWriteData  (ff_dout          ),
    // .memoryAddress    ({5'b0, w_muxA[2:0]}), // same size, otherwise synth error
    .memoryAddress    (w_muxA[2:0]),  // direto, sem {5'b0, ...}
    .memoryOutData    (w_memoryOutData  )
  );

  /* ##################################################
   * 
   * [CONTROL]
   * 
     ################################################## */
  logic w_selmux2;
  logic w_aluout_reg_en;

  control uu_ctrl (
    .clk              (clk              ),
    .rst              (rst              ),
    .cmd_in           (ff_cmd_in        ),
    .p_error          (error            ),
    .aluin_reg_en     (w_aluin_reg_en   ),
    .datain_reg_en    (w_datain_reg_en  ),
    .memoryWrite      (w_memoryWrite    ),
    .memoryRead       (w_memoryRead     ),
    .selmux2          (w_selmux2        ),
    .cpu_rdy          (cpu_rdy          ),
    .aluout_reg_en    (w_aluout_reg_en  ),
    .nvalid_data      (w_invalid_data   ),
    .in_select_a      (w_in_select_a    ),
    .in_select_b      (w_in_select_b    ),
    .opcode           (w_opcode         )
  );

  /* ##################################################
   * 
   * [MUX + out FFs]
   * 
     ################################################## */
  logic [2*WIDTH-1:0] w_mux_out;
  assign w_mux_out = (w_selmux2) ? w_memoryOutData : w_alu_out;

  always_ff @(posedge clk or posedge rst) begin : FF_OUT
    if(rst) begin
      ff_dout <= 0;
      zero    <= 0;
      error   <= 0;
    end else begin
      if(w_aluout_reg_en) begin
        ff_dout <= w_mux_out;
        zero    <= w_zero;
        error   <= w_error;
      end
    end
  end

  // out dout
  assign dout_high = ff_dout[2*WIDTH-1 : WIDTH];
  assign dout_low  = ff_dout[  WIDTH-1 :     0];

endmodule
