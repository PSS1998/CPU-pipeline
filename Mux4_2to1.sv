module Mux4_2to1(input[3:0] A, input select, output[3:0] q);
  
  assign q = select?4'b0:A;
  
endmodule
