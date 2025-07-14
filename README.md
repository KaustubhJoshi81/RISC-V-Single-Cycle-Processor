# RISC-V-Single-Cycle-Processor
Implemented single cycle processor hardware for subset of RV32I instructions [lw, sw, add, sub, or, and, slt, beq, jal]. 


I used the testbook "Digital design and Computer Architecture: RISC-V Edition" by Harris & Harris as a reference for developing the RISC-V processor. The design files are in Verilog. I have also created a simple testbench for each of the module in SystemVerilog for verification purposes. 

I am currently working on the hardware required for other I-type instructions (lb, lbu, lh, lhu). I will try to frequently update this repository to include support for other instructions in the RV32I ISA. 
