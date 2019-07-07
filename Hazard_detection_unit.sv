module Hazard_detection_unit(input clk, EX_MemRead, input[2:0] EX_RegRd, EX_RegRt, ID_RegRs, ID_RegRt, input carry, input zero, input [5:0] inst, output ldPC, output ld_IF_ID, output ID_EX_flush);

 logic stall;
 logic br;
 logic IF_ID_stall;
 logic count;
 
 initial begin
   stall = 1'b0;
   br = 1'b0;
   IF_ID_stall = 1'b0;
   count = 1'b0;
 end

  always@(*) begin
    assign stall = 1'b0;
    assign br = 1'b0;
//    assign IF_ID_stall = 1'b0;
    
    if(EX_MemRead && ((EX_RegRd == ID_RegRs) || (EX_RegRd == ID_RegRt)))
      assign stall = 1'b1;
    if(inst == 6'b111100 || inst[5:2] == 4'b1110)begin
       assign stall = 1'b1;
       assign br = 1'b1;
       assign IF_ID_stall = 1'b1;
    end
    if(inst[5:3] == 3'b101) begin
      if(((inst[2:1] == 2'b00) &&  (zero)) || ((inst[2:1] == 2'b01) &&  (~zero)) || ((inst[2:1] == 2'b10) &&  (carry)) || ((inst[2:1] == 2'b11) &&  (~carry))) begin
        assign stall = 1'b1;
        assign br = 1'b1;
        if(count == 1'b0)
          assign IF_ID_stall = 1'b1;
      end
    end
    if(IF_ID_stall && count)begin
      assign IF_ID_stall = 1'b0;
      assign count = 1'b0;
    end
    if(count==1'b0 && IF_ID_stall)
      assign count = 1'b1;
  end  
  /*br?stall:~stall*/
  assign ldPC = br?stall:~stall;
  assign ld_IF_ID = br?~IF_ID_stall:~stall;
  assign ID_EX_flush = stall;

endmodule