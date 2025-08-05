`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 00:36:50
// Design Name: Controller
// Module Name: Main_Decoder
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


module Main_Decoder(
input [2:0] funct3,
input [6:0] op,     
output Branch, [1:0]ResultSrc, MemWrite, ALUSrc, [1:0]ImmSrc, RegWrite, [1:0]ALUOp, Jump, [2:0]DataSrc
    );

reg [13:0] controls;

always @(*)
begin
    case (op)                    
    7'b0000011: 
        begin
            case (funct3)              //WE3_Imm_ALUSrc_WE_Result_B_ALUOp_J
            3'b000:  controls <= 14'b000_1___00__1______0__01_____0_00____0;     //lb 
            3'b010:  controls <= 14'b010_1___00__1______0__01_____0_00____0;     //lw 
            3'b001:  controls <= 14'b001_1___00__1______0__01_____0_00____0;     //lh 
            3'b100:  controls <= 14'b100_1___00__1______0__01_____0_00____0;     //lbu 
            3'b101:  controls <= 14'b101_1___00__1______0__01_____0_00____0;     //lhu 
            default: controls <= 14'bz;
            endcase
        end                       
    7'b0010011: 
        begin
            case(funct3)              //WE3_Imm_ALUSrc_WE_Result_B_ALUOp_J
            3'b000: controls <= 14'b010_1___00__1______0__00_____0_00____0;     //addi
            3'b001: controls <= 14'b010_1___00__1______0__00_____0_xx____0;     //slli
            3'b100: controls <= 14'b010_1___00__1______0__00_____0_xx____0;     //xori
            3'b010: controls <= 14'b010_1___00__1______0__00_____0_xx____0;     //slti
            3'b110: controls <= 14'b010_1___00__1______0__00_____0_xx____0;     //ori
            3'b111: controls <= 14'b010_1___00__1______0__00_____0_xx____0;     //andi
            default: controls <= 14'bz;
            endcase
        end                       //WE3_Imm_ALUSrc_WE_Result_B_ALUOp_J
    7'b0100011: controls <= 14'bxxx_0___01__1______1__xx_____0_00____0;     //sw
    7'b0110011: controls <= 14'b010_1___xx__0______0__00_____0_xx____0;     //R-type
    7'b1100011: 
        begin
            case (funct3)
                3'b000: controls <= 14'b010_0___10__0______0__xx_____1_01____0;     //beq
                
            default: controls <= 14'bz;
            endcase
        end
    7'b1101111: controls <= 14'b010_1___11__x______0__10_____0_xx____1;     //jal
    default: controls <= 11'bx; 
    endcase
end

assign DataSrc = controls[13:11];
assign RegWrite = controls[10];
assign ImmSrc = controls[9:8];
assign ALUSrc = controls[7];
assign MemWrite = controls[6];
assign ResultSrc = controls[5:4];
assign Branch = controls [3];
assign ALUOp = controls[2:1];
assign Jump = controls[0];

endmodule
