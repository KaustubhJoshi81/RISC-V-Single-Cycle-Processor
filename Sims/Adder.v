`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 16:45:51
// Design Name: Datapath
// Module Name: Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module is used to increment the Program Counter (PC). 
//              Here, a is PC and b is 4 and y is PCPlus4. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] result
    );

assign result = (a+b);
    
endmodule
