module ALU(
    input  [3:0]  ALUControl,
    input  [31:0] a,
    input  [31:0] b,
    output reg [31:0] result,
    output zero_flag
);

always @(*)
begin
    case(ALUControl)
    //Arithmetic Operations
    4'b0000: result <= a+b;         //ADD Operation
    4'b0001: result <= a-b;         //Sub 
    
    //Logical Oprations
    4'b0010: result <= a&b;         //AND Operation
    4'b0011: result <= a|b;         //OR 
    4'b0100: result <= a^b;         //xor
    4'b0101: result <= (a<b) ? 1:0; //SLT (Set less than)
    4'b0110: result <= a>>b[4:0];   //srl
    4'b0111: result <= a>>>b[4:0];  //sra
    4'b1000: result <= a<<b[4:0];   //sll
    
    default: result <= 32'bx;
    endcase
end

assign zero_flag = (result==32'b0) ? 1:0;

endmodule