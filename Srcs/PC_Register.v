`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 16:21:33
// Design Name: Datapath
// Module Name: PC_Register
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

module PC_Register(
input [31:0] PCNext,
output reg [31:0] PC,
input clk,
input Reset
    );

always @(posedge clk)
begin
    if(Reset)
        PC <= 32'b0;
        
    else
        PC <= PCNext;
       
end

endmodule
