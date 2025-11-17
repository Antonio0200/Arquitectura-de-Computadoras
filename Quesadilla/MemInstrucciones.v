`timescale 1ns/1ns

module MemoriaInstrucciones (
    input  wire [5:0] addr_byte,       
    output reg  [31:0] instruccion   
);

reg [7:0] rom [0:63];
integer i;
wire [5:0] a0, a1, a2, a3;

assign a0 = addr_byte;
assign a1 = addr_byte + 6'd1;
assign a2 = addr_byte + 6'd2;
assign a3 = addr_byte + 6'd3;

initial begin
    // Inicializo ROM con 0 por defecto
    for (i = 0; i < 64; i = i + 1) rom[i] = 8'h00;

    rom[0] = 8'h20; rom[1] = 8'h10; rom[2] = 8'h00; rom[3] = 8'h01;

    rom[4] = 8'h8c; rom[5] = 8'h11; rom[6] = 8'h00; rom[7] = 8'h04;
    rom[8]  = 8'h01; rom[9]  = 8'h2a; rom[10] = 8'h40; rom[11] = 8'h20;

    rom[12] = 8'h01; rom[13] = 8'h4b; rom[14] = 8'h48; rom[15] = 8'h22;

    rom[16] = 8'h3c; rom[17] = 8'h01; rom[18] = 8'h00; rom[19] = 8'h05;
    rom[20] = 8'hac; rom[21] = 8'h12; rom[22] = 8'h00; rom[23] = 8'h10;
    // resto ya queda en 0
end

always @(*) begin
    instruccion[31:24] = (a0 <= 6'd63) ? rom[a0] : 8'h00;
    instruccion[23:16] = (a1 <= 6'd63) ? rom[a1] : 8'h00;
    instruccion[15:8]  = (a2 <= 6'd63) ? rom[a2] : 8'h00;
    instruccion[7:0]   = (a3 <= 6'd63) ? rom[a3] : 8'h00;
end

endmodule
