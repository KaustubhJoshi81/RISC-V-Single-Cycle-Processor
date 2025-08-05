`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 13:13:54
// Design Name: 
// Module Name: PC_Instr_Mem
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


module PC_Instr_Mem(
input [31:0]PCNext,
output [31:0] Instr,
input clk,
input Reset
    );

wire [31:0] PC;

PC_Register PC_reg(PCNext, PC, clk, Reset);
Instruction_Memory instr_mem(PC, Instr);

endmodule
