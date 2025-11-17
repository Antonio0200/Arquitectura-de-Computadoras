module InstructionDecoder(
    input  [31:0] instr,
    output [4:0] op,
    output [4:0] op1,
    output [4:0] op2,
    output [4:0] rd
);

assign op  = instr[31:24];
assign op1 = instr[23:16];
assign op2 = instr[15:8];
assign rd  = instr[7:0];

endmodule

