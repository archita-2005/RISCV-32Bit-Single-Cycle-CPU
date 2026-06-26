`timescale 1ns/1ps

module imm_extend_tb;

reg [31:0] instr;
reg [1:0] ImmSrc;

wire [31:0] ImmExt;

imm_extend dut(
    .instr(instr),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
);

initial begin

    // addi x1,x0,5

    instr  = 32'h00500093;
    ImmSrc = 2'b00;

    #10;

    // sw x3,0(x0)

    instr  = 32'h00302023;
    ImmSrc = 2'b01;

    #10;

    // beq example

    instr  = 32'h00208463;
    ImmSrc = 2'b10;

    #10;

    $finish;

end

endmodule