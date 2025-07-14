`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 18:56:15
// Design Name: 
// Module Name: Test_Mux2
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


module Test_Mux2_ResultSrc();

logic [31:0] ALUResult;
logic [31:0] ReadData;
logic [31:0] PCPlus4;
logic [1:0] ResultSrc;
logic [31:0] y;

Mux2_ResultSrc DUT(ALUResult, ReadData, PCPlus4, ResultSrc, y);

initial begin
ResultSrc = 2'b00; ALUResult = 32'b1000; ReadData = 32'b0001; PCPlus4 = 32'b1010;
#10;
ResultSrc = 2'b01;
#10;
ResultSrc = 2'b10;
#10;
ResultSrc = 2'b11;

//-------------------------------------------------Passed-----------------------------------------------------------//

end
endmodule
