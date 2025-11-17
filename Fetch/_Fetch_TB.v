`timescale 1ns/1ns

module FetchUnitTB();

// Señales de entrada
reg clk;
reg reset;

// Señales de salida
wire [17:0] instruccion_actual;
wire [7:0] pc_current;

// Instanciar el módulo bajo prueba
FetchUnit DUT (
    .clk(clk),
    .reset(reset),
    .instruccion_actual(instruccion_actual),
    .pc_current(pc_current)
);

// Generador de reloj (periodo 20ns = 50MHz)
always #10 clk = ~clk;

// Proceso de inicialización y estimulación
initial begin
    // Inicializar señales
    clk = 0;
    reset = 1;
    
    $display("==========================================");
    $display("    TESTBENCH FETCH UNIT");
    $display("==========================================");
    $display("Tiempo | PC | Instrucción (bin)");
    $display("------------------------------------------");
    
    // Mantener reset por 3 ciclos de reloj
    #30;
    
    // Liberar reset
    reset = 0;
    $display("Reset liberado en t=%0t", $time);
    $display("------------------------------------------");
    
    // Ejecutar por 20 ciclos más
    #400;
    
    $display("------------------------------------------");
    $display("Simulación completada");
    $display("==========================================");
    $stop;
end

// Monitoreo de señales en cada flanco positivo de reloj
always @(posedge clk) begin
    if (reset) begin
        $display("%6t | %2d | RESET ACTIVO", $time, pc_current);
    end else begin
        $display("%6t | %2d | %b", $time, pc_current, instruccion_actual);
    end
end

// Opcional: Generar archivo VCD para visualización en GTKWave
initial begin
    $dumpfile("fetch_unit.vcd");
    $dumpvars(0, FetchUnitTB);
end

endmodule
