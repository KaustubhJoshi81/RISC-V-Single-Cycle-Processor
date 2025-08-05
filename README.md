# RISC-V-Single-Cycle-Processor
Implemented single cycle processor hardware for subset of RV32I instructions.

I used the testbook "Digital design and Computer Architecture: RISC-V Edition" by Harris & Harris as a reference for developing the RISC-V processor. The design files are in Verilog. I have also created a simple testbench for each of the module in SystemVerilog for verification purposes. For the verification of Top module consisting of CPU, riscvtext.mem is loaded onto the instruction memory which consists of machine code to test the RV32I instructions. 

Apart from lw,sw,beq,jal instructions given in textbook, i have also added support for lb,lh,lbu,lhu,addi,ori,xor,xori,slli,slti,sll,srl & sra.  
For the lb,lh,lw,lbu & lhu. i have created a new module named Data_Compress. The inputs to this module are Read port of Data Memory & control signals from the main decoder [control unit]. The main decoder first analyses the OP-Code. If the OP-code is 0000011, then it passes down the funct3 to the Data_Compress module as control signals & the Data_Compress module does the necessary operations accordingly. 
