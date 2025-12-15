`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 11:21:58
// Design Name: 
// Module Name: Test_Instruction_Memory
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


module Test_Instruction_Memory();

logic [31:0] PC;
logic [31:0] Instr;

Instruction_Memory DUT(PC, Instr);

initial begin
integer i;
    for (i=0; i<24; i++) begin
        PC = 4*i; 
        #5;
    end
end

endmodule
