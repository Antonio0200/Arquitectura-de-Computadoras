`timescale 1ns/1ns
module ALU4_REQ_TB();

    reg [3:0] A_tb, B_tb;
    reg [2:0] sel_tb;
    wire [3:0] C_tb;

    ALU4_REQ DUV (
        .A(A_tb),
        .B(B_tb),
        .sel(sel_tb),
        .C(C_tb)
    );

    initial begin
        // Suma
        A_tb = 4'd8; 
        B_tb = 4'd6; 
        sel_tb = 3'b000; //  C=14 (1110)
        #100;
        
        // Resta
        A_tb = 4'd9; 
        B_tb = 4'd3; 
        sel_tb = 3'b001; // C=6
        #100;
        
        // AND
        A_tb = 4'b1100; 
        B_tb = 4'b1010; 
        sel_tb = 3'b010; // C=1000
        #100;
        
        // OR
        A_tb = 4'b1100; 
        B_tb = 4'b1010; 
        sel_tb = 3'b011; // C=1110
        #100;
        
        // XOR
        A_tb = 4'b1100; 
        B_tb = 4'b1010; 
        sel_tb = 3'b100; // C=0110
        #100;
        
        // SHL
        A_tb = 4'b0101; 
        B_tb = 4'b0000; 
        sel_tb = 3'b101; // C=1010
        #100;
        
        // SHR
        A_tb = 4'b1001; 
        B_tb = 4'b0000; 
        sel_tb = 3'b110; // C=0100
        #100;
        
        // Comparacion: EQ
        A_tb = 4'd5; 
        B_tb = 4'd5; 
        sel_tb = 3'b111; // C=0010 (EQ)
        #100;
        
        // Comparacion: GT
        A_tb = 4'd7; 
        B_tb = 4'd3; 
        sel_tb = 3'b111; // C=0001 (GT)
        #100;
        
        // Comparacion: LT
        A_tb = 4'd2; 
        B_tb = 4'd9; 
        sel_tb = 3'b111; // C=0000 (LT)
        #100;

        $stop;
    end

endmodule
