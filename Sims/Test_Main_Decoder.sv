`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2025 18:01:35
// Design Name: 
// Module Name: Test_Main_Decoder
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


module Test_Main_Decoder();

logic Branch; 
logic [1:0]ResultSrc; 
logic MemWrite; 
logic ALUSrc;
logic [1:0]ImmSrc;
logic RegWrite;
logic [1:0]ALUOp;
logic Jump;
logic [10:0] controls;
logic [6:0] op;

Main_Decoder DUT(op, Branch, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUOp, Jump);

//assign RegWrite = controls[10];
//assign ImmSrc = controls[9:8];
//assign ALUSrc = controls[7];
//assign MemWrite = controls[6];
//assign ResultSrc = controls[5:4];
//assign Branch = controls [3];
//assign ALUOp = controls[2:1];
//assign Jump = controls[0];

assign controls = {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp, Jump};

initial begin
op = 7'b11; 
#5;
assert (controls === 11'b10010010000) else $error("0000011 failed.");
#10;
op = 7'b0100011; 
#5;
assert (controls === 11'b00111000000) else $error("0100011 failed.");
#10;
op = 7'b0110011;
#5; 
assert (controls === 11'b1xx00000100) else $error("0110011 failed.");
#10;
op = 7'b1100011; 
#5;
assert (controls === 11'b01000001010) else $error("1100011 failed.");
#10;
op = 7'b0010011;
#5; 
assert (controls === 11'b10010000100) else $error("0010011 failed.");
#10;
op = 7'b1101111;
#5;
assert (controls === 11'b11100100001) else $error("1101111 failed.");
end

//--------------------------------------------Passed------------------------------------------------//

endmodule
