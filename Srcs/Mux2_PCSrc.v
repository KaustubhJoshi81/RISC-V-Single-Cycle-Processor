`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 00:31:48
// Design Name: 
// Module Name: Mux2_PCSrc
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


module Mux2_PCSrc(
input [15:0] a,
input [15:0] b,
input PCSrc,
output [15:0] y
    );

assign y = PCSrc ? b:a; 

endmodule
