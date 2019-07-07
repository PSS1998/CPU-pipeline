module Z_FF(input reset, clk, in,input change_zero, output out);
  
  logic FF;
  
  always@(posedge clk)begin
    if(reset)
      FF <= 1'b0;
    else
      if(change_zero)
        FF <= in;
  end
  assign out = FF;
  
endmodule








