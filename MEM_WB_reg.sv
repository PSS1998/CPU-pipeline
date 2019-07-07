module MEM_WB_reg(input clk, input[1:0] control_signal, input[7:0] Read_data, input[7:0] ALU_result, input[2:0] register_num, output[1:0] WB_control_signal, output[7:0] WB_Read_data, output[7:0] WB_ALU_result, output[2:0] WB_register_num);
  
	logic[1:0] control_signal_FF;
	logic[7:0] Read_data_FF;
	logic[7:0] ALU_result_FF;
	logic[2:0] register_num_FF;
	
  
	initial  begin
		control_signal_FF = 4'b0;
		ALU_result_FF = 8'b0;
		Read_data_FF = 8'b0;
		register_num_FF = 3'b0;
	end
	

  always@(posedge clk)begin
		control_signal_FF <= control_signal;
	end
	assign WB_control_signal = control_signal_FF;
	
	always@(posedge clk)begin
		ALU_result_FF <= ALU_result;
	end
	assign WB_ALU_result = ALU_result_FF;
	
	always@(posedge clk)begin
		Read_data_FF <= Read_data;
	end
	assign WB_Read_data = Read_data_FF;
	
	always@(posedge clk)begin
		register_num_FF <= register_num;
	end
	assign WB_register_num = register_num_FF;
	

endmodule













