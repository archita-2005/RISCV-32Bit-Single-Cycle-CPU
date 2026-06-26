`timescale 1ns/1ps

module instruction_mem_tb;

reg [31:0] A;
wire [31:0] RD;

instruction_mem dut(
    .A(A),
    .RD(RD)
);

initial begin

    A = 0;
    #10;

    A = 4;
    #10;

    A = 8;
    #10;

    A = 12;
    #10;

    $finish;

end

endmodule