`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 16:29:02
// Design Name: Top_Module
// Module Name: Instruction_Memory
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


module Instruction_Memory(
input [31:0]PC,
output [31:0] Instr 
    );
    
reg [31:0] instr_mem[31:0];

initial begin
    $readmemh ("riscvtext.mem", instr_mem);
end
assign Instr = instr_mem[PC[31:2]];

endmodule
