`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 16:39:35
// Design Name: CPU
// Module Name: Datapath
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


module Datapath(
input Reset,
input clk,
input [31:0] Instr,
input PCSrc, [1:0]ResultSrc, ALUSrc, [1:0]ImmSrc, RegWrite, [2:0]ALUControl,
output [31:0] PC,
output [31:0] WriteData,
input [31:0] ReadData,
output zero_flag,
output [31:0]ALUResult,
output [31:0] Final_Result
    );

//PC Register Logic
wire [31:0] PCNext;
wire [31:0] PCPlus4;
wire [31:0] ImmExt;
wire [31:0] PCTarget;

PC_Register Reg(PCNext, PC, clk, Reset);            
Adder Add4(PC, 32'd4, PCPlus4);
Adder Jump(PC, ImmExt, PCTarget);
Mux2 PCmux(PCPlus4, PCTarget, PCSrc, PCNext);

//ALU Logic
wire [31:0] SrcA; 
wire [31:0] SrcB;
wire [31:0] ImmExt;

Sign_extention ExtUnit(Instr[31:7], ImmSrc, ImmExt);
Mux2 ALUmux(WriteData, ImmExt, ALUSrc, SrcB);
ALU AluUnit(ALUControl, SrcA, SrcB, ALUResult, zero_flag);

//Register File Logic

Register_File regfile(clk, Instr[19:15], Instr[24:20], RegWrite, Instr[11:7], Final_Result, SrcA, WriteData);
//WD3 = Result
Mux2_ResultSrc ResultMux(ALUResult, ReadData, PCPlus4, ResultSrc, Final_Result);                                   

endmodule
