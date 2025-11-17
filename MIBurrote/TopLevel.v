`timescale 1ns/1ns

module TopLevel(
    input wire clk,
    input wire reset,
    input wire fetch_en1,
    input wire fetch_en2,
    output wire [31:0] pc_current,
    output wire [31:0] instruccion_fetch,
    output wire [31:0] instruccion_decode,
    output wire [31:0] data_out_final
);

    wire [31:0] instr_quesadilla;
    wire [31:0] instr_buffered;
    wire [31:0] pc_next_unused;

    Quesadilla quesadilla_inst (
        .clk(clk),
        .reset(reset),
        .pc_current(pc_current),
        .pc_next(pc_next_unused),
        .instruccion_actual(instr_quesadilla)
    );

    assign instruccion_fetch = instr_quesadilla;

    Buffer_1 buffer1_inst (
        .clk(clk),
        .enable(fetch_en1),
        .data_in(instr_quesadilla),
        .data_out(instr_buffered)
    );

    assign instruccion_decode = instr_buffered;

    wire [31:0] burrito_output;
    assign burrito_output = instr_buffered;

    Buffer_2 buffer2_inst (
        .clk(clk),
        .enable(fetch_en2),
        .data_in(burrito_output),
        .data_out(data_out_final)
    );

endmodule

