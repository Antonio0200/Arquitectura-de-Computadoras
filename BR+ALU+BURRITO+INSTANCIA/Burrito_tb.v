`timescale 1ns/1ns
module Burrito(
    input  [31:0] instr   // instrucción completa
);

wire [4:0] op, op1, op2, rd;
wire [31:0] C1, C2, C3;

// Decodificador
InstructionDecoder dec (
    .instr(instr),
    .op(op),
    .op1(op1),
    .op2(op2),
    .rd(rd)
);

// Banco de registros
brr BR (
    .ar1(op1),
    .ar2(op2),
    .aw(rd),
    .dataIn(C3),
    .we(1),
    .dr1(C1),
    .dr2(C2)
);

// ALU con nombres personalizados
ALU alu32 (
    .A(C1),
    .B(C2),
    .op(op),
    .C(C3)
);

endmodule
