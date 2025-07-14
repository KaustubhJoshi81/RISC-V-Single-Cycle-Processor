`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 16:39:35
// Design Name: Top_Module
// Module Name: CPU
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

module CPU(
input  Reset,
input  clk,
output [31:0] PC,
input  [31:0] Instr,
output [31:0] ALUResult,        //Data Address for Data Memory
output MemWrite,
output [31:0] WriteData,
input  [31:0] ReadData,
output [31:0] Final_Result
);

wire PCSrc;
wire [1:0]ResultSrc;
wire ALUSrc;
wire [1:0]ImmSrc;
wire RegWrite;
wire [2:0]ALUControl;
wire zero_flag;

Datapath data_path(Reset, clk, Instr, PCSrc, ResultSrc, ALUSrc, ImmSrc, RegWrite, ALUControl, PC, WriteData, ReadData, zero_flag, ALUResult, Final_Result);

Controller control(Instr[14:12], zero_flag, Instr[30], Instr[6:0], PCSrc, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUControl);

endmodule