module ALU(input clk, input[7:0] A, B, input carry_in, input shift, input[2:0] operation, output[7:0] result, output zero, output carry_out);
  
  reg[7:0] res;
  reg c;
  
  always@(A, B, carry_in, shift, operation)begin
    if(shift)
      case(operation)
        3'b000: assign {c,res} = A<<B;
        3'b001: assign {c,res} = A>>B;
        3'b010: begin
                  for(int i=0; i<B; i=i+1)begin
                    assign res = {A[6:0],A[7]};
                  end
                end
        3'b011: begin
                  for(int i=0; i<B; i=i+1)begin
                    assign res = {A[0],A[7:1]};
                  end
                end
      endcase
    else 
      case(operation)
        3'b000: assign {c,res} = A+B;
        3'b001: assign {c,res} = A+B+carry_in;
        3'b010: begin assign {c,res} = A-B; end
        3'b011: begin assign {c,res} = A-B-carry_in; end
        3'b100: assign res = A&B;
        3'b101: assign res = A|B;
        3'b110: assign res = A^B;
        3'b111: assign res = ~(A&B);
      endcase 
  end
  
  assign result = res;
  assign carry_out = c;
  assign zero = res?0:1;
  
endmodule




