`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 19:16:03
// Design Name: 
// Module Name: Test_PC_Regster
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


module Test_PC_Regster();

logic [31:0] PCNext;
logic [31:0] PC;
logic clk;
logic Reset;

PC_Register DUT(PCNext, PC, clk, Reset);

always begin
clk = 0; #5;
clk = 1; #5;
end

initial begin

Reset = 0; 
#10;
Reset = 1; #10;
Reset = 0; #10;
PCNext = 32'b01010;
#10;
end

endmodule
