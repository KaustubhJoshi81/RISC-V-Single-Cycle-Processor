`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 00:15:00
// Design Name: Datapath
// Module Name: Register File
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
module Register_File(
input clk,
input [4:0] AD1,
input [4:0] AD2,
input WE,
input [4:0] AD3,
input [31:0] WD3,
output [31:0] RD1,
output [31:0] RD2
);

reg [31:0] reg_file[31:0];

initial begin
        reg_file[0] = 32'b0;
end

assign RD1 = reg_file [AD1];
assign RD2 = reg_file [AD2];

always @(posedge clk)
begin
    if (WE)
    begin
        reg_file [AD3] <= WD3;
    end
end

endmodule
