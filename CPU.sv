module CPU(input reset, clk);
  
  logic sel_stack, push, pop, RegDt, shift, MemRead, MemWrite, MemtoReg, RegWrite, change_zero_carry, zero, carry, const_sign, WB_RegWrite, MEM_RegWrite, EX_MemRead, ldPC, ld_IF_ID, ID_EX_flush, sel_carry_forwarding, sel_zero_forwarding, carry_forwarding, zero_forwarding, EX_change_C_Z, zero_out, carry_out;
  logic [1:0] PCsrc, ALUsrc2, ForwardA, ForwardB;
  logic [2:0] EX_RegRd, EX_RegRt, ID_RegRs, ID_RegRt, MEM_RegRd, WB_RegRd, EX_RegRs;
  logic [2:0] ALUop, inst3;
  logic [4:0] inst;
  logic [5:0] inst2;
  
  Datapath DP (reset, clk, sel_stack , PCsrc, push, pop, RegDt, ALUsrc2, ALUop, shift, MemRead, MemWrite, MemtoReg, RegWrite, change_zero_carry, zero, carry, const_sign, inst, WB_RegWrite, MEM_RegWrite, MEM_RegRd, WB_RegRd, EX_RegRs, EX_RegRt, ForwardA, ForwardB, EX_MemRead, EX_RegRd, ID_RegRs, ID_RegRt, inst2, ldPC, ld_IF_ID, ID_EX_flush, sel_carry_forwarding, sel_zero_forwarding, carry_forwarding, zero_forwarding, inst3, EX_change_C_Z, zero_out, carry_out);
  Controller CU (clk , zero, carry, const_sign, inst, sel_stack , PCsrc, push, pop, RegDt, ALUsrc2, ALUop, shift, MemRead, MemWrite, MemtoReg, RegWrite, change_zero_carry);
  Forwarding_unit FU (clk, WB_RegWrite, MEM_RegWrite, MEM_RegRd, WB_RegRd, EX_RegRs, EX_RegRt, ForwardA, ForwardB, ID_EX_flush);
  Hazard_detection_unit HU (clk, EX_MemRead, EX_RegRd, EX_RegRt, ID_RegRs, ID_RegRt, carry, zero, inst2, ldPC, ld_IF_ID, ID_EX_flush);
  carry_zero_forwarding C_Z_FU (EX_change_C_Z, carry_out, zero_out, inst3, sel_carry_forwarding, sel_zero_forwarding, carry_forwarding, zero_forwarding);

  
endmodule
