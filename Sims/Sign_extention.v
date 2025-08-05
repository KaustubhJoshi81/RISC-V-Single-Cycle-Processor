`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 23:48:00
// Design Name: Datpath
// Module Name: Sign_Extention
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module is used for extending the 11,12,21 bit immediates encoded in the instruction 
//              into signed 32 bit immediates. Control signals determine how to sign extend the encoded immediates.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Sign_extention(
input      [31:7]  Instr,
input      [1:0]   ImmSrc,
output reg [31:0]  ImmExt
);

always @(*)
begin
    case(ImmSrc)
    2'b00: ImmExt <= {{20{Instr[31]}}, Instr[31:20]};                                   //I-type instrcution
    2'b01: ImmExt <= {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};                      //S-type instruction
    2'b10: ImmExt <= {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0};      //B-type instruction
    2'b11: ImmExt <= {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0};    //J-type Instruction
    default: ImmExt = 32'bx;
	 endcase
end
endmodule