`timescale 1ns/1ps

module pc_adder_tb;

reg [31:0] pc;
wire [31:0] pc_plus4;

pc_adder dut(
    .pc(pc),
    .pc_plus4(pc_plus4)
);

initial begin

    pc = 0;
    #10;

    pc = 4;
    #10;

    pc = 8;
    #10;

    pc = 100;
    #10;

    $finish;

end

endmodule