`timescale 1ns/1ps

module control_unit_tb;

reg [6:0] opcode;

wire RegWrite;
wire ALUSrc;
wire MemWrite;
wire ResultSrc;
wire Branch;
wire [1:0] ImmSrc;
wire [1:0] ALUOp;

control_unit dut(

    .opcode(opcode),

    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .ImmSrc(ImmSrc),
    .ALUOp(ALUOp)
);

initial
begin

    // R-type
    opcode = 7'b0110011;
    #10;

    // ADDI
    opcode = 7'b0010011;
    #10;

    // LW
    opcode = 7'b0000011;
    #10;

    // SW
    opcode = 7'b0100011;
    #10;

    // BEQ
    opcode = 7'b1100011;
    #10;

    $finish;

end

endmodule