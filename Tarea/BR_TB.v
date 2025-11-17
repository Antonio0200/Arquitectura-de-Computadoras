`timescale 1ns/1ns
module BR_TB();

reg WE_tb;
reg [4:0] AR1_tb, AR2_tb, AW_tb;
reg [31:0] DataIn_tb;
wire [31:0] DR1_tb, DR2_tb;

// Instancia del Banco de Registros
BR dut(
    .WE(WE_tb),
    .AR1(AR1_tb),
    .AR2(AR2_tb),
    .AW(AW_tb),
    .DataIn(DataIn_tb),
    .DR1(DR1_tb),
    .DR2(DR2_tb)
);

initial begin
    // Inicialización
    WE_tb = 0; 
    AR1_tb = 0; AR2_tb = 0; 
    AW_tb = 0; DataIn_tb = 0;

    // Escritura en algunos registros
    #10 WE_tb = 1; AW_tb = 5'd1; DataIn_tb = 32'd100;
    #10 AW_tb = 5'd2; DataIn_tb = 32'd200;
    #10 AW_tb = 5'd3; DataIn_tb = 32'd300;
    #10 AW_tb = 5'd4; DataIn_tb = 32'd400;
    #10 WE_tb = 0;

    // Lectura de pares de registros
    #10 AR1_tb = 5'd1; AR2_tb = 5'd2;
    #10 AR1_tb = 5'd3; AR2_tb = 5'd4;

    $stop;
end

endmodule
