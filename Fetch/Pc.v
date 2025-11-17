`timescale 1ns/1ns
module ProgramCounter(
    input clk,
    input reset,
    input [7:0] next_addr,
    output reg [7:0] current_addr
);

always @(posedge clk or posedge reset) begin
    if (reset)
        current_addr <= 8'b0;
    else
        current_addr <= next_addr;
end

endmodule