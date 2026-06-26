module imm_extend(
    input [31:0] instr,
    input [1:0] ImmSrc,
    output reg [31:0] ImmExt
);

always @(*)
begin
    case(ImmSrc)

        // I-Type
        2'b00:
            ImmExt = {{20{instr[31]}}, instr[31:20]};

        // S-Type
        2'b01:
            ImmExt = {{20{instr[31]}},
                      instr[31:25],
                      instr[11:7]};

        // B-Type
        2'b10:
            ImmExt = {{19{instr[31]}},
                      instr[31],
                      instr[7],
                      instr[30:25],
                      instr[11:8],
                      1'b0};

        default:
            ImmExt = 32'b0;

    endcase
end

endmodule