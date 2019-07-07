module Register_file(input clk, input[2:0] ReadReg1, ReadReg2, WriteReg, input[7:0] WriteData, input write, output logic [7:0] Read1, Read2);
   
  logic[7:0] Registers [7:0];

   
  reg[7:0] data1;
  reg[7:0] data2;
  
  initial  begin
		Registers[0] = 8'b0;
		Registers[1] = 8'b0;
		Registers[2] = 8'b0;
		Registers[3] = 8'b0;
		Registers[4] = 8'b0;
		Registers[5] = 8'b0;
		Registers[6] = 8'b0;
		Registers[7] = 8'b0;
	end
  
  always@(posedge clk)begin
    Registers[0] <= 8'b0;
    if(write)
      Registers[WriteReg] <= WriteData;
	end
  
  assign Read1 = write?((ReadReg1==WriteReg)?WriteData:Registers[ReadReg1]):Registers[ReadReg1];
  assign Read2 = write?((ReadReg2==WriteReg)?WriteData:Registers[ReadReg2]):Registers[ReadReg2];
   
   
endmodule
