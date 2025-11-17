`timescale 1ns/1ns

module Mux_1(
input sel1,
input [4:0]A,
input [4:0]B,

output[4:0]S

);

	assign S=sel1 ? B:A;
	
endmodule
