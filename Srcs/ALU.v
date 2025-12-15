module ALU(
    input  [3:0]  ALUControl,
    input  signed [31:0] a,
    input  signed [31:0] b,
    output reg signed [31:0] result,
    output zero_flag,
    output less_than_flag,
    output unsign_less_than_flag,
    output reg overflow,
    output reg underflow
);

wire [31:0] abuff;       //Required to convert a&b into unsgined integers for sltu instruction
wire [31:0] bbuff;

assign abuff = (a[31]) ? (~a + 1'b1):a; 
assign bbuff = (b[31]) ? (~b + 1'b1):b;

always @(*)
begin
    case(ALUControl)
    //Arithmetic Operations
    4'b0000: begin 
        result <= a+b;         //ADD Operation
        overflow <= (a[31]==1'b0 & b[31]==1'b0 & result[31]==1'b1) ? 1:0;   //Overflow flag
    end
    4'b0001: begin
        result <= a-b;         //Sub 
        underflow <= (a[31]==1'b1 & b[31]==1'b1 & result[31]==1'b0) ? 1:0;  //Underflow flag
    end
    //Logical Oprations
    4'b0010: result <= a<<b[4:0];           //sll
    4'b0011: result <= (a<b) ? 1:0;         //slt (Set less than)
    4'b0100: result <= (abuff<bbuff) ? 1:0; //sltu
    4'b0101: result <= a^b;                 //xor
    4'b0110: result <= a>>>b[4:0];          //sra  
    4'b0111: result <= a>>b[4:0];           //srl
    4'b1000: result <= a|b;                 //OR 
    4'b1001: result <= a&b;                 //AND Operation
    
    default: result <= 32'bx;
    endcase
end

assign zero_flag = (result==32'b0) ? 1:0;   
assign less_than_flag = (a<b) ? 1:0;
assign unsign_less_than_flag = (abuff < bbuff) ? 1:0;

endmodule