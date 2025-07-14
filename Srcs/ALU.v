module ALU(
    input  [2:0]  ALUControl,
    input  [31:0] a,
    input  [31:0] b,
    output reg [31:0] result,
    output zero_flag
);

always @(*)
begin
    case(ALUControl)
    //Arithmetic Operations
    3'b000: result <= a+b;         //ADD Operation
    3'b001: result <= a-b;         //Sub 
    
    //Logical Oprations
    3'b010: result <= a&b;         //AND Operation
    3'b011: result <= a|b;         //OR 
    
    3'b101: result <= (a<b) ? 1:0; //SLT (Set less than)
    
    default: result <= 32'bx;
    endcase
end

assign zero_flag = (result==32'b0) ? 1:0;

endmodule