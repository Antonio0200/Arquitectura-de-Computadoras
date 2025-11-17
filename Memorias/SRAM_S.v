`timescale 1ns/1ns
module SRAM_S(
    input clk,
    input En,
    input WE,              // 1=escribir, 0=leer
    input [7:0] Dir,
    input [7:0] Dato_e,
    output reg [7:0] Dato_s
);

// Memoria de 12 posiciones de 8 bits
reg [7:0] RAM [0:11];

initial begin
    RAM[0]=8'd90;  
    RAM[1]=8'd80;  
    RAM[2]=8'd40;
    RAM[3]=8'd60;  
    RAM[4]=8'd50;  
    RAM[5]=8'd40;
    RAM[6]=8'd30;  
    RAM[7]=8'd20;  
    RAM[8]=8'd10;
    RAM[9]=8'd100; 
    RAM[10]=8'd101; 
    RAM[11]=8'd102;
end

always @(posedge clk) begin
    if (En) begin
        if (WE)
            RAM[Dir] <= Dato_e;  // escritura en flanco positivo
        else
            Dato_s <= RAM[Dir]; // lectura en flanco positivo
    end
end

endmodule
