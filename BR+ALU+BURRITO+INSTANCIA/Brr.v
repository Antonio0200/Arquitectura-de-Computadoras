`timescale 1ns/1ns
module BancoR(
input [4:0] ar1,
input [4:0] ar2,
input [4:0]aw,
input [31:0] dataIn,
input we,
output reg [31:0] dr1,
output reg [31:0] dr2
);
reg[31:0]ROM[0:31];
initial
	begin
		$readmemb("Datos.txt",ROM);
		end
always @*
	begin
	dr1 = ROM[ar1];
	dr2 = ROM[ar2];
			if(we)
		ROM[aw]=dataIn;
	end
endmodule