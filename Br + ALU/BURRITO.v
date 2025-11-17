`timescale 1ns/1ns
module Burrito(
    input [17:0] instruccion,
    output [31:0] Resultado
);

wire [4:0] Dir1, Dir2, DirEscritura;
wire [2:0] sel;
wire [31:0] C1, C2, C3;

assign Dir1 = instruccion[17:13];
assign Dir2 = instruccion[12:8];
assign sel  = instruccion[2:0];

assign DirEscritura = (sel == 3'b000) ? 5'd12 :    // SUMA → R12
                      (sel == 3'b001) ? 5'd13 :    // AND  → R13
                      (sel == 3'b010) ? 5'd14 :    // OR   → R14
                      instruccion[7:3];            // default usa destino normal

BancoRegistros inst1(
    .ar1(Dir1),
    .ar2(Dir2),
    .aw(DirEscritura),
    .dataIn(C3),
    .we(1),
    .dr1(C1),
    .dr2(C2)
);

ALU inst2(
    .op1(C1),
    .op2(C2),
    .sel(sel),
    .R(C3)
);

assign Resultado = C3;

endmodule
