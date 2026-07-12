module alu (
  input  logic [7:0] in1, in2,
  input  logic [3:0] op,
  input  logic invalid_data,
  output logic [2*7:0] out,
  output logic zero,
  output logic error
);

  // one-hot to use less comb logic
  typedef enum logic [3:0] {
    ADD = 4'b0001,
    SUB = 4'b0010,
    MUL = 4'b0100,
    DIV = 4'b1000
  } OPERATION_ENUM_T;

  // to see operations in waveform
  OPERATION_ENUM_T op_cmd;
  always_comb op_cmd = OPERATION_ENUM_T'(op);

  always_comb begin : alu
    // Default assignments to avoid latches
    out   = '0;
    error = 0;
    zero  = 0;
    
    // valid data
    if(!invalid_data) begin
      case(op)
        ADD: out = in1 + in2;
        SUB: out = in1 - in2;
        MUL: out = in1 * in2;
        DIV: begin
          if(in2 == 0) begin
            out   = -1;
            error = 1;
          end else begin
            out   = in1 / in2;
          end
        end

        // load/store
        default: begin
          out   = -1; // zero = 0
          error = 0;
        end
      endcase
    end else begin
      // invalid data
      out   = -1;
      error = 1;
    end

    // check if zero
    zero = (out == 0) ? 1 : 0;
  end

endmodule