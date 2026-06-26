`timescale 1ns/1ps

module program_counter_tb;

reg clk;
reg reset;
reg [31:0] pc_next;

wire [31:0] pc;

program_counter dut (
    .clk(clk),
    .reset(reset),
    .pc_next(pc_next),
    .pc(pc)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    pc_next = 0;

    #10;
    reset = 0;

    pc_next = 32'd4;
    #10;

    pc_next = 32'd8;
    #10;

    pc_next = 32'd12;
    #10;

    pc_next = 32'd16;
    #10;

    $finish;
end

endmodule