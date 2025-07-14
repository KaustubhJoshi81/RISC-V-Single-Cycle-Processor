`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 15:48:31
// Design Name: 
// Module Name: Test_Register_File
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


module Test_Register_File();

logic clk;
logic [4:0] AD1;
logic [4:0] AD2;
logic WE;
logic [4:0] AD3;
logic [31:0] WD3;
logic [31:0] RD1;
logic [31:0] RD2;

Register_File DUT(clk, AD1, AD2, WE, AD3, WD3, RD1, RD2);

always begin
clk = 0; #5;
clk = 1; #5;
end 

initial begin
//#12;
//Reset = 1;
//#5;
//Reset = 1'b0;
//#5;
//AD1 = 5'b0;
//#10;
//WE = 1; AD3 = 5'b001; WD3 = 31'b001;
//#10;
//WE = 0; AD1 = 5'b001; 
//#10;
//WE = 1; AD3 = 5'b010; WD3 = 31'b010;
//#10;
//WE = 0; AD2 = 5'b010;

AD1 = 5'b00000; AD2 = 5'b00010;

end

endmodule
