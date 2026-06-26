module instruction_mem(
    input  [31:0] A,
    output [31:0] RD
);

reg [31:0] mem [0:255];

initial begin

    // addi x1, x0, 5
    mem[0] = 32'h00500093;

    // addi x2, x0, 10
    mem[1] = 32'h00A00113;

    // add x3, x1, x2
    mem[2] = 32'h002081B3;

    // sw x3, 0(x0)
    mem[3] = 32'h00302023;

    // lw x4, 0(x0)
    mem[4] = 32'h00002203;

    // NOPs
    mem[5] = 32'h00000013;
    mem[6] = 32'h00000013;
    mem[7] = 32'h00000013;

end

assign RD = mem[A[31:2]];

endmodule