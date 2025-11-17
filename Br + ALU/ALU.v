`timescale 1ns/1ns
module ALU(
    input [31:0] op1,
    input [31:0] op2,
    input [2:0] sel,
    output reg [31:0] R
);

always @* begin
    case(sel)
        3'b000: R = op1 + op2;   // Suma
        3'b001: R = op1 & op2;   // AND
        3'b010: R = op1 | op2;   // OR
        default: R = 32'b0;
    endcase
end

endmodule

