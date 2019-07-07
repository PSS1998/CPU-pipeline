module reg1(input reset, clk, in, output out);
  
  logic FF;
  
  always@(posedge clk)begin
    if(reset)
      FF <= 1'b0;
    else
      FF <= in;
  end
  assign out = FF;
  
endmodule











