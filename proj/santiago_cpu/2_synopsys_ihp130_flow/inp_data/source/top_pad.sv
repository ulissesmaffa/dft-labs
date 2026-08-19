module top_santiago_cpu_pad (
    input               clk,
    input               rst,
    input  [6:0]        cmdin,
    input  [7:0]        din_1,
    input  [7:0]        din_2,
    input  [7:0]        din_3,
    output [7:0]        dout_low,
    output [7:0]        dout_high,
    output              zero,
    output              error,
    output              cpu_rdy
);
    //------------------------------------------------------------
    // Internal signals (core side of the pads)
    //------------------------------------------------------------
    wire        clk_pad;
    wire        rst_pad;
    wire [6:0]  cmdin_pad;
    wire [7:0]  din_1_pad;
    wire [7:0]  din_2_pad;
    wire [7:0]  din_3_pad;
    wire [7:0]  dout_low_pad;
    wire [7:0]  dout_high_pad;
    wire        zero_pad;
    wire        error_pad;
    wire        cpu_rdy_pad;

    //------------------------------------------------------------
    // Power Pads (4 conjuntos)
    //   vddcore/gndcore -> core supply | vddpad/gndpad -> IO supply
    //   IHP nao possui celula de corner instanciada no RTL.
    //------------------------------------------------------------
    vddcore VDD_0();   gndcore VSS_0();   
    vddpad IOVDD_0();   gndpad IOVSS_0();
    
    //vddcore VDD_1();   gndcore VSS_1();   
    vddpad IOVDD_1();   gndpad IOVSS_1();
    
    vddcore VDD_2();   gndcore VSS_2();   
    vddpad IOVDD_2();   gndpad IOVSS_2();
    
    //vddcore VDD_3();   gndcore VSS_3();   
    vddpad IOVDD_3();   gndpad IOVSS_3();

    //------------------------------------------------------------
    // Input Pads  -  ixc013_i16x (DOUT, PAD)
    //   PAD = pino fisico (entrada) | DOUT = vai para o core
    //------------------------------------------------------------
    ixc013_i16x PAD_CLK (.PAD(clk), .DOUT(clk_pad));
    ixc013_i16x PAD_RST (.PAD(rst), .DOUT(rst_pad));

    ixc013_i16x PAD_CMDIN_0 (.PAD(cmdin[0]), .DOUT(cmdin_pad[0]));
    ixc013_i16x PAD_CMDIN_1 (.PAD(cmdin[1]), .DOUT(cmdin_pad[1]));
    ixc013_i16x PAD_CMDIN_2 (.PAD(cmdin[2]), .DOUT(cmdin_pad[2]));
    ixc013_i16x PAD_CMDIN_3 (.PAD(cmdin[3]), .DOUT(cmdin_pad[3]));
    ixc013_i16x PAD_CMDIN_4 (.PAD(cmdin[4]), .DOUT(cmdin_pad[4]));
    ixc013_i16x PAD_CMDIN_5 (.PAD(cmdin[5]), .DOUT(cmdin_pad[5]));
    ixc013_i16x PAD_CMDIN_6 (.PAD(cmdin[6]), .DOUT(cmdin_pad[6]));

    ixc013_i16x PAD_DIN1_0 (.PAD(din_1[0]), .DOUT(din_1_pad[0]));
    ixc013_i16x PAD_DIN1_1 (.PAD(din_1[1]), .DOUT(din_1_pad[1]));
    ixc013_i16x PAD_DIN1_2 (.PAD(din_1[2]), .DOUT(din_1_pad[2]));
    ixc013_i16x PAD_DIN1_3 (.PAD(din_1[3]), .DOUT(din_1_pad[3]));
    ixc013_i16x PAD_DIN1_4 (.PAD(din_1[4]), .DOUT(din_1_pad[4]));
    ixc013_i16x PAD_DIN1_5 (.PAD(din_1[5]), .DOUT(din_1_pad[5]));
    ixc013_i16x PAD_DIN1_6 (.PAD(din_1[6]), .DOUT(din_1_pad[6]));
    ixc013_i16x PAD_DIN1_7 (.PAD(din_1[7]), .DOUT(din_1_pad[7]));

    ixc013_i16x PAD_DIN2_0 (.PAD(din_2[0]), .DOUT(din_2_pad[0]));
    ixc013_i16x PAD_DIN2_1 (.PAD(din_2[1]), .DOUT(din_2_pad[1]));
    ixc013_i16x PAD_DIN2_2 (.PAD(din_2[2]), .DOUT(din_2_pad[2]));
    ixc013_i16x PAD_DIN2_3 (.PAD(din_2[3]), .DOUT(din_2_pad[3]));
    ixc013_i16x PAD_DIN2_4 (.PAD(din_2[4]), .DOUT(din_2_pad[4]));
    ixc013_i16x PAD_DIN2_5 (.PAD(din_2[5]), .DOUT(din_2_pad[5]));
    ixc013_i16x PAD_DIN2_6 (.PAD(din_2[6]), .DOUT(din_2_pad[6]));
    ixc013_i16x PAD_DIN2_7 (.PAD(din_2[7]), .DOUT(din_2_pad[7]));

    ixc013_i16x PAD_DIN3_0 (.PAD(din_3[0]), .DOUT(din_3_pad[0]));
    ixc013_i16x PAD_DIN3_1 (.PAD(din_3[1]), .DOUT(din_3_pad[1]));
    ixc013_i16x PAD_DIN3_2 (.PAD(din_3[2]), .DOUT(din_3_pad[2]));
    ixc013_i16x PAD_DIN3_3 (.PAD(din_3[3]), .DOUT(din_3_pad[3]));
    ixc013_i16x PAD_DIN3_4 (.PAD(din_3[4]), .DOUT(din_3_pad[4]));
    ixc013_i16x PAD_DIN3_5 (.PAD(din_3[5]), .DOUT(din_3_pad[5]));
    ixc013_i16x PAD_DIN3_6 (.PAD(din_3[6]), .DOUT(din_3_pad[6]));
    ixc013_i16x PAD_DIN3_7 (.PAD(din_3[7]), .DOUT(din_3_pad[7]));

    //------------------------------------------------------------
    // Output Pads  -  ixc013_b16m (DOUT, DIN, OEN, PAD) em modo saida
    //   DIN  = dado do core -> PAD | OEN = output enable ATIVO-BAIXO
    //   Saida sempre habilitada: OEN = 1'b0 | DOUT (entrada) nao usado
    //------------------------------------------------------------
    ixc013_b16m PAD_DOUT_LOW_0 (.DIN(dout_low_pad[0]), .OEN(1'b0), .PAD(dout_low[0]), .DOUT());
    ixc013_b16m PAD_DOUT_LOW_1 (.DIN(dout_low_pad[1]), .OEN(1'b0), .PAD(dout_low[1]), .DOUT());
    ixc013_b16m PAD_DOUT_LOW_2 (.DIN(dout_low_pad[2]), .OEN(1'b0), .PAD(dout_low[2]), .DOUT());
    ixc013_b16m PAD_DOUT_LOW_3 (.DIN(dout_low_pad[3]), .OEN(1'b0), .PAD(dout_low[3]), .DOUT());
    ixc013_b16m PAD_DOUT_LOW_4 (.DIN(dout_low_pad[4]), .OEN(1'b0), .PAD(dout_low[4]), .DOUT());
    ixc013_b16m PAD_DOUT_LOW_5 (.DIN(dout_low_pad[5]), .OEN(1'b0), .PAD(dout_low[5]), .DOUT());
    ixc013_b16m PAD_DOUT_LOW_6 (.DIN(dout_low_pad[6]), .OEN(1'b0), .PAD(dout_low[6]), .DOUT());
    ixc013_b16m PAD_DOUT_LOW_7 (.DIN(dout_low_pad[7]), .OEN(1'b0), .PAD(dout_low[7]), .DOUT());

    ixc013_b16m PAD_DOUT_HIGH_0 (.DIN(dout_high_pad[0]), .OEN(1'b0), .PAD(dout_high[0]), .DOUT());
    ixc013_b16m PAD_DOUT_HIGH_1 (.DIN(dout_high_pad[1]), .OEN(1'b0), .PAD(dout_high[1]), .DOUT());
    ixc013_b16m PAD_DOUT_HIGH_2 (.DIN(dout_high_pad[2]), .OEN(1'b0), .PAD(dout_high[2]), .DOUT());
    ixc013_b16m PAD_DOUT_HIGH_3 (.DIN(dout_high_pad[3]), .OEN(1'b0), .PAD(dout_high[3]), .DOUT());
    ixc013_b16m PAD_DOUT_HIGH_4 (.DIN(dout_high_pad[4]), .OEN(1'b0), .PAD(dout_high[4]), .DOUT());
    ixc013_b16m PAD_DOUT_HIGH_5 (.DIN(dout_high_pad[5]), .OEN(1'b0), .PAD(dout_high[5]), .DOUT());
    ixc013_b16m PAD_DOUT_HIGH_6 (.DIN(dout_high_pad[6]), .OEN(1'b0), .PAD(dout_high[6]), .DOUT());
    ixc013_b16m PAD_DOUT_HIGH_7 (.DIN(dout_high_pad[7]), .OEN(1'b0), .PAD(dout_high[7]), .DOUT());

    ixc013_b16m PAD_ZERO    (.DIN(zero_pad),    .OEN(1'b0), .PAD(zero),    .DOUT());
    ixc013_b16m PAD_ERROR   (.DIN(error_pad),   .OEN(1'b0), .PAD(error),   .DOUT());
    ixc013_b16m PAD_CPU_RDY (.DIN(cpu_rdy_pad), .OEN(1'b0), .PAD(cpu_rdy), .DOUT());

    //------------------------------------------------------------
    // Core (ultimo)
    //------------------------------------------------------------
    top_santiago_cpu u_core (
        .clk       (clk_pad),
        .rst       (rst_pad),
        .cmdin     (cmdin_pad),
        .din_1     (din_1_pad),
        .din_2     (din_2_pad),
        .din_3     (din_3_pad),
        .dout_low  (dout_low_pad),
        .dout_high (dout_high_pad),
        .zero      (zero_pad),
        .error     (error_pad),
        .cpu_rdy   (cpu_rdy_pad)
    );
endmodule
