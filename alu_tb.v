`timescale 1ns/1ps

module alu_tb;

reg [31:0] A;
reg [31:0] B;
reg [2:0] ALUControl;

wire [31:0] Result;
wire Zero;

alu dut(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Result(Result),
    .Zero(Zero)
);

initial
begin

    // ADD
    A = 10;
    B = 5;
    ALUControl = 3'b000;
    #10;

    // SUB
    A = 10;
    B = 5;
    ALUControl = 3'b001;
    #10;

    // AND
    A = 10;
    B = 12;
    ALUControl = 3'b010;
    #10;

    // OR
    A = 10;
    B = 12;
    ALUControl = 3'b011;
    #10;

    // SLT
    A = 5;
    B = 10;
    ALUControl = 3'b100;
    #10;

    $finish;

end

endmodule