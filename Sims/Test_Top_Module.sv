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

Top_Module DUT(clk, Reset, MemWrite, WriteData, DataAddress, Final_Result);

always begin
clk = 0; #10;
clk = 1; #10;
end

// initialize test 
initial begin
Reset = 1'b1; # 22; Reset = 1'b0;
end

// check results 
always @(negedge clk)
begin
    if(MemWrite) begin
        if(DataAddress === 100 & WriteData === 25) 
        begin
        $display("Simulation succeeded");
        $stop; 
        end 
        else if (DataAddress !== 96) begin
        $display("Simulation failed"); $stop;
        end 
    end
end 

endmodule
