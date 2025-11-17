
`timescale 1ns/1ns

module Taquito_TB();


reg [3:0] sabor_tb;
wire [7:0] B_tb;


taquito DUV (
    .sabor(sabor_tb),
    .B(B_tb)
);


initial
begin

    sabor_tb = 4'b0001;
    #100;

 
    sabor_tb = 4'b0010; 
    #100;


    sabor_tb = 4'b0100; 
    #100;

    sabor_tb = 4'b1000; 
    #100;

    sabor_tb = 4'b1111; 
    #100;

    $stop;
end

endmodule
