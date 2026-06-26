`timescale 1ns/1ps

module riscv_top_tb;

reg clk;
reg reset;

riscv_top dut(
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #80;

    $finish;

end

endmodule