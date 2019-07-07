module EX_MEM_reg(input clk, input[3:0] control_signal, input[7:0] ALU_result, input[7:0] read2, input[2:0] register_num, output[3:0] MEM_control_signal, output[7:0] MEM_ALU_result, output[7:0] MEM_read2, output[2:0] MEM_register_num);
  
	logic[3:0] control_signal_FF;
	logic[7:0] ALU_result_FF;
	logic[7:0] read2_FF;
	logic[2:0] register_num_FF;
	
  
	initial  begin
		control_signal_FF = 4'b0;
		ALU_result_FF = 8'b0;
		read2_FF = 8'b0;
		register_num_FF = 3'b0;
	end
	

  always@(posedge clk)begin
		control_signal_FF <= control_signal;
	end
	assign MEM_control_signal = control_signal_FF;
	
	always@(posedge clk)begin
		ALU_result_FF <= ALU_result;
	end
	assign MEM_ALU_result = ALU_result_FF;
	
	always@(posedge clk)begin
		read2_FF <= read2;
	end
	assign MEM_read2 = read2_FF;
	
	always@(posedge clk)begin
		register_num_FF <= register_num;
	end
	assign MEM_register_num = register_num_FF;
	

endmodule












