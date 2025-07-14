`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 23:25:28
// Design Name: 
// Module Name: Test_Data_Memory
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


module Test_Data_Memory();
    
logic [31:0]Addr;
logic [31:0] Write;
logic [31:0] Read;
logic WE;
logic clk;

Data_Memory DUT(Addr, Write, Read, WE, clk);

always begin
clk = 1; #5;
clk = 0; #5;
end

initial begin
WE = 1; Addr = 32'b01; Write = 32'b1010;
#10;
WE = 0; Addr = 32'b01; 
#10;
WE = 1; Addr = 32'h60; Write = 32'b111;
#5; 
WE = 0;
Write = 32'b0; 
end

endmodule
