module carry_zero_forwarding(input change_carry_zero, carry, zero, input[2:0] inst, output logic sel_carry_forwarding, sel_zero_forwarding, carry_forwarding, zero_forwarding);
  
  always@(*) begin
    assign sel_carry_forwarding = 1'b0;
    assign sel_zero_forwarding = 1'b0; 
    if(change_carry_zero && carry)
      assign carry_forwarding = 1'b1;
    if(change_carry_zero && !carry)
      assign carry_forwarding = 1'b0;  
    if(change_carry_zero && zero)
      assign zero_forwarding = 1'b1;
    if(change_carry_zero && !zero)
      assign zero_forwarding = 1'b0;
    if(change_carry_zero && (inst==3'b101))begin
      assign sel_carry_forwarding = 1'b1;
      assign sel_zero_forwarding = 1'b1;
    end
  end
  
endmodule
