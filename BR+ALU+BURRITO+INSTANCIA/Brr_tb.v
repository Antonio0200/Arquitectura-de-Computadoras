`timescale 1ns/1ns
module bancotb();

reg we_tb;
reg [4:0] ar1_tb, ar2_tb, aw_tb;
reg [31:0] dataIn_tb;
wire [31:0] dr1_tb, dr2_tb;

// Instancia del Banco de Registros
BancoR dut(
    .we(we_tb),
    .ar1(ar1_tb),
    .ar2(ar2_tb),
    .aw(aw_tb),
    .dataIn(dataIn_tb),
    .dr1(dr1_tb),
    .dr2(dr2_tb)
);

initial begin
    // Inicialización
    we_tb = 0; 
    ar1_tb = 0; ar2_tb = 0; 
    aw_tb = 0; dataIn_tb = 0;

    /* Escritura en algunos registros
    #10 we_tb = 1; aw_tb = 5'd1; dataIn_tb = 32'd100;
    #10 aw_tb = 5'd2; dataIn_tb = 32'd200;
    #10 aw_tb = 5'd3; dataIn_tb = 32'd300;
    #10 aw_tb = 5'd4; dataIn_tb = 32'd400;
    #10 we_tb = 0;

    // Lectura de pares de registros
    #10 ar1_tb = 5'd1; ar2_tb = 5'd2;
    #10 ar1_tb = 5'd3; ar2_tb = 5'd4; */

    $stop;
end

endmodule
