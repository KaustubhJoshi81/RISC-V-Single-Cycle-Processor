`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2025 13:07:48
// Design Name: 
// Module Name: Test_Data_Compress
// Project Name: Data_Compress
// Target Devices: 
// Tool Versions: 
// Description: A Testbench to verify functionality of Data_Compress which is used for lw,lb,lh,lbu,lhu
//              instructions. An array is used to store the DataSrc signals. Using for loop, the DataSrc
//              is assigned a signal stored in the array. 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Test_Data_Compress();

logic [31:0]ReadData;
logic [31:0]Final_Data;
logic [2:0] DataSrc;

Data_Compress DUT(.ReadData(ReadData), .Final_Data(Final_Data), .DataSrc(DataSrc));

logic [2:0] signals[4:0] = {3'b000,3'b001,3'b010,3'b011,3'b100};

initial begin
    ReadData = 32'hF00FF00F;
    for (integer i=4; i>=0; i--) begin
        DataSrc = signals[i];
        #10;
    end
    #10;
    ReadData = 32'hF00FF0FF;
    for (integer i=4; i>=0; i--) begin
        DataSrc = signals[i];
        #10;
    end
end

//--------------------------------------Passed------------------------------------------------------//

endmodule

