`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 18:56:16
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

module Test_Mux2();

logic [31:0] a;
logic [31:0] b;
logic Src;
logic [31:0] y;

Mux2 DUT (.a(a), .b(b), .Src(Src), .y(y));

initial begin

Src = 0; a=32'b01; b=32'b00;
#10;
Src = 1; 

//--------------------------------------Passed------------------------------------------//

end

endmodule

