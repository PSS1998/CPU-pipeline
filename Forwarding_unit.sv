module Forwarding_unit(input clk, WB_RegWrite, input MEM_RegWrite, input [2:0] MEM_RegRd, WB_RegRd, EX_RegRs, EX_RegRt, output logic[1:0] ForwardA, output logic[1:0] ForwardB, input ID_EX_flush);
  
  logic a;
  logic b;
  logic c;
  logic d;
  logic e;
  logic f;
  assign a = (WB_RegWrite && (WB_RegRd !== 0) && !(MEM_RegWrite && (MEM_RegRd) && (MEM_RegRd !== EX_RegRt)) && (WB_RegRd === EX_RegRt));
  assign b = (WB_RegWrite && (WB_RegRd !== 0) && !(MEM_RegWrite && (MEM_RegRd) && (MEM_RegRd !== EX_RegRs)) && (WB_RegRd === EX_RegRs));
  assign c = (!ID_EX_flush &&  (MEM_RegWrite) && ((MEM_RegRd != 3'b0) && (MEM_RegRd == EX_RegRt)));
  assign d = (MEM_RegWrite && ((MEM_RegRd !== 0) && (MEM_RegRd === EX_RegRs)));
  assign e = (a||c)?1'b0:1'b1;
  assign f = (b||d)?1'b0:1'b1;
  
  always@(*) begin
    begin ForwardA = 2'b00; ForwardB = 2'b00; end
    
    if (a)begin
      assign ForwardA = 2'b01;
    end
    
    if (b)begin
      assign ForwardB = 2'b01;
    end
  
    if (c)begin
      assign ForwardA = 2'b10;
    end
      
    if (d)begin
      assign ForwardB = 2'b10;
    end
    
    if (e)begin
      assign ForwardA = 2'b00;
    end
    
    if (f)begin
      assign ForwardB = 2'b00;
    end
        
  end
  
endmodule
