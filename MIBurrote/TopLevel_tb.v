`timescale 1ns/1ns

module TopLevel_tb;

    reg clk;
    reg reset;
    reg fetch_en1;
    reg fetch_en2;
    
    wire [31:0] pc_current;
    wire [31:0] instruccion_fetch;
    wire [31:0] instruccion_decode;
    wire [31:0] data_out_final;

    TopLevel DUT (
        .clk(clk),
        .reset(reset),
        .fetch_en1(fetch_en1),
        .fetch_en2(fetch_en2),
        .pc_current(pc_current),
        .instruccion_fetch(instruccion_fetch),
        .instruccion_decode(instruccion_decode),
        .data_out_final(data_out_final)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        reset = 1;
        fetch_en1 = 0;
        fetch_en2 = 0;
        
        #30;
        reset = 0;
        
        #40;
        fetch_en1 = 1;
        
        #60;
        fetch_en2 = 1;
        
        #200;
        fetch_en1 = 0;
        
        #100;
        fetch_en1 = 1;
        
        #200;
        $stop;
    end

endmodule

