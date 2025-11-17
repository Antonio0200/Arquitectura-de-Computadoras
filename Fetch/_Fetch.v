`timescale 1ns/1ns
module FetchUnit(
    input clk,
    input reset,
    output [17:0] instruccion_actual,
    output [7:0] pc_current  // Salida para monitorear el PC
);

wire [7:0] pc_addr;
wire [7:0] next_addr;

assign next_addr = pc_addr + 1;  // Incremento simple del PC
assign pc_current = pc_addr;     // Exportar valor del PC

ProgramCounter pc(
    .clk(clk),
    .reset(reset),
    .next_addr(next_addr),
    .current_addr(pc_addr)
);

MemoriaInstrucciones mem_inst(
    .addr(pc_addr),
    .instruccion(instruccion_actual)
);

endmodule