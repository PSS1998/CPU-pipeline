module Controller(input clk , input zero, carry, input const_sign, input[4:0] inst, output logic sel_stack , output logic [1:0] PCsrc, push, pop, RegDt, output logic [1:0] ALUsrc2, output logic [2:0] ALUop, output logic shift, MemRead, MemWrite, MemtoReg, RegWrite, output logic change_zero_carry);
/*  logic[2:0] aluop;
  logic[1:0] seljump,sel_const;
  logic sel_stack,_pop,_push,Reg_ds,Register_write,sel_mem_Reg,change_zero_carry,mem_read,mem_write,_shift;
  
*/   
  initial begin
	 sel_stack = 1'b0;
	 PCsrc = 2'b0;
	 pop=1'b0;
	 push=1'b0;
	 RegDt=1'b0;
	 RegWrite=1'b0;
	 MemtoReg=1'b0;
	 change_zero_carry=1'b0;
	 MemRead=1'b0;
	 MemWrite=1'b0;
	 PCsrc=2'b0;
	 ALUsrc2=2'b0;
	 ALUop=inst[2:0];
	 shift=1'b0;
  end
 
  always@(*)begin
    if(inst[4:3]==2'b0)begin//1
        sel_stack=1'b0;
        pop=1'b0;
        push=1'b0;
        RegDt=1'b0;
        RegWrite=1'b1;
        MemtoReg=1'b1;
        change_zero_carry=1'b1;
        MemRead=1'b0;
        MemWrite=1'b0;
        PCsrc=2'b0;
        ALUsrc2=2'b0;
        ALUop=inst[2:0];
        shift=1'b0;
    end
    
    if(inst[4:3]==2'b01)begin//2 Immediate
        sel_stack=1'b0;
        pop=1'b0;
        push=1'b0;
        RegDt=1'b0;
        RegWrite=1'b1;
        MemtoReg=1'b1;
        change_zero_carry=1'b1;
        MemRead=1'b0;
        MemWrite=1'b0;
        PCsrc=2'b0;
        ALUsrc2=2'b01;
        ALUop<=inst[2:0];//taghir az 0
        shift=1'b0;
    end
    
    if(inst[4:2]==3'b110)begin// 3 shift
        sel_stack=1'b0;
        pop=1'b0;
        push=1'b0;
        RegDt=1'b0;
        RegWrite=1'b1;
        MemtoReg=1'b1;
        change_zero_carry=1'b1;
        MemRead=1'b0;
        MemWrite=1'b0;
        PCsrc=2'b0;
        ALUsrc2=2'b10;
        ALUop<=inst[2:0];
        shift=1'b1;
    end
    
    if(inst[4:2]==3'b100)begin//4 memory
        sel_stack=1'b0;
        pop=1'b0;
        push=1'b0;
        RegDt=1'b1;
        change_zero_carry=1'b0;
        PCsrc=2'b0;
        shift=1'b0;
        
//        if(const_sign==1'b0)begin
        ALUop<=3'b000;
        ALUsrc2=2'b01;
//        end
//        if(const_sign==1'b1)begin
//        ALUop<=3'b010;
//        ALUsrc2=2'b11;
//        end
          
        if(inst[0]==1'b0)begin
          RegWrite=1'b1;
          MemRead=1'b1;
          MemWrite=1'b0;
          MemtoReg=1'b0;
        end
          
        if(inst[0]==1'b1)begin
          RegWrite=1'b0;
          MemRead=1'b0;
          MemWrite=1'b1;
          MemtoReg=1'b1;
          end
        
    end
    
    if(inst[4:2]==3'b101)begin//conditional jump
        sel_stack=1'b0;
        pop=1'b0;
        push=1'b0;
        shift=1'b0;
        change_zero_carry=1'b0;
        MemRead=1'b0;
        MemWrite=1'b0;
        RegDt=1'b0;
        RegWrite=1'b0;
        MemtoReg=1'b1;
        ALUsrc2=2'b0;
        ALUop<=3'b000;//alu should do nothing?
        if(inst[1:0]==2'b00)
          PCsrc=(zero)?2'b01:2'b0;
        
        if(inst[1:0]==2'b01)
          PCsrc=(zero)?2'b0:2'b01;
          
        if(inst[1:0]==2'b10)
          PCsrc=(carry)?2'b01:2'b0;
        
        if(inst[1:0]==2'b11)
          PCsrc=(carry)?2'b0:2'b01 ;  
    end
    
    if(inst[4:1]==4'b1110)begin//jumps
        sel_stack=1'b0;
        pop=1'b0;
        RegDt=1'b0;
        MemtoReg=1'b1;
        change_zero_carry=1'b0;
        MemRead=1'b0;
        MemWrite=1'b0;
        ALUsrc2=2'b0;
        ALUop<=inst[2:0];
        shift=1'b0;
        RegWrite=1'b0;
        PCsrc=2'b10;
        if(inst[0]==1'b0)
          push=1'b0;      
        if(inst[0]==1'b1)
          push=1'b1;
    end
    
    if(inst[4:1]==4'b1111)begin//ret
        sel_stack=1'b1;
        pop=1'b1;
        push=1'b0;
        RegDt=1'b0;
        RegWrite=1'b0;
        MemtoReg=1'b1;
        change_zero_carry=1'b0;
        MemRead=1'b0;
        MemWrite=1'b0;
        PCsrc=2'b0;
        ALUsrc2=2'b0;
        ALUop<=inst[2:0];//
        shift=1'b0;
    end
    
  end
  
/*    assign selstack = sel_stack;
    assign RegDs=Reg_ds;
    assign RegisterWrite=Register_write;
    assign push=_push;
    assign pop=_pop;
    assign readMemory=mem_read;
    assign writeMemory=mem_write;
    assign selmemToReg=sel_mem_Reg;
    assign change_Z_C=change_zero_carry;
    assign selconst=sel_const;
    assign selJOrNext=seljump;
    assign AluOperation=aluop;
    assign shift=_shift;
*/

endmodule



