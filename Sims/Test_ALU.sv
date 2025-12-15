`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 15:48:31
// Design Name: 
// Module Name: Test_ALU
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


module Test_ALU();
logic [31:0]a;
logic [31:0]b;
logic [31:0]result;
logic [3:0] ALUControl;
logic zero_flag;
logic overflow;
logic underflow;
logic less_than_flag;

ALU DUT(.ALUControl(ALUControl), .a(a), .b(b), .result(result), .zero_flag(zero_flag), .overflow(overflow)
        , .underflow(underflow), .less_than_flag(less_than_flag));

initial
begin
    ALUControl = 4'b000;       //Addition 
    a = 32'h40000000; b = 32'h40000000;
    #10;
    
    ALUControl = 4'b000;       //Addition (-ve numbers) => Passed
    a = 32'hFFFFFFF0; b = 32'b010;
    #10;
    
    ALUControl = 4'b001;       //Subtraction => Passed
    a = 32'b10; b = 32'b01;
    #10;
    
    ALUControl = 4'b001;       //Subtraction (b<0) => Passed
    a = 32'b001; b = 32'hFFFFFFFF;
    #10;
    
    ALUControl = 4'b010;       //AND Operation => Passed
    a = 32'b11110000; b = 32'b00001111;
    #10;
    
    ALUControl = 3'b011;       //OR => Passed
    a = 32'b11110000; b = 32'b00001111;
    #10;
    
    ALUControl = 3'b101;       //SLT 
    a = 32'b100; b = 32'b001;
    #10;
    a = 32'b001; b = 32'b100;
    #10;
    a = 32'h80000000; b = 32'b001;
    
    ALUControl = 3'b000;       //Checking Zero Flag => Passed
    a = 32'b000; b = 32'b000;
    #10;
    
    ALUControl = 4'b001;       //Checking underflow flag
    a = 32'h80000000; b = 32'h80000000;
    #10;
    
end

endmodule
