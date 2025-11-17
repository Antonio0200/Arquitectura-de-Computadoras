`timescale 1ns/1ns

module Quesadilla (
    input  wire clk,
    input  wire reset,
    output wire [31:0] pc_current,
    output wire [31:0] pc_next,
    output wire [31:0] instruccion_actual
);

wire [31:0] pc_plus4;
wire [5:0]  rom_addr_byte;

ProgramCounter PC (
    .clk(clk),
    .reset(reset),
    .next_pc(pc_plus4),
    .current_pc(pc_current)
);

adder4 ADD4 (
    .pc_in(pc_current),
    .pc_plus4(pc_plus4)
);

// Usamos los 6 bits menos significativos de la dirección byte

assign rom_addr_byte = pc_current[5:0];

MemoriaInstrucciones MEM (
    .addr_byte(rom_addr_byte),
    .instruccion(instruccion_actual)
);

// salidas externas
assign pc_next = pc_plus4;

endmodule

