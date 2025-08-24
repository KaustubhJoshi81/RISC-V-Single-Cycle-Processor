# RISC-V-Single-Cycle-Processor
Implemented single cycle processor hardware for subset of RV32I instructions.

I used the testbook "Digital design and Computer Architecture: RISC-V Edition" by Harris & Harris as a reference for developing the RISC-V processor. The design files are in Verilog. I have also created a simple testbench for each of the module in SystemVerilog for verification purposes. For the verification of Top module consisting of CPU, riscvtext.mem is loaded onto the instruction memory which consists of machine code to test the RV32I instructions. 

Apart from lw,sw,beq,jal instructions given in textbook, i have also added support for lb,lh,lbu,lhu,addi,ori,xor,xori,slli,slti,sltiu,srli,srai,sll,srl & sra.  
For the lb,lh,lw,lbu & lhu, I have created a new module named Data_Compress. The inputs to this module are Read port of Data Memory & control signals from the main decoder [control unit] & the output is connected to the Result_Mux. The main decoder first analyses the OP-Code. If the OP-code is 0000011, then it passes down the funct3 to the Data_Compress module as control signals & the Data_Compress module does the necessary operations accordingly. 

Same approach is done for other I-type instructions like addi,slli,xori,slti,ori & andi. The controller checks the OP-code. If OP-Code is 0010011, then the the ALUOp is xx & funct(3) is passed onto the ALU_Decoder. To accomodate the new instructions, the width of ALU_Control signals is increased from [2:0] to [3:0] (4 bits). For sra,srl,srai & srli, if the fifth bit of the OP code is 1, then sra/srai is executed, otherwise srl/srli is executed by the ALU.

I have also added a textfile which explains the additional machine code instructions i have added in the riscvmem.txt file. I have referred to the textbook for the first 21 instructions which tests the 5 instructions which were initially implemented.  
