module Stack(input clk, input pop, push, input[11:0] address_in, output[11:0] address_out);
  
  logic[11:0] stack [7:0];
  logic[2:0] pointer = 3'b0;
  logic[11:0] data;

  
  
  always@(posedge clk)begin
    if(push)begin
      pointer <= pointer + 1;
      stack[pointer] <= address_in;
    end
    if(pop)begin
      assign data = stack[pointer];
      pointer <= pointer - 1;
    end
  end
  
  assign address_out = pop?data:12'b0;

  
endmodule

