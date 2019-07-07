module DataMemory(input clk, input[7:0] address, writeData, input read, write, output[7:0] readData);
  
  logic[7:0] RAM [255:0];
  
// test 2
/*	initial  begin
		RAM[100] = 1;
		RAM[101] = 3;
		RAM[102] = 10;
		RAM[103] = 5;
		RAM[104] = 4;
		RAM[105] = 0;
		RAM[106] = 11;
		RAM[107] = 15;
		RAM[108] = 28;
		RAM[109] = 1;
		RAM[110] = 9;
		RAM[111] = 50;
		RAM[112] = 69;
		RAM[113] = 17;
		RAM[114] = 10;
		RAM[115] = 21;
		RAM[116] = 101;
		RAM[117] = 2;
		RAM[118] = 4;
		RAM[119] = 0;
	end
*/
	initial  begin
		{RAM[101], RAM[100]} = 16'b1000101110010000;
		{RAM[103], RAM[102]} = 16'b0000101010000000;
	end


  reg[7:0] data;
  
  always@(posedge clk)begin
    if(write)
      RAM[address] <= writeData;
  end
  assign data = read?RAM[address]:data;

  assign readData = data;
  
endmodule

