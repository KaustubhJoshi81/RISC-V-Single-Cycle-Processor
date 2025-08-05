`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 16:29:02
// Design Name: Top_Module
// Module Name: Data_Memory
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

module Data_Memory(
input [31:0]DataAddress,
input [31:0] Write,
output [31:0] Read,
input WE,
input clk
);

reg [31:0] mem[63:0];

always @(posedge clk)
begin
    if(WE)
        begin
            mem[DataAddress[31:2]] <= Write;
            //Read <= Write;
        end
end

assign Read = mem[DataAddress[31:2]];

endmodule