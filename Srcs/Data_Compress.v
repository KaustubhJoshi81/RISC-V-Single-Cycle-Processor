`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 12:38:22
// Design Name: 
// Module Name: Data_Compress
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A functional module to use either 32bits, 16bits or 8bits of the ReadData output from the 
//              Data Memory according to the Instruction (lw, lb, lbu, lh, lhu)

//              The fuction of the module is controlled using the DataSrc control signals. These signals 
//              are output of Main Decoder. This module needs to be incorportaed in the datapath, 
//              The input is ReadData from the data memeory and the output goes to the ResultMux.
// 
//              Additional Control signals are required for this module.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Data_Compress(
    input [31:0] ReadData,
    output reg [31:0] Final_Data,
    input [2:0] DataSrc
    );
    
always @(*)
begin
    case(DataSrc)
    3'b000: Final_Data <= {{24{ReadData[7]}}, ReadData[7:0]};   //lb              
    3'b001: Final_Data <= {{16{ReadData[15]}}, ReadData[15:0]}; //lh
    3'b010: Final_Data <= ReadData;                             //lw 
    3'b100: Final_Data <= {24'b0, ReadData[7:0]};               //lbu 
    3'b101: Final_Data <= {16'b0, ReadData[15:0]};              //lhu
    default: Final_Data <= 32'bz;
    endcase
end
endmodule
