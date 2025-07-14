`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 03:29:33
// Design Name: CPU
// Module Name: Controller
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


module Controller(
input [2:0] funct3,
input zero_flag,
input funct7b5,
input [6:0] op,     
output PCSrc, [1:0]ResultSrc, MemWrite, ALUSrc, [1:0]ImmSrc, RegWrite, [2:0]ALUControl
    );
   
wire Branch;
wire Jump;
wire [1:0]ALUOp;

Main_Decoder main_dec(funct3, op,Branch,ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUOp, Jump);
ALU_Decoder alu_dec(funct3, funct7b5, op[5], ALUOp, ALUControl);

assign PCSrc = (zero_flag & Branch) | Jump;    
  
endmodule
