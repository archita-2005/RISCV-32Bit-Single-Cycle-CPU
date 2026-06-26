`timescale 1ns/1ps

module pcsrc_mux_tb;

reg [31:0] pc_plus4;
reg [31:0] branch_target;
reg pcsrc;

wire [31:0] pc_next;

pcsrc_mux dut(
    .pc_plus4(pc_plus4),
    .branch_target(branch_target),
    .pcsrc(pcsrc),
    .pc_next(pc_next)
);

initial begin

    pc_plus4      = 104;
    branch_target = 108;

    pcsrc = 0;
    #10;

    pcsrc = 1;
    #10;

    pc_plus4      = 204;
    branch_target = 300;

    pcsrc = 0;
    #10;

    pcsrc = 1;
    #10;

    $finish;

end

endmodule