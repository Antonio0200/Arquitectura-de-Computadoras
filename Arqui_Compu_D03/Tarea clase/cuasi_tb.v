`timescale 1ns/1ns
//1. Definivion del Modulo y E/S
module Cuasi_TB();

//2.Def de componentes internos
reg [3:0]A_tb;
reg [3:0]B_tb;
reg Sel_tb;
wire [3:0]C_tb;

//assigns,instancias,bloques secuenciales (initial,always))
Cuasi DUV (
.A(A_tb),
.B(B_tb),
.sel(Sel_tb),
.C(C_tb)
);

initial
begin
		A_tb= 4'd8;
		B_tb=4'd6;
		Sel_tb=1'b0; // suma 8+6=14
	#100;
		Sel_tb=1'b1; //AND 8&6->0
	#100;
		
	#100;
		
	#100;
		
	#100;
		
	#100;
		
	#100;
$stop;
end

endmodule