`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 02:40:31
// Design Name: 
// Module Name: Test_CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Test_CPU();

logic Reset;
logic clk;
logic [31:0] PC;
logic [31:0] Instr;
logic [31:0] ALUResult;        //Data Address for Data Memory
logic MemWrite;
logic [31:0] WriteData;
logic [31:0] ReadData;

logic [31:0] Final_Result;

CPU DUT(Reset, clk, PC, Instr, ALUResult, MemWrite, WriteData, ReadData, Final_Result);

always begin
clk = 0; #5;
clk = 1; #5;
end

initial begin
Reset = 1;
#10;
Reset = 0;
#5;

//Instr = 32'h00C00193; 
//#10;
//Instr = 32'b000000000111_00000_000_00111_0010011;
//#10;
//Instr = 32'h0471AA23;
//#10;

Instr = 32'h06000083; ReadData = 32'h01B1061A;
#5;
assert (Final_Result === 32'h01a) else $error ("error: lb");
//------------------------------------lb Instruction Passed-------------------------------------------//

#5;
Instr = 32'h06000403; ReadData = 32'hA1230207;      //lb instruction. load byte to r10
#10;
Instr = 32'h00750513;                               //Addi (add 7 to r10)
#5;
assert (Final_Result === 32'd14) else $error("error: lb + addi");

end

endmodule
