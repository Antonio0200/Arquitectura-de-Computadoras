`timescale 1ns/1ns
module mips_pipeline(
    input clk,
    input reset,
    output [31:0] resultado_final
);

wire [31:0] cable_instruccion;
wire [31:0] cable_buf1;
wire [31:0] cable_salida1, cable_salida2;
wire [3:0] cable_alu_func;

ciclo_fetch inst_fetch(
    .clk(clk),
    .rst_tb(reset),
    .instruccion_fetch(cable_instruccion)
);

buf1 inst_buf1(
    .clk_buf1(clk),
    .reset_buf1(reset),
    .ciclof_in(cable_instruccion),
    .buf1_out(cable_buf1)
);

burrote inst_decode(
    .clk(clk),
    .instruccion(cable_buf1),
    .reg_escribir(1'b0),
    .registro_escribir(5'b0),
    .dato_escribir(32'b0),
    .sel2(1'b0),
    .sel(1'b0),
    .salida1(cable_salida1),
    .salida2(cable_salida2),
    .salida3(cable_alu_func)
);

buf2 inst_buf2(
    .clk_buf2(clk),
    .reset_buf2(reset),
    .deco_in(cable_salida1),
    .deco_in2(cable_salida2),
    .alu_func_in(cable_alu_func),
    .buf2_out(resultado_final),
    .buf2_out2(),
    .alu_func_out()
);

endmodule