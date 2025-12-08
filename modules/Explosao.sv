module Explosao(
	input logic TEMPO_ACABOU,
	input logic CLOCK,
	output logic [6:0] EXPLOSAO_HEX0,
	output logic [6:0] EXPLOSAO_HEX1,
	output logic [6:0] EXPLOSAO_HEX2,
	output logic [6:0] EXPLOSAO_HEX3,
	output logic [6:0] EXPLOSAO_HEX4,
	output logic [6:0] EXPLOSAO_HEX5,
	output logic [6:0] EXPLOSAO_HEX6,
	output logic [6:0] EXPLOSAO_HEX7,
	output logic [17:0] EXPLOSAO_LEDR
);

logic [6:0] counter;
logic [6:0] EXPLOSAO_HEX;
logic EXPLOSAO_LEDR0;
logic EXPLOSAO_LEDR1;
logic EXPLOSAO_LEDR2;
logic EXPLOSAO_LEDR3;

logic counter00;
logic counter01;
logic counter10;
logic counter11;
assign counter00 = ~counter[1] & ~counter[0];
assign counter01 = ~counter[1] & counter[0];
assign counter10 = counter[1] & ~counter[0];
assign counter11 = counter[1] & counter[0];

always_ff @(posedge CLOCK) begin
	if (!TEMPO_ACABOU) counter <= 0;
	casex (counter)
		7'b00xxxxx: begin // por 3.2 segundos
			if (TEMPO_ACABOU) counter <= counter + 1;
			// explosao_hex fica negado pois o display é ativo em 0
			EXPLOSAO_HEX[0] <= ~counter00;
			EXPLOSAO_HEX[1] <= ~counter00;
			EXPLOSAO_HEX[2] <= ~counter01;
			EXPLOSAO_HEX[3] <= ~counter01;
			EXPLOSAO_HEX[4] <= ~counter10;	
			EXPLOSAO_HEX[5] <= ~counter10;
			EXPLOSAO_HEX[6] <= ~counter11;
			
			EXPLOSAO_LEDR0   <= counter00;
			EXPLOSAO_LEDR1   <= counter01;
			EXPLOSAO_LEDR2   <= counter10;
			EXPLOSAO_LEDR3   <= counter11;
		
			EXPLOSAO_HEX0 <= EXPLOSAO_HEX;
			EXPLOSAO_HEX1 <= EXPLOSAO_HEX;
			EXPLOSAO_HEX2 <= EXPLOSAO_HEX;
			EXPLOSAO_HEX3 <= EXPLOSAO_HEX;
			EXPLOSAO_HEX4 <= EXPLOSAO_HEX;
			EXPLOSAO_HEX5 <= EXPLOSAO_HEX;
			EXPLOSAO_HEX6 <= EXPLOSAO_HEX;
			EXPLOSAO_HEX7 <= EXPLOSAO_HEX;
			EXPLOSAO_LEDR[0]   <= EXPLOSAO_LEDR0;
			EXPLOSAO_LEDR[4]   <= EXPLOSAO_LEDR0;
			EXPLOSAO_LEDR[8]   <= EXPLOSAO_LEDR0;
			EXPLOSAO_LEDR[12]  <= EXPLOSAO_LEDR0;
			EXPLOSAO_LEDR[16]  <= EXPLOSAO_LEDR0;
			EXPLOSAO_LEDR[1]   <= EXPLOSAO_LEDR1;
			EXPLOSAO_LEDR[5]   <= EXPLOSAO_LEDR1;
			EXPLOSAO_LEDR[9]   <= EXPLOSAO_LEDR1;
			EXPLOSAO_LEDR[13]  <= EXPLOSAO_LEDR1;
			EXPLOSAO_LEDR[17]  <= EXPLOSAO_LEDR1;
			EXPLOSAO_LEDR[2]   <= EXPLOSAO_LEDR2;
			EXPLOSAO_LEDR[6]   <= EXPLOSAO_LEDR2;
			EXPLOSAO_LEDR[10]  <= EXPLOSAO_LEDR2;
			EXPLOSAO_LEDR[14]  <= EXPLOSAO_LEDR2;
			EXPLOSAO_LEDR[3]   <= EXPLOSAO_LEDR3;
			EXPLOSAO_LEDR[7]   <= EXPLOSAO_LEDR3;
			EXPLOSAO_LEDR[11]  <= EXPLOSAO_LEDR3;
			EXPLOSAO_LEDR[15]  <= EXPLOSAO_LEDR3;
		end
		7'b1xxxxxx: begin // pra sempre (ele nao conta a partir daqui)
			EXPLOSAO_HEX4 <= 7'b1000001; // u
			EXPLOSAO_HEX3 <= 7'b0100001; // d
			EXPLOSAO_HEX2 <= 7'b1111001; // i
			EXPLOSAO_HEX1 <= 7'b0000110; // e
			EXPLOSAO_HEX0 <= 7'b0100001; // d
		end
		default:  begin // por 3.2 segundos
			if (TEMPO_ACABOU) counter <= counter + 1;
			EXPLOSAO_HEX0 <= 7'b1111111;
			EXPLOSAO_HEX1 <= 7'b1111111;
			EXPLOSAO_HEX2 <= 7'b1111111;
			EXPLOSAO_HEX3 <= 7'b1111111;
			EXPLOSAO_HEX4 <= 7'b1111111;
			EXPLOSAO_HEX5 <= 7'b1111111;
			EXPLOSAO_HEX6 <= 7'b1111111;
			EXPLOSAO_HEX7 <= 7'b1111111;
			EXPLOSAO_LEDR <= 0;
		end
		endcase
end

endmodule
