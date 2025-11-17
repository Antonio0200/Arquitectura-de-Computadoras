
module modulos(
 
	//Entradas
	input a,
	input b,
	
	//AND
	output c,

	//NAND
	output d,
	
	//OR
	output e,
	
	//NOR
	output f,
	
	//NOT
	output g,
	
	//XOR
	output h,
	
	//XNOR
	output i
	
	);

//AND
assign c = a & b;

//NAND
assign d = ~(a & b);

//OR
assign e = a | b;

//NOR
assign f = ~(a | b);

//NOT
assign g = ~a;

//XOR
assign h = a ^ b;

//XNOR
assign i = ~(a ^ b);


endmodule

