`timescale 1ns/1ns
module BurritoTB();

reg [17:0] instruccion;
wire [31:0] Resultado;

Burrito DUT(
    .instruccion(instruccion),
    .Resultado(Resultado)
);

initial begin

    //SUMA -> R[2] = R[0] + R[1]
    instruccion = {5'd0, 5'd1, 5'd2, 3'b000};
    #10;

    //AND -> R[5] = R[3] & R[4]
    instruccion = {5'd3, 5'd4, 5'd5, 3'b001};
    #10;

    //OR -> R[8] = R[6] | R[7]
    instruccion = {5'd6, 5'd7, 5'd8, 3'b010};
    #10;

    $stop;
end

endmodule
