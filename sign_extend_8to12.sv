module sign_extend_8to12( input[7:0] in, output[11:0] out);
  
  assign out = {4'b0,in};
  
endmodule
