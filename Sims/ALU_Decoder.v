`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 02:52:57
// Design Name: Controller
// Module Name: ALU_Decoder
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


module ALU_Decoder(
input [2:0] funct3,
input funct7b5, opb5,
input [1:0]ALUOp,
output reg [3:0]ALUControl 
    );
    
wire RTypeSub = funct7b5 & opb5; //R-type suctraction

always @(*)
begin
    case(ALUOp)
        2'b00: ALUControl <= 4'b0000;                        //Add (lw,sw)
        2'b01: ALUControl <= 4'b0001;                        //Sub (beq)
        default: case(funct3)
                    3'b000: if(RTypeSub)
                                ALUControl <= 4'b0001;       //Subtraction
                            else 
                                ALUControl <= 4'b0000;       //Addition
                    3'b010: ALUControl <= 4'b0101;           //SLT
                    3'b100: ALUControl <= 4'b0100;           //xor
                    3'b110: ALUControl <= 4'b0011;           //OR
                    3'b111: ALUControl <= 4'b0010;           //AND
                    default: ALUControl <= 4'bz;
                 endcase                     
    endcase
end

endmodule
