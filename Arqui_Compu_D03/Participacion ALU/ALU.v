`timescale 1ns/1ns
module ALU4_REQ(
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] sel,   
    output reg [3:0] C
);

always @* begin
    case (sel)
        3'b000: C = A + B;                     // Suma
        3'b001: C = A - B;                     // Resta
        3'b010: C = A & B;                     // AND
        3'b011: C = A | B;                     // OR
        3'b100: C = A ^ B;                     // XOR
        3'b101: C = A << 1;                    // SHL (desplazamiento lógico izq)
        3'b110: C = A >> 1;                    // SHR (desplazamiento lógico der)
        3'b111: C = (A > B) ? 4'b0001 : 
                  (A == B) ? 4'b0010 : 4'b0000; // Comparación (1=GT, 2=EQ, 0=LT)
        default: C = 4'b0000;                  // Valor por defecto
    endcase
end

endmodule
