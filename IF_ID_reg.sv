module IF_ID_reg(input clk, input ld, input IF_Flush, input[18:0] data, input[11:0] PCplus, output[18:0] ID_inst, output[11:0] ID_PC);
  
	logic[11:0] PC_FF;
	logic[18:0] inst_FF;
  
	initial  begin
		PC_FF = 12'b0;
		inst_FF = 19'b0;
	end
	
	logic reset;
	assign reset = IF_Flush;
  
	always@(posedge clk)begin
		if(reset)
			PC_FF <= 12'b0;
		else
		  if(ld)
			 PC_FF <= PCplus;
			else
			 PC_FF <= PC_FF;
	end
	assign ID_PC = PC_FF;
	
	always@(posedge clk)begin
		if(reset)
			inst_FF <= 19'b0;
		else
		  if(ld)
			 inst_FF <= data;
			else
			 inst_FF <= inst_FF;
	end
	assign ID_inst = inst_FF;
  
endmodule







