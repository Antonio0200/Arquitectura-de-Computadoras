`timescale 1ns/1ns
module BR_TB();

reg clk_tb;
reg [1:0] dir_tb;
reg [7:0] dato_e_tb;
reg WE_tb, En_tb;
wire [7:0] dato_s_tb;

// Instancia del Banco de Registros
BR dut(
    .clk(clk_tb),
    .Dir(dir_tb),
    .Dato_e(dato_e_tb),
    .WE(WE_tb),
    .En(En_tb),
    .Dato_s(dato_s_tb)
);

// Generador de reloj
initial begin
    clk_tb = 0;
    forever #5 clk_tb = ~clk_tb;
end

initial begin
    En_tb = 1;

    // Escritura en todos los registros
    WE_tb = 1;
    dir_tb = 0; dato_e_tb = 8'd10; #10;
    dir_tb = 1; dato_e_tb = 8'd20; #10;
    dir_tb = 2; dato_e_tb = 8'd30; #10;
    dir_tb = 3; dato_e_tb = 8'd40; #10;

    // Lectura de todos los registros
    WE_tb = 0;
    dir_tb = 0; #10;
    dir_tb = 1; #10;
    dir_tb = 2; #10;
    dir_tb = 3; #10;

    $stop;
end

endmodule

