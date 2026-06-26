module riscv_top(

    input clk,
    input reset
);

wire RegWrite;
wire ALUSrc;
wire MemWrite;
wire ResultSrc;
wire Branch;

wire [1:0] ImmSrc;
wire [1:0] ALUOp;

wire [2:0] ALUControl;

wire [31:0] PC;
wire [31:0] Instr;

control_unit CU(

    .opcode(Instr[6:0]),

    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),

    .ImmSrc(ImmSrc),
    .ALUOp(ALUOp)
);

alu_decoder AD(

    .ALUOp(ALUOp),
    .funct3(Instr[14:12]),
    .funct7b5(Instr[30]),

    .ALUControl(ALUControl)
);

datapath DP(

    .clk(clk),
    .reset(reset),

    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),

    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl),

    .PC(PC),
    .Instr(Instr)
);

endmodule