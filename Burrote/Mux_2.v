`timescale 1ns/1ns

module Mux_2(
input sel2,
input [31:0]C,
input [31:0]D,

output[31:0]E

);

	assign E=sel2?D:C;
	
endmodule

