`timescale 1ns/1ns

module Quesadilla_tb;

reg clk;
reg reset;
wire [31:0] pc_current;
wire [31:0] pc_next;
wire [31:0] instruccion_actual;


Quesadilla DUT (
    .clk(clk),
    .reset(reset),
    .pc_current(pc_current),
    .pc_next(pc_next),
    .instruccion_actual(instruccion_actual)
);


initial clk = 0;
always #10 clk = ~clk;


initial begin

    reset = 1;
    #30;
    reset = 0;

    #240;
    $stop;
end

endmodule

