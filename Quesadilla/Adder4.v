`timescale 1ns/1ns
// Suma PC + 4 (32 bits)
module adder4 (
    input  wire [31:0] pc_in,
    output wire [31:0] pc_plus4
);

assign pc_plus4 = pc_in + 32'd4;

endmodule

