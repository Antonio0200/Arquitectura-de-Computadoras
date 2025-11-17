module Burrito(
	input [4:0]Dir1,
	input [4:0]Dir2,
	input [4:0]DirEscritura

);

wire [31:0]C1,C2,C3;

brr inst1(
	.ar1(Dir1),
	.ar2(Dir2),
	.aw(DirEscritura),
	.dataIn(C3),
	.we(1),
	.dr1(C1),
	.dr2(C2)

);

ADD inst2 (.op1(C1), .op2(C2), .Resultado(C3));

endmodule 
