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
    // Internal signals
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
    // Corner cells
    //------------------------------------------------------------
    CORNER CORNER0();
    CORNER CORNER1();
    CORNER CORNER2();
    CORNER CORNER3();

    //------------------------------------------------------------
    // Power Pads (4 conjuntos)
    //------------------------------------------------------------
    VDD_NS    VDD_0();
    VSS_NS    VSS_0();
    IOVDD_NS  IOVDD_0();
    IOVSS_NS  IOVSS_0();

    VDD_NS    VDD_1();
    VSS_NS    VSS_1();
    IOVDD_NS  IOVDD_1();
    IOVSS_NS  IOVSS_1();

    VDD_NS    VDD_2();
    VSS_NS    VSS_2();
    IOVDD_NS  IOVDD_2();
    IOVSS_NS  IOVSS_2();

    VDD_NS    VDD_3();
    VSS_NS    VSS_3();
    IOVDD_NS  IOVDD_3();
    IOVSS_NS  IOVSS_3();

    //------------------------------------------------------------
    // Input Pads
    //------------------------------------------------------------
    I1025_NS  PAD_CLK (.PADIO(clk), .R_EN(1'b1), .DOUT(clk_pad));
    I1025_NS  PAD_RST (.PADIO(rst), .R_EN(1'b1), .DOUT(rst_pad));

    genvar i;
    generate
        for(i=0;i<7;i=i+1) begin : GEN_CMDIN
            I1025_NS  PAD_CMDIN (.PADIO(cmdin[i]), .R_EN(1'b1), .DOUT(cmdin_pad[i]));
        end
        for(i=0;i<8;i=i+1) begin : GEN_DIN1
            I1025_NS  PAD_DIN1 (.PADIO(din_1[i]), .R_EN(1'b1), .DOUT(din_1_pad[i]));
        end
        for(i=0;i<8;i=i+1) begin : GEN_DIN2
            I1025_NS  PAD_DIN2 (.PADIO(din_2[i]), .R_EN(1'b1), .DOUT(din_2_pad[i]));
        end
        for(i=0;i<8;i=i+1) begin : GEN_DIN3
            I1025_NS  PAD_DIN3 (.PADIO(din_3[i]), .R_EN(1'b1), .DOUT(din_3_pad[i]));
        end
    endgenerate

    //------------------------------------------------------------
    // Output Pads
    //------------------------------------------------------------
    generate
        for(i=0;i<8;i=i+1) begin : GEN_DOUT_LOW
            D4I1025_NS  PAD_DOUT_LOW (.DIN(dout_low_pad[i]), .EN(1'b1), .PADIO(dout_low[i]));
        end
        for(i=0;i<8;i=i+1) begin : GEN_DOUT_HIGH
            D4I1025_NS  PAD_DOUT_HIGH (.DIN(dout_high_pad[i]), .EN(1'b1), .PADIO(dout_high[i]));
        end
    endgenerate

    D4I1025_NS  PAD_ZERO    (.DIN(zero_pad),    .EN(1'b1), .PADIO(zero));
    D4I1025_NS  PAD_ERROR   (.DIN(error_pad),   .EN(1'b1), .PADIO(error));
    D4I1025_NS  PAD_CPU_RDY (.DIN(cpu_rdy_pad), .EN(1'b1), .PADIO(cpu_rdy));

    //------------------------------------------------------------
    // Core (último)
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
