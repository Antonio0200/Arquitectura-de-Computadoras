`timescale 1ns/1ns
module BR(
    input clk,
    input En,
    input WE,
    input [1:0] Dir,       // dirección de 2 bits (4 registros)
    input [7:0] Dato_e,
    output reg [7:0] Dato_s
);

reg [7:0] REGISTROS [0:3];

always @(posedge clk) begin
    if (En) begin
        if (WE)
            REGISTROS[Dir] <= Dato_e; // escritura
        else
            Dato_s <= REGISTROS[Dir]; // lectura
    end
end

endmodule

