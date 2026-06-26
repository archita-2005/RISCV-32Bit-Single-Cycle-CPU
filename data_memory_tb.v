`timescale 1ns/1ps

module data_memory_tb;

reg clk;
reg we;

reg [31:0] A;
reg [31:0] WD;

wire [31:0] RD;

data_memory dut(
    .clk(clk),
    .we(we),
    .A(A),
    .WD(WD),
    .RD(RD)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;

    // Write 25 into memory[0]
    we = 1;
    A = 0;
    WD = 25;
    #10;

    // Write 50 into memory[1]
    A = 4;
    WD = 50;
    #10;

    // Read memory[0]
    we = 0;
    A = 0;
    #10;

    // Read memory[1]
    A = 4;
    #10;

    $finish;

end

endmodule