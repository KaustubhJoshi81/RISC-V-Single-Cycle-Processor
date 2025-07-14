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
input [1:0]   ResultSrc,
output reg [31:0] y
    );

always @(*)
begin
    case (ResultSrc)
        2'b00: y <= ALUResult;
        2'b01: y <= ReadData;
        2'b10: y <= PCPlus4;
        default:y <= 32'bx;
    endcase
end
endmodule
