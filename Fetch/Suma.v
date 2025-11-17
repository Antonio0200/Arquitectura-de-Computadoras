`timescale 1ns/1ns
module ALU_Sumador(
    input wire[31:0] pc_in,
    output wire [31:0] pc_out,
);

assign pc_out = pc_in + 32'd4;

endmodule