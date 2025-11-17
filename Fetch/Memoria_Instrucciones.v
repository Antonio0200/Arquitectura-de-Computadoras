`timescale 1ns/1ns

module MemoriaInstrucciones(
    input [7:0] addr,
    output reg [17:0] instruccion
);

reg [17:0] memoria[0:255];

// Inicializar memoria de instrucciones
initial begin
    // Solo inicializar las primeras 10 posiciones
    memoria[0] = {5'd0, 5'd1, 5'd2, 3'b000};  // SUMA R2 = R0 + R1
    memoria[1] = {5'd3, 5'd4, 5'd5, 3'b001};  // AND  R5 = R3 & R4
    memoria[2] = {5'd6, 5'd7, 5'd8, 3'b010};  // OR   R8 = R6 | R7
    memoria[3] = {5'd9, 5'd10, 5'd11, 3'b000}; // SUMA R11 = R9 + R10
    memoria[4] = {5'd12, 5'd13, 5'd14, 3'b001}; // AND R14 = R12 & R13
    memoria[5] = {5'd15, 5'd16, 5'd17, 3'b010}; // OR R17 = R15 | R16
    
    // El resto se inicializa automáticamente a 'x' pero funciona igual
end

always @* begin
    instruccion = memoria[addr];
end

endmodule