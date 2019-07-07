module Mux8_2to1(input[7:0] A, B, input select, output[7:0] q);
  
  assign q = select?B:A;
  
endmodule


