module Mux7_2to1(input[6:0] A, input select, output[6:0] q);
  
  assign q = select?7'b0:A;
  
endmodule
