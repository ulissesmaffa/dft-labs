module control (
  input clk,
  input rst,
  input [6:0] cmd_in,
  input p_error,
  output logic aluin_reg_en,
  output logic datain_reg_en,
  output logic memoryWrite, memoryRead, selmux2,
  output logic cpu_rdy,
  output logic aluout_reg_en,
  output logic nvalid_data,
  output logic[1:0] in_select_a,
  output logic[1:0] in_select_b,
  output logic[3:0] opcode
);

  typedef enum logic [3:0] {
    RESET   = 4'b0001,
    FETDE   = 4'b0010,
    EXEC    = 4'b0100,
    STORE_S = 4'b1000
  } CTRL_STATE_ENUM_T;

  typedef enum logic [2:0] {
    ADD = 0,
    SUB,
    MUL,
    DIV,
    LOAD,
    STORE,
    NOP
  } ISA_ENUM_T;

  ISA_ENUM_T operation;
  always_comb operation = ISA_ENUM_T'(cmd_in[2:0]);

  CTRL_STATE_ENUM_T state, nx_state;

  // this block does not depend on input
  always_comb begin : NX_STATE_COMB
    nx_state = RESET;

    case(state)
      RESET  : nx_state = FETDE;
      FETDE  : nx_state = EXEC;
      EXEC   : nx_state = STORE_S;
      STORE_S: nx_state = FETDE;
    endcase
  end

  // register flop
  always_ff @(posedge clk or posedge rst) begin : STATE_FF
    if(rst) begin
      state <= RESET;
    end else begin
      state <= nx_state;
    end
  end

  // output logic
  always_comb begin : NX_STATE
    // default
    aluin_reg_en  = 0;
    datain_reg_en = 0;
    memoryWrite   = 0;
    memoryRead    = 0;
    selmux2       = 0;
    cpu_rdy       = 0;
    aluout_reg_en = 0;
    nvalid_data   = 0;
    in_select_a   = 0;
    in_select_b   = 0;
    opcode        = 0;
    
    case(state)
      // reset state just get cmdin
      RESET: datain_reg_en = 1;

      // set muxes and enable input registration
      FETDE: begin
        in_select_a  = cmd_in[6:5];
        in_select_b  = cmd_in[4:3];
        aluin_reg_en = 1;
      end

      // exection
      EXEC: begin
        // rule of invalid data: data is from the last data and previous result has error
        if((cmd_in[6:5] == 3'b11 || cmd_in[4:3] == 3'b11) && p_error == 1) begin
          nvalid_data = 1;
        end

        if(!nvalid_data) begin
          // default is reg alu output
          aluout_reg_en = 1;

          case(cmd_in[2:0])
            // alu operation set, otherwise opcode is 0
            ADD: opcode = 4'b0001;
            SUB: opcode = 4'b0010;
            MUL: opcode = 4'b0100;
            DIV: opcode = 4'b1000;

            // load
            LOAD: begin
              memoryRead = 1;
              selmux2    = 1;
            end

            STORE: begin
              // keep the last result registered
              aluout_reg_en = 0;
            end

            // NOP
            default: begin
              // keep the last result registered
              aluout_reg_en = 0;
            end
          endcase
        end else begin
          aluout_reg_en = 1;
        end
      end

      // if store, then 
      // 1) the user puts the address in REG(A)
      // 2) the aluout_reg_en is not 0, then data_in receives the last operation
      STORE_S: begin
        datain_reg_en = 1;
        cpu_rdy       = 1;

        // rule of invalid data: data is from the last data and previous result has error
        if((cmd_in[6:5] == 3'b11 || cmd_in[4:3] == 3'b11) && p_error == 1) begin
          nvalid_data = 1;
        end

        if(cmd_in[2:0] == STORE && !nvalid_data)
          memoryWrite = 1;
      end
    endcase
  end
endmodule