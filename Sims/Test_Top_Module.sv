`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 18:51:05
// Design Name: 
// Module Name: Test_Top_Module
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


module Test_Top_Module();

logic clk;
logic Reset;
logic MemWrite;
logic [31:0] WriteData;
logic [31:0] DataAddress;
logic [31:0] Final_Result;
logic overflow;
logic underflow;

Top_Module DUT(clk, Reset, MemWrite, WriteData, DataAddress, Final_Result, overflow, underflow);

always begin
clk = 0; #10;
clk = 1; #10;
end

// initialize test 
initial begin
Reset = 1'b1; # 22; Reset = 1'b0;
end

always @(negedge clk)
begin
    if(MemWrite) begin
        if(DataAddress === 32'h50c & WriteData === 32'hfffffaf3) 
        begin
        $display("Simulation succeeded");
        $stop; 
        end 
//        else if (DataAddress !== 96) begin
//        $display("Simulation failed"); $stop;
//        end 
    end
end 

endmodule
