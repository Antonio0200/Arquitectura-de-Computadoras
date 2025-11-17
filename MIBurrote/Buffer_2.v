`timescale 1ns/1ns

module Buffer_2(
    input wire clk,
    input wire enable,
    input wire [31:0] data_in,
    output reg [31:0] data_out
);
    always @(posedge clk) begin
        if (enable)
            data_out <= data_in;
    end
endmodule

