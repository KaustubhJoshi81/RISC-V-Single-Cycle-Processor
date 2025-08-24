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
    //----------------------------------I-type Instructions except jalr--------------------------------------------//
    7'b0000011: 
        begin
            case (funct3)      //DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
            3'b000:  controls <= 14'b000_1___00__1______0__01________0_00____0;     //lb 
            3'b010:  controls <= 14'b010_1___00__1______0__01________0_00____0;     //lw 
            3'b001:  controls <= 14'b001_1___00__1______0__01________0_00____0;     //lh 
            3'b100:  controls <= 14'b100_1___00__1______0__01________0_00____0;     //lbu 
            3'b101:  controls <= 14'b101_1___00__1______0__01________0_00____0;     //lhu 
            default: controls <= 14'bz;
            endcase
        end                       
    7'b0010011: 
        begin
        if(funct3===3'b000)
            controls <= 14'b010____1___00__1______0__00________0_00____0;  //addi
        else 
            controls <= 14'b010____1___00__1______0__00________0_xx____0;  //slli,slti,sltiu,xori,srai,srli,ori,andi

//            case(funct3)         //DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
//            3'b000: controls <= 14'b010____1___00__1______0__00________0_00____0;     //addi
//            3'b001: controls <= 14'b010____1___00__1______0__00________0_xx____0;     //slli
//            3'b010: controls <= 14'b010____1___00__1______0__00________0_xx____0;     //slti
//            3'b011: controls <= 14'b010____1___00__1______0__00________0_xx____0;     //sltiu
//            3'b100: controls <= 14'b010____1___00__1______0__00________0_xx____0;     //xori
//            3'b101: controls <= 14'b010____1___00__1______0__00________0_xx____0;     //srai/srli
//            3'b110: controls <= 14'b010____1___00__1______0__00________0_xx____0;     //ori
//            3'b111: controls <= 14'b010____1___00__1______0__00________0_xx____0;     //andi
//            default: controls <= 14'b010____1___00__1______0__00________0_xx____0;
//            endcase

        end
        
    //-----------------------------------------S type Instructions-------------------------------------------------//I    
                             //DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b0100011: controls <= 14'bxxx____0___01__1______1__xx________0_00____0;     //sw
    
    //-----------------------------------------R type instructions-------------------------------------------------//
                             //DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b0110011: controls <= 14'b010____1___xx__0______0__00________0_xx____0;     //R-type
    
    //-----------------------------------------B type instructions-------------------------------------------------//
    7'b1100011: 
        begin
            case (funct3)            //DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
                3'b000: controls <= 14'b010____0___10__0______0__xx________1_01____0;     //beq
            default: controls <= 14'bz;
            endcase
        end
        
    //-----------------------------------------J type instructions-------------------------------------------------//
                             //DataSrc_WE3_Imm_ALUSrc_WE_ResultSrc_B_ALUOp_J
    7'b1101111: controls <= 14'b010____1___11__x______0__10________0_xx____1;     //jal
    
    default: controls <= 11'bx; 
    endcase
end

assign DataSrc = controls[13:11];       //For DataCompress module. This signal is required for executing appropraite 
                                        //load instructoin.
assign RegWrite = controls[10];         //For registre file module. This signal is required for I-type instructions,
                                        //R-type instructions and jal.
assign ImmSrc = controls[9:8];          //For signExtention module. This module does appropriate sign-extention
                                        //depending on the type of current instruction.
assign ALUSrc = controls[7];            //For choosing 2nd input of ALU. This signal controls to choose between
                                        //RD2 output of Register File or output of Sign Extention unit. For R-type
                                        //instructions, RD2 is selected, whereas for I-type, sign-extended immediate
                                        //is selected. 
assign MemWrite = controls[6];          //For S-type instructions. Storing values in the data memory
assign ResultSrc = controls[5:4];       //For selecting appropriate signal (ALUResult, FinalResult, PC) to 
                                        //write to register file
assign Branch = controls [3];           //For beq instruction
assign ALUOp = controls[2:1];           //For ALU Decoder.
assign Jump = controls[0];              //For jal instruction

endmodule
