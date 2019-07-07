module Mux8_3to1(input[7:0] A, B, C, input[1:0] select, output[7:0] q);
  
  assign q = (select==2'b00)?A:((select==2'b01)?B:C);
  
endmodule









