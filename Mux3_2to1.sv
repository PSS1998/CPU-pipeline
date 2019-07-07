module Mux3_2to1(input[2:0] A, B, input select, output[2:0] q);
  
  assign q = select?B:A;
  
endmodule


