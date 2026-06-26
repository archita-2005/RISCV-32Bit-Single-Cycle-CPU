module register_file(
    input clk,
    input we3,

    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,

    input [31:0] WD3,

    output [31:0] RD1,
    output [31:0] RD2
);

reg [31:0] rf [31:0];

integer i;

// Initialize all registers to zero
initial begin
    for(i = 0; i < 32; i = i + 1)
        rf[i] = 32'b0;
end

always @(posedge clk)
begin
    if(we3 && (A3 != 0))
        rf[A3] <= WD3;
end

assign RD1 = (A1 == 0) ? 32'b0 : rf[A1];
assign RD2 = (A2 == 0) ? 32'b0 : rf[A2];

endmodule