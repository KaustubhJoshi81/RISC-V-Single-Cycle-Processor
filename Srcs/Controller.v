`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 03:29:33
// Design Name: CPU
// Module Name: Controller
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


module Controller(
input [2:0] funct3,
input zero_flag,
input less_than_flag,
input unsign_less_than_flag,
input funct7b5,
input [6:0] op,
output PCSrc,     
output [2:0]ResultSrc, MemWrite, ALUSrc, [1:0]ImmSrc, RegWrite, [3:0]ALUControl, [2:0] DataSrc, PCTarget
    );
   
wire Branch;
wire Jump;
wire [1:0]ALUOp;
reg PCSrcReg;

Main_Decoder main_dec(funct3, op,Branch,ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUOp, Jump, DataSrc, PCTarget);
ALU_Decoder alu_dec(funct3, funct7b5, op[5], ALUOp, ALUControl);

always @(*) begin 
//    if(op==7'b1101111) 
//        PCSrc <= Jump;
//    else begin
        case(funct3)
        3'b000: PCSrcReg <= (zero_flag & Branch);                      //beq
        3'b001: PCSrcReg <= (~zero_flag & Branch);                     //bne
        3'b100: PCSrcReg <= less_than_flag & Branch;                   //blt
        3'b101: PCSrcReg <= ~less_than_flag | zero_flag & Branch;      //bge
        3'b110: PCSrcReg <= unsign_less_than_flag & Branch;            //bltu
        3'b111: PCSrcReg <= ~unsign_less_than_flag & Branch;           //bgeu
        default: PCSrcReg <= Jump;  
        endcase
//    end
end

assign PCSrc = PCSrcReg + Jump; 

endmodule
