`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2026 11:22:35
// Design Name: 
// Module Name: Mux4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Mux for NextPC signal. 
             // Choose between: PCTarget [jal]
//                              ALUResult [B-type]             
//                              PCPlus4  [neither J-type nore B-type instruction]
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux4(
input [31:0] a,
input [31:0] b,
input [31:0] c,
input [1:0] src,
output reg [31:0] y
    );
always @(*) begin
   case(src) 
        2'b00: y <= a;
        2'b01: y <= b;
        2'b10: y <= c;
        2'b11: y <= c;
   default: y <= 32'bx;
   endcase
end
endmodule
