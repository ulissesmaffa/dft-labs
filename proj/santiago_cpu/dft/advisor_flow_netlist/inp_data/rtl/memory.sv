module memory (
  input  clk, memoryWrite, memoryRead,
  input  [15:0] memoryWriteData,
  //input  logic [7:0] memoryAddress,
  input  logic [2:0]     memoryAddress,  // 3 bits para 8 palavras
  output logic[15:0] memoryOutData
);

  logic[15:0] mem[8];

  always_ff @(posedge clk) begin : MEM_WRITE
    if(memoryWrite)
      mem[memoryAddress] <= memoryWriteData;
  end

  always_comb begin : MEM_READ
    if(memoryRead)
      memoryOutData = mem[memoryAddress];
    else
      memoryOutData = 0;
  end

endmodule
