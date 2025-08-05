`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 11:39:28
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(
input clk,
input Reset,
output MemWrite,
output [31:0] WriteData,        //RD2
output [31:0] DataAddress,      //ALU Result
output [31:0] Final_Result
    );
   
wire [31:0] PC;
wire [31:0] Instr;
wire [31:0] ReadData;

CPU cpu(Reset, clk, PC, Instr, DataAddress, MemWrite, WriteData, ReadData, Final_Result);

Instruction_Memory InstrMem(PC, Instr);

Data_Memory DataMem(DataAddress, WriteData, ReadData, MemWrite, clk);

endmodule
