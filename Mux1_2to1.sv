module Mux1_2to1(input A, B, input select, output q);
  
  assign q = select?B:A;
  
endmodule




