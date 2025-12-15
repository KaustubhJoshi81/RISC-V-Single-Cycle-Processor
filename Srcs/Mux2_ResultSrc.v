`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 00:41:16
// Design Name: Datapath
// Module Name: Mux2_ResultSrc
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


module Mux2_ResultSrc(
input [31:0]  ALUResult,
input [31:0]  ReadData,
input [31:0]  PCPlus4,
input [31:0]  PCTarget,
input [31:0]  ImmExt,
input [2:0]   ResultSrc,
output reg [31:0] y
    );

always @(*)
begin
    case (ResultSrc)
        3'b000: y <= ALUResult;
        3'b001: y <= ReadData;
        3'b010: y <= PCPlus4;
        3'b011: y <= PCTarget;
        3'b100: y <= ImmExt;
        default:y <= 32'bz;
    endcase
end
endmodule
