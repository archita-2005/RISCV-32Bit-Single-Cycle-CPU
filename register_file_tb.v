`timescale 1ns/1ps

module register_file_tb;

reg clk;
reg we3;

reg [4:0] A1;
reg [4:0] A2;
reg [4:0] A3;

reg [31:0] WD3;

wire [31:0] RD1;
wire [31:0] RD2;

register_file dut(
    .clk(clk),
    .we3(we3),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WD3(WD3),
    .RD1(RD1),
    .RD2(RD2)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    we3 = 1;

    // write 5 into x1

    A3 = 5'd1;
    WD3 = 32'd5;

    #10;

    // write 10 into x2

    A3 = 5'd2;
    WD3 = 32'd10;

    #10;

    // read x1 and x2

    A1 = 5'd1;
    A2 = 5'd2;

    #10;

    $finish;

end

endmodule