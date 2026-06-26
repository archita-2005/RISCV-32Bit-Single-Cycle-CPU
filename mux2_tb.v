`timescale 1ns/1ps

module mux2_tb;

reg [31:0] d0;
reg [31:0] d1;
reg s;

wire [31:0] y;

mux2 dut(
    .d0(d0),
    .d1(d1),
    .s(s),
    .y(y)
);

initial
begin

    d0 = 32'd10;
    d1 = 32'd20;

    s = 0;
    #10;

    s = 1;
    #10;

    d0 = 32'd50;
    d1 = 32'd100;

    s = 0;
    #10;

    s = 1;
    #10;

    $finish;

end

endmodule