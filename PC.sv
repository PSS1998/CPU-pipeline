module PC(input reset, input clk, input ldPC, input[11:0] in, output[11:0] out);
  
	logic[11:0] FF;
  
	initial  begin
		FF = 12'b0;
	end
  
	always@(posedge clk)begin
		if(reset)
			FF <= 12'b0;
		else
		  if(ldPC)
			 FF <= in;
			else
			  FF <= FF;
	end
	assign out = FF;
  
endmodule





