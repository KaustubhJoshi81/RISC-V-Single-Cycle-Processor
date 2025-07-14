`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 01:42:33
// Design Name: 
// Module Name: Test_Sign_Extention
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


module Test_Sign_Extention();

logic  [31:7]  Instr;
logic  [1:0]   ImmSrc;
logic  [31:0]  Immt;

Sign_extention DUT(Instr, ImmSrc, Immt);

initial begin
//#10;
//ImmSrc = 2'b00; Instr = 25'b1111111111000100101000110;     //I-type => PASSED
//#10;
//Instr = 25'b0111111111000100101000110;

//#10;
//ImmSrc = 2'b01; Instr = 25'b0000000001100100101001000;     //S-type
//#10;
//Instr = 25'b1000000001100100101001000;          //S-type => FAILED

Instr = 25'b0000000001010000000000010; ImmSrc = 2'b00;      //passed. Output = 5

end

endmodule
