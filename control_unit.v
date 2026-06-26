module control_unit(

    input [6:0] opcode,

    output reg RegWrite,
    output reg ALUSrc,
    output reg MemWrite,
    output reg ResultSrc,
    output reg Branch,

    output reg [1:0] ImmSrc,
    output reg [1:0] ALUOp
);

always @(*)
begin

    RegWrite = 0;
    ALUSrc   = 0;
    MemWrite = 0;
    ResultSrc= 0;
    Branch   = 0;
    ImmSrc   = 2'b00;
    ALUOp    = 2'b00;

    case(opcode)

        // R-type
        7'b0110011:
        begin
            RegWrite = 1;
            ALUSrc   = 0;
            ALUOp    = 2'b10;
        end

        // I-type ADDI
        7'b0010011:
        begin
            RegWrite = 1;
            ALUSrc   = 1;
            ImmSrc   = 2'b00;
            ALUOp    = 2'b10;
        end

        // LW
        7'b0000011:
        begin
            RegWrite = 1;
            ALUSrc   = 1;
            ResultSrc= 1;
            ImmSrc   = 2'b00;
            ALUOp    = 2'b00;
        end

        // SW
        7'b0100011:
        begin
            ALUSrc   = 1;
            MemWrite = 1;
            ImmSrc   = 2'b01;
            ALUOp    = 2'b00;
        end

        // BEQ
        7'b1100011:
        begin
            Branch = 1;
            ImmSrc = 2'b10;
            ALUOp  = 2'b01;
        end

    endcase

end

endmodule