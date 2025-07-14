`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 00:36:50
// Design Name: Controller
// Module Name: Main_Decoder
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


module Main_Decoder(
input [2:0] funct3,
input [6:0] op,     
output Branch, [1:0]ResultSrc, MemWrite, ALUSrc, [1:0]ImmSrc, RegWrite, [1:0]ALUOp, Jump
    );

reg [13:0] controls;

always @(*)
begin
    case (op)               //  WE3_Imm_ALUSrc_WE_Result_B_ALUOp_J
    7'b0000011: controls <= 11'b1___00__1______0__01_____0_00____0;     //lw instruction
    7'b0010011: controls <= 11'b1___00__1______0__00_____0_00____0;     //addi
    7'b0100011: controls <= 11'b0___01__1______1__xx_____0_00____0;     // sw
    7'b0110011: controls <= 11'b1___xx__0______0__00_____0_10____0;     // R-type
    7'b1100011: controls <= 11'b0___10__0______0__xx_____1_01____0;     // beq
    7'b1101111: controls <= 11'b1___11__x______0__10_____0_xx____1;     // jal
    default: controls <= 11'bx; 
    endcase
end

assign RegWrite = controls[10];
assign ImmSrc = controls[9:8];
assign ALUSrc = controls[7];
assign MemWrite = controls[6];
assign ResultSrc = controls[5:4];
assign Branch = controls [3];
assign ALUOp = controls[2:1];
assign Jump = controls[0];

endmodule
