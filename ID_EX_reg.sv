module ID_EX_reg(input clk, input[16:0] control_signal, input[7:0] read1, input[7:0] read2, input[7:0] const_EX, input[7:0] shift_count, input[2:0] inst10_8, input[2:0] inst7_5, input[2:0] inst13_11, output[16:0] EX_control_signal, output[7:0] EX_read1, output[7:0] EX_read2, output[7:0] EX_const_EX, output[7:0] EX_shift_count, output[2:0] EX_inst10_8, output[2:0] EX_inst7_5, output[2:0] EX_inst13_11);
  
	logic[16:0] control_signal_FF;
	logic[7:0] read1_FF;
	logic[7:0] read2_FF;
	logic[7:0] const_EX_FF;
	logic[7:0] shift_count_FF;
	logic[2:0] inst10_8_FF;
	logic[2:0] inst7_5_FF;
	logic[2:0] inst13_11_FF;
	
  
	initial  begin
		control_signal_FF = 17'b0;
		read1_FF = 8'b0;
		read2_FF = 8'b0;
		const_EX_FF = 8'b0;
		shift_count_FF = 8'b0;
		inst10_8_FF = 3'b0;
		inst7_5_FF = 3'b0;
		inst13_11_FF = 3'b0;
	end
	

  
  always@(posedge clk)begin
		control_signal_FF <= control_signal;
	end
	assign EX_control_signal = control_signal_FF;
	
	always@(posedge clk)begin
		read1_FF <= read1;
	end
	assign EX_read1 = read1_FF;
	
	always@(posedge clk)begin
		read2_FF <= read2;
	end
	assign EX_read2 = read2_FF;
	
	always@(posedge clk)begin
		const_EX_FF <= const_EX;
	end
	assign EX_const_EX = const_EX_FF;
	
	always@(posedge clk)begin
		shift_count_FF <= shift_count;
	end
	assign EX_shift_count = shift_count_FF;
	
	always@(posedge clk)begin
		inst10_8_FF <= inst10_8;
	end
	assign EX_inst10_8 = inst10_8_FF;
	
	always@(posedge clk)begin
		inst7_5_FF <= inst7_5;
	end
	assign EX_inst7_5 = inst7_5_FF;
	
	always@(posedge clk)begin
		inst13_11_FF <= inst13_11;
	end
	assign EX_inst13_11 = inst13_11_FF;
  
endmodule









