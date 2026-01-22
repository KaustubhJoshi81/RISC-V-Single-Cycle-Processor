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
output Branch, [2:0]ResultSrc, MemWrite, ALUSrc, [1:0]ImmSrc, RegWrite, [1:0]ALUOp, Jump, [2:0]DataSrc, PCTargetSrc
    );

reg [15:0] controls;

always @(*)
begin
    case (op)                    
    //----------------------------------I-type Instructions except jalr--------------------------------------------//
    7'b0000011: 
        begin
            case (funct3)    //TargetSrc_DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
            3'b000:  controls <= 16'bx___000_____1___00__1______0__001_______0_00____0;     //lb 
            3'b010:  controls <= 16'bx___010_____1___00__1______0__001_______0_00____0;     //lw 
            3'b001:  controls <= 16'bx___001_____1___00__1______0__001_______0_00____0;     //lh 
            3'b100:  controls <= 16'bx___100_____1___00__1______0__001_______0_00____0;     //lbu 
            3'b101:  controls <= 16'bx___101_____1___00__1______0__001_______0_00____0;     //lhu 
            default: controls <= 16'bz;
            endcase
        end                       
    7'b0010011: 
        begin
        if(funct3===3'b000)
                       //TargetSrc_DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
            controls <= 16'bx______010_____1___00__1______0__000_______0_00____0;       //addi
        else 
            controls <= 16'bx______010_____1___00__1______0__000_______0_xx____0;       //slli,slti,sltiu,
                                                                                //xori,srai,srli,ori,andi
        end
                          //TargetSrc_DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b1100111: controls <= 16'b1_____010_____1___00__1______0__010_______0_00____1;     //jalr
    
    //-----------------------------------------S type Instructions-------------------------------------------------//I    
                           //TargetSrc_DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b0100011: controls <= 16'bx______xxx_____0___01__1______1__xxx_______0_00____0;     
    
    //-----------------------------------------R type instructions-------------------------------------------------//
                           //TargetSrc_DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b0110011: controls <= 16'bx______010_____1___xx__0______0__000_______0_xx____0;     
    
    //-----------------------------------------B type instructions-------------------------------------------------//
                           //TargetSrc_DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b1100011: controls <= 16'b0______010_____0___10__0______0__xxx_______1_01____0;

    //-----------------------------------------J type instructions-------------------------------------------------//
                           //TargetSrc_DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b1101111: controls <= 16'b0______010_____1___11__x______0__010_______0_xx____1;     //jal
    
    //-----------------------------------------U-Type instruction--------------------------------------------------//
                           //TargetSrc_DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b0010111: controls <= 16'bx______xxx_____1___xx__x______x__011_______0_xx____0;     //auipc
    7'b0110111: controls <= 16'bx______xxx_____1___xx__x______x__100_______0_xx____0;     //lui
            
    default: controls <= 16'bx; 
    endcase
end

assign PCTargetSrc = controls[15];      //For jalr instruction. Selecting between ALUResult and PCTarget.

assign DataSrc = controls[14:12];       //For DataCompress module. This signal is required for executing appropraite 
                                        //load instructoin.
assign RegWrite = controls[11];         //For registre file module. This signal is required for I-type instructions,
                                        //R-type instructions and jal.
assign ImmSrc = controls[10:9];          //For signExtention module. This module does appropriate sign-extention
                                        //depending on the type of current instruction.
assign ALUSrc = controls[8];            //For choosing 2nd input of ALU. This signal controls to choose between
                                        //RD2 output of Register File or output of Sign Extention unit. For R-type
                                        //instructions, RD2 is selected, whereas for I-type, sign-extended immediate
                                        //is selected. 
assign MemWrite = controls[7];          //For S-type instructions. Storing values in the data memory
assign ResultSrc = controls[6:4];       //For selecting appropriate signal (ALUResult, FinalResult, PC) to 
                                        //write to register file
assign Branch = controls [3];           //For beq instruction
assign ALUOp = controls[2:1];           //For ALU Decoder.
assign Jump = controls[0];              //For jal instruction

endmodule
