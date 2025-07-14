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
logic [2:0] ALUControl;
logic zero_flag;

ALU DUT(.ALUControl(ALUControl), .a(a), .b(b), .result(result), .zero_flag(zero_flag));

initial
begin
    ALUControl = 3'b000;       //Addition 
    a = 32'b001; b = 32'b010;
    #10;
    
    ALUControl = 3'b000;       //Addition (-ve numbers) => Passed
    a = 32'hFFFFFFFF; b = 32'b010;
    #10;
    
    ALUControl = 3'b001;       //Subtraction => Passed
    a = 32'b10; b = 32'b01;
    #10;
    
    ALUControl = 3'b001;       //Subtraction (b<0) => Passed
    a = 32'b001; b = 32'hFFFFFFFF;
    #10;
    
    ALUControl = 3'b010;       //AND Operation => Passed
    a = 32'b11110000; b = 32'b00001111;
    #10;
    
    ALUControl = 3'b011;       //OR => Passed
    a = 32'b11110000; b = 32'b00001111;
    #10;
    
    ALUControl = 3'b101;       //SLT => passed
    a = 32'b100; b = 32'b001;
    #10;
    a = 32'b001; b = 32'b100;
    
    ALUControl = 3'b000;       //Checking Zero Flag => Passed
    a = 32'b000; b = 32'b000;
    #10;
end

endmodule
