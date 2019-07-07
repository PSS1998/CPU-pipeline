module Mux10_2to1(input[16:0] A, input select, output[16:0] q);
  
  assign q = select?17'b0:A;
  
endmodule


