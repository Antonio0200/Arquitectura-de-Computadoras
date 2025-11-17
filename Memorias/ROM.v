`timescale 1ns/1ns
//1. Definivion del Modulo y E/S
module ROM(
	input [7:0]Dir,
	output reg [7:0]Dato_s

);
//2.Def de componentes internos
reg [0:11][7:0]ROM;
//assigns,instancias,bloques secuenciales (initial,always))

initial
begin 

ROM[0]=8'd90;
ROM[1]=8'd80;
ROM[2]=8'd40;
ROM[3]=8'd60;
ROM[4]=8'd50;
ROM[5]=8'd40;
ROM[6]=8'd30;
ROM[7]=8'd20;
ROM[8]=8'd10;
ROM[9]=8'd100;
ROM[10]=8'd101;
ROM[11]=8'd102;

end

always @*
begin

	Dato_s = ROM[Dir];
	#10;

	
end

endmodule


