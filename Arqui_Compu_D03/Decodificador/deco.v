`timescale 1ns/1ns
//1.Declaracion del Modulo y I/O
module taquito(
	input[3:0]sabor,
	output reg [7:0]B
);
//2. Declaracion de componentes internos (wire , reg)
reg [7:0]Chicharon=8'd67;
reg [7:0]Papa=8'd80;
reg [7:0]Frijol=8'd70;
reg [7:0]Deshebrada=8'd68;
//3.Cuerpo del Modulo,assigns,initials,always
always @*
begin
	case (sabor)

		4'b0001:
			begin
				B=Chicharon;
			end
		4'b0010:
			begin
				B=Papa;
			end
		4'b0100:
			begin
				B=Frijol;
			end
		4'b1000:
			begin
				B=Deshebrada;
			end
			default:
			begin
			B= 8'dx; 
			end
	endcase
		
end

endmodule

