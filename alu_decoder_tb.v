`timescale 1ns/1ps

module alu_decoder_tb;

reg [1:0] ALUOp;
reg [2:0] funct3;
reg funct7b5;

wire [2:0] ALUControl;

alu_decoder dut(
    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7b5(funct7b5),
    .ALUControl(ALUControl)
);

initial
begin

    // Load/Store -> ADD
    ALUOp = 2'b00;
    funct3 = 3'b000;
    funct7b5 = 0;
    #10;

    // Branch -> SUB
    ALUOp = 2'b01;
    #10;

    // ADD
    ALUOp = 2'b10;
    funct3 = 3'b000;
    funct7b5 = 0;
    #10;

    // SUB
    funct3 = 3'b000;
    funct7b5 = 1;
    #10;

    // AND
    funct3 = 3'b111;
    funct7b5 = 0;
    #10;

    // OR
    funct3 = 3'b110;
    #10;

    // SLT
    funct3 = 3'b010;
    #10;

    $finish;

end

endmodule