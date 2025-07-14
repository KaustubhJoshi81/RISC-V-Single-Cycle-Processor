`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 13:17:00
// Design Name: 
// Module Name: Test_PC_InstrMem
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


module Test_PC_InstrMem();

logic Reset;
logic clk;
logic [31:0]PCNext;
logic [31:0]Instr;

PC_Instr_Mem DUT(PCNext, Instr, clk, Reset);

always begin
clk = 0; #5;
clk = 1; #5;
end

initial begin
Reset = 0; #12;
Reset = 1; #10;
Reset = 0;
end

endmodule
