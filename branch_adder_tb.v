`timescale 1ns/1ps

module branch_adder_tb;

reg [31:0] pc;
reg [31:0] immext;

wire [31:0] branch_target;

branch_adder dut(
    .pc(pc),
    .immext(immext),
    .branch_target(branch_target)
);

initial begin

    pc = 100;
    immext = 8;
    #10;

    pc = 200;
    immext = 16;
    #10;

    pc = 400;
    immext = 20;
    #10;

    $finish;

end

endmodule