`timescale 1ns/1ns

module InstructionDecoder_TB;

    // 1. Señales internas
    reg  [31:0] instr_tb;
    wire [4:0]  op_tb;
    wire [4:0]  op1_tb;
    wire [4:0]  op2_tb;
    wire [4:0]  rd_tb;

    // 2. Instancia del módulo InstructionDecoder
    InstructionDecoder uut (
        .instr(instr_tb),
        .op(op_tb),
        .op1(op1_tb),
        .op2(op2_tb),
        .rd(rd_tb)
    );

    // 3. Bloque inicial para aplicar estímulos
    initial begin
        // Ejemplo 1
        instr_tb = 32'b00001_00010_00011_00100; // op=1, op1=2, op2=3, rd=4
        #10;

        // Ejemplo 2
        instr_tb = 32'b10101_01010_00101_01111; // op=21, op1=10, op2=5, rd=15
        #10;

        // Ejemplo 3
        instr_tb = 32'b11111_11111_11111_11111; // todos máximos
        #10;

        // Ejemplo 4
        instr_tb = 32'b00000_00000_00000_00000; // todos ceros
        #10;

        $stop; // detener simulación
    end

endmodule

