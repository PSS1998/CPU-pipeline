module Mux2_2to1(input[1:0] A, B, input select, output[1:0] q);
  
  assign q = select?B:A;
  
endmodule
