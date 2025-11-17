`timescale 1ns/1ns
module rom_tb();

reg [7:0] dir_tb;
wire [7:0] dato_tb;

ROM dut(
    .Dir(dir_tb),
    .Dato_s(dato_tb)
);

initial begin
    dir_tb = 0;  #10; // Espera 90
    dir_tb = 1;  #10; // Espera 80
    dir_tb = 2;  #10; // Espera 40
    dir_tb = 3;  #10; // Espera 60
    dir_tb = 4;  #10; // Espera 50
    dir_tb = 5;  #10; // Espera 40
    dir_tb = 6;  #10; // Espera 30
    dir_tb = 7;  #10; // Espera 20
    dir_tb = 8;  #10; // Espera 10
    dir_tb = 9;  #10; // Espera 100
    dir_tb = 10; #10; // Espera 101
    dir_tb = 11; #10; // Espera 102

    $stop;
end

endmodule

