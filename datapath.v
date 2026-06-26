module datapath(

    input clk,
    input reset,

    input RegWrite,
    input ALUSrc,
    input MemWrite,
    input ResultSrc,
    input Branch,

    input [1:0] ImmSrc,
    input [2:0] ALUControl,

    output [31:0] PC,
    output [31:0] Instr
);

wire [31:0] PCNext;
wire [31:0] PCPlus4;
wire [31:0] BranchTarget;

wire [31:0] RD1;
wire [31:0] RD2;

wire [31:0] ImmExt;

wire [31:0] SrcB;
wire [31:0] ALUResult;

wire [31:0] ReadData;
wire [31:0] Result;

wire Zero;
wire PCSrc;

assign PCSrc = Branch & Zero;

program_counter pc_reg(
    .clk(clk),
    .reset(reset),
    .pc_next(PCNext),
    .pc(PC)
);

instruction_mem imem(
    .A(PC),
    .RD(Instr)
);

pc_adder pcadd(
    .pc(PC),
    .pc_plus4(PCPlus4)
);

imm_extend immgen(
    .instr(Instr),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
);

branch_adder badd(
    .pc(PC),
    .immext(ImmExt),
    .branch_target(BranchTarget)
);

pcsrc_mux pcmux(
    .pc_plus4(PCPlus4),
    .branch_target(BranchTarget),
    .pcsrc(PCSrc),
    .pc_next(PCNext)
);

register_file rf(
    .clk(clk),
    .we3(RegWrite),

    .A1(Instr[19:15]),
    .A2(Instr[24:20]),
    .A3(Instr[11:7]),

    .WD3(Result),

    .RD1(RD1),
    .RD2(RD2)
);

mux2 alusrc_mux(
    .d0(RD2),
    .d1(ImmExt),
    .s(ALUSrc),
    .y(SrcB)
);

alu alu_core(
    .A(RD1),
    .B(SrcB),
    .ALUControl(ALUControl),

    .Result(ALUResult),
    .Zero(Zero)
);

data_memory dmem(
    .clk(clk),
    .we(MemWrite),

    .A(ALUResult),
    .WD(RD2),

    .RD(ReadData)
);

mux2 result_mux(
    .d0(ALUResult),
    .d1(ReadData),
    .s(ResultSrc),
    .y(Result)
);

endmodule