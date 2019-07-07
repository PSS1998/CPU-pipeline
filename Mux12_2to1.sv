module Mux12_2to1(input[11:0] A, B, input select, output[11:0] q);
  
  assign q = select?B:A;
  
endmodule

