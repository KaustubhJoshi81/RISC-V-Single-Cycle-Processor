module ALU(
    input  [3:0]  ALUControl,
    input  signed [31:0] a,
    input  signed [31:0] b,
    output reg signed [31:0] result,
    output zero_flag
);

reg [31:0] abuff;       //Required to convert a&b into unsgined integers for sltu instruction
reg [31:0] bbuff;

always @(*)
begin
    case(ALUControl)
    //Arithmetic Operations
    4'b0000: result <= a+b;         //ADD Operation
    4'b0001: result <= a-b;               //Sub 
    
    //Logical Oprations
    4'b0010: result <= a<<b[4:0];   //sll
    4'b0011: result <= (a<b) ? 1:0; //slt (Set less than)
    4'b0100:                        //sltu
    begin
        abuff <= (a[31]) ? (~a + 1'b1):a;
        bbuff <= (b[31]) ? (~b + 1'b1):b;
        result <= (abuff<bbuff) ? 1:0;
    end                      
    4'b0101: result <= a^b;         //xor
    4'b0110: result <= a>>>b[4:0];  //sra  
    4'b0111: result <= a>>b[4:0];   //srl
    4'b1000: result <= a|b;         //OR 
    4'b1001: result <= a&b;         //AND Operation
    
    default: result <= 32'bx;
    endcase
end

assign zero_flag = (result==32'b0) ? 1:0;   

endmodule