`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2025 19:42:51
// Design Name: 
// Module Name: Test_Controller
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


module Test_Controller();

logic [2:0] funct3;
logic zero_flag;
logic funct7b5;
logic [6:0] op;
logic PCSrc;
logic [1:0]ResultSrc;
logic MemWrite;
logic ALUSrc;
logic [1:0]ImmSrc;
logic RegWrite;
logic [2:0]ALUControl;
logic [2:0] DataSrc;

Controller DUT(funct3, zero_flag, funct7b5, op, PCSrc, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUControl, DataSrc);
logic [13:0] controls;

assign controls = {DataSrc, PCSrc, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUControl};

initial begin
funct3 = 3'b010; zero_flag = 1'b0; funct7b5 = 1'b1; op = 7'b0000011; #5;        //lw instruction
assert (controls === 14'b010_0___01__0______1__00_____1____000) else $error ("error: lw"); 

funct3 = 3'b000; zero_flag = 1'b0; funct7b5 = 1'b1; op = 7'b0000011; #5;        //lb instruction
assert (controls === 14'b000_0___01__0______1__00_____1____000) else $error ("error: lb"); 

funct3 = 3'b010; zero_flag = 1'b0; funct7b5 = 1'b0; op = 7'b0100011; #5;        //sw intruction
assert (controls === 14'bxxx_0_xx_1_1_01_0_000) else $error ("error: sw"); 

//funct3 = 3'b000; funct7b5 = 1'b0; op = 7'b0010011; #5;                             //addi instruction
//assert (controls === 14'b000_0_00_0_1_00_1_000) else $error("error: addi");

end

endmodule
