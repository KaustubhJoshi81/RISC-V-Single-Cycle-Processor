`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 23:48:00
// Design Name: Datapath
// Module Name: Mux2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This multiplexer will be used for 2 cases. 
//              1] Selecting signals between output of Sign_Extention & RD2 of Register File. The final output is
//                 SrcB which is then passed onto the ALU.
//              2] Selecting signals between PC4 & PCTarget. The final output is PCNext which is passed onto \
//                 PCRegister.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux2(
input [31:0] a,
input [31:0] b,
input Src,
output [31:0] y
);

assign y = Src ? b:a;

endmodule
