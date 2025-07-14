`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2025 18:48:30
// Design Name: 
// Module Name: Test_Datapath
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


module Test_Datapath();

logic [31:0]PC;
logic clk;
logic Reset;
logic [31:0] Instr;
logic PCSrc; 
logic [1:0]ResultSrc; 
logic ALUSrc; 
logic [1:0]ImmSrc; 
logic RegWrite; 
logic [2:0]ALUControl; 
logic [31:0] WriteData; 
logic [31:0] ReadData; 
logic zero_flag;
logic [31:0] ALUResult;
logic [31:0] Final_Result;
logic [2:0] DataSrc;

Datapath DUT(.Reset(Reset), .clk(clk), .Instr(Instr), .PCSrc(PCSrc), .ResultSrc(ResultSrc), .ALUSrc(ALUSrc),
             .ImmSrc(ImmSrc), .RegWrite(RegWrite), .ALUControl(ALUControl), 
             .PC(PC), .WriteData(WriteData), .ReadData(ReadData), .zero_flag(zero_flag), 
             .ALUResult(ALUResult), .Final_Result(Final_Result), .DataSrc(DataSrc));

always begin
clk = 0;#5;
clk = 1;#5;
end

initial begin
#12;
Reset = 1; #10;
Reset = 0;
Instr = 32'h0471AA23; PCSrc = 1'b0; ResultSrc = 2'b01; ALUSrc = 1'b1; ImmSrc = 2'b01; RegWrite = 1'b0; ALUControl = 3'b000;  

//------------------------------PC Reset Passed-----------------------------------------------//
//------------------------------sw Instruction Passed---------------------------------------//


end

endmodule
