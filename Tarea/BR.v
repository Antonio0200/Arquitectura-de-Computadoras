`timescale 1ns/1ns
module BR(
    input WE,                   // Write Enable
    input [4:0] AR1, AR2, AW,   // Direcciones (32 registros ? 5 bits)
    input [31:0] DataIn,        // Dato a escribir
    output [31:0] DR1, DR2      // Datos leídos
);

reg [31:0] REGISTROS [0:31];    // Banco de 32 registros de 32 bits

// Escritura asíncrona controlada por WE
always @(*) begin
    if (WE)
        REGISTROS[AW] = DataIn;
end

// Lectura asíncrona
assign DR1 = REGISTROS[AR1];
assign DR2 = REGISTROS[AR2];

endmodule

