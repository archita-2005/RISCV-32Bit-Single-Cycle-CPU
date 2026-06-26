module data_memory(

    input clk,
    input we,

    input [31:0] A,
    input [31:0] WD,

    output [31:0] RD
);

reg [31:0] mem [0:255];

integer i;

// Initialize data memory to zero
initial begin
    for(i = 0; i < 256; i = i + 1)
        mem[i] = 32'b0;
end

always @(posedge clk)
begin
    if(we)
        mem[A[31:2]] <= WD;
end

assign RD = mem[A[31:2]];

endmodule