`timescale 1ns/1ns
//1. Definivion del Modulo y E/S
module Cuasi(
	input[3:0]A,
	input[3:0]B,
	input sel,
	output reg [3:0]C //por que se le asigna un valor dentro del always

);
//2.Def de componentes internos
//NA
//assigns,instancias,bloques secuenciales (initial,always))

always @*
begin
	case (sel)
		1'b0:
			begin
				C=A+B;
			end
		1'b1:
			begin
				C=A&B;
			end
	endcase
		
end

endmodule
