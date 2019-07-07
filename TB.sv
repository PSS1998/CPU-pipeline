`timescale 1ns/1ns
module TB();
  
  logic clk=1,reset=1;
  
  CPU test (reset, clk);
  
  initial repeat (10000)#60 clk=~clk;
  initial begin #60 reset=0; end
  
endmodule


