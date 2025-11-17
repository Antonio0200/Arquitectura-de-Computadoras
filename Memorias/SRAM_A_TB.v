`timescale 1ns/1ns
module SRAM_A_TB();

reg [7:0] dato_e_tb;
reg [7:0] dir_tb;
reg we_tb, en_tb;
wire [7:0] dato_s_tb;

SRAM_A dut(
    .Dir(dir_tb),
    .Dato_e(dato_e_tb),
    .We(we_tb),
    .En(en_tb),
    .Dato_s(dato_s_tb)
);

initial begin
    en_tb = 1;

    // Lectura inicial
    we_tb = 0;
    dir_tb = 0;  #10;
    dir_tb = 1;  #10;
    dir_tb = 2;  #10;
    dir_tb = 3;  #10;
    dir_tb = 4;  #10;
    dir_tb = 5;  #10;
    dir_tb = 6;  #10;
    dir_tb = 7;  #10;
    dir_tb = 8;  #10;
    dir_tb = 9;  #10;
    dir_tb = 10; #10;
    dir_tb = 11; #10;

    // Escritura
    we_tb = 1;
    dir_tb = 0; dato_e_tb = 8'd200; #10;
    dir_tb = 1; dato_e_tb = 8'd201; #10;
    dir_tb = 2; dato_e_tb = 8'd202; #10;
    dir_tb = 3; dato_e_tb = 8'd203; #10;
    dir_tb = 4; dato_e_tb = 8'd204; #10;
    dir_tb = 5; dato_e_tb = 8'd205; #10;
    dir_tb = 6; dato_e_tb = 8'd206; #10;
    dir_tb = 7; dato_e_tb = 8'd207; #10;
    dir_tb = 8; dato_e_tb = 8'd208; #10;
    dir_tb = 9; dato_e_tb = 8'd209; #10;
    dir_tb = 10; dato_e_tb = 8'd210; #10;
    dir_tb = 11; dato_e_tb = 8'd211; #10;

    // Lectura después de escribir
    we_tb = 0;
    dir_tb = 0;  #10;
    dir_tb = 1;  #10;
    dir_tb = 2;  #10;
    dir_tb = 3;  #10;
    dir_tb = 4;  #10;
    dir_tb = 5;  #10;
    dir_tb = 6;  #10;
    dir_tb = 7;  #10;
    dir_tb = 8;  #10;
    dir_tb = 9;  #10;
    dir_tb = 10; #10;
    dir_tb = 11; #10;

    $stop;
end

endmodule

