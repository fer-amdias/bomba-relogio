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

logic [1:0] counter;

always_ff @(posedge CLOCK) begin

	if (TEMPO_ACABOU) begin
		counter <= counter + 1;
		
		if (counter == 0) begin
			EXPLOSAO_HEX0[1:0] <= 2'b00;
			EXPLOSAO_HEX1[1:0] <= 2'b00;
			EXPLOSAO_HEX2[1:0] <= 2'b00;
			EXPLOSAO_HEX3[1:0] <= 2'b00;
			EXPLOSAO_HEX4[1:0] <= 2'b00;
			EXPLOSAO_HEX5[1:0] <= 2'b00;
			EXPLOSAO_HEX6[1:0] <= 2'b00;
			EXPLOSAO_HEX7[1:0] <= 2'b00;
			EXPLOSAO_LEDR[0]   <= 1;
			EXPLOSAO_LEDR[4]   <= 1;
			EXPLOSAO_LEDR[8]   <= 1;
			EXPLOSAO_LEDR[12]  <= 1;
			EXPLOSAO_LEDR[16]  <= 1;
			EXPLOSAO_HEX0[6:2] <= 5'b11111;
			EXPLOSAO_HEX1[6:2] <= 5'b11111;
			EXPLOSAO_HEX2[6:2] <= 5'b11111;
			EXPLOSAO_HEX3[6:2] <= 5'b11111;
			EXPLOSAO_HEX4[6:2] <= 5'b11111;
			EXPLOSAO_HEX5[6:2] <= 5'b11111;
			EXPLOSAO_HEX6[6:2] <= 5'b11111;
			EXPLOSAO_HEX7[6:2] <= 5'b11111;
			EXPLOSAO_LEDR[3:1] <= 3'b000;
			EXPLOSAO_LEDR[7:5] <= 3'b000;
			EXPLOSAO_LEDR[11:9]<= 3'b000;
			EXPLOSAO_LEDR[15:13]<= 3'b000;
			EXPLOSAO_LEDR[17]  <= 3'b000;
		end
		else if (counter == 1) begin
			EXPLOSAO_HEX0[3:2] <= 2'b00;
			EXPLOSAO_HEX1[3:2] <= 2'b00;
			EXPLOSAO_HEX2[3:2] <= 2'b00;
			EXPLOSAO_HEX3[3:2] <= 2'b00;
			EXPLOSAO_HEX4[3:2] <= 2'b00;
			EXPLOSAO_HEX5[3:2] <= 2'b00;
			EXPLOSAO_HEX6[3:2] <= 2'b00;
			EXPLOSAO_HEX7[3:2] <= 2'b00;
			EXPLOSAO_LEDR[1]   <= 1;
			EXPLOSAO_LEDR[5]   <= 1;
			EXPLOSAO_LEDR[9]   <= 1;
			EXPLOSAO_LEDR[13]  <= 1;
			EXPLOSAO_LEDR[17]  <= 1;
			EXPLOSAO_HEX0[1:0] <= 2'b11;
			EXPLOSAO_HEX1[1:0] <= 2'b11;
			EXPLOSAO_HEX2[1:0] <= 2'b11;
			EXPLOSAO_HEX3[1:0] <= 2'b11;
			EXPLOSAO_HEX4[1:0] <= 2'b11;
			EXPLOSAO_HEX5[1:0] <= 2'b11;
			EXPLOSAO_HEX6[1:0] <= 2'b11;
			EXPLOSAO_HEX7[1:0] <= 2'b11;
			EXPLOSAO_LEDR[0]   <= 0;
			EXPLOSAO_LEDR[4]   <= 0;
			EXPLOSAO_LEDR[8]   <= 0;
			EXPLOSAO_LEDR[12]  <= 0;
			EXPLOSAO_LEDR[16]  <= 0;
		end
		else if (counter == 2) begin
			EXPLOSAO_HEX0[5:4] <= 2'b00;
			EXPLOSAO_HEX1[5:4] <= 2'b00;
			EXPLOSAO_HEX2[5:4] <= 2'b00;
			EXPLOSAO_HEX3[5:4] <= 2'b00;
			EXPLOSAO_HEX4[5:4] <= 2'b00;
			EXPLOSAO_HEX5[5:4] <= 2'b00;
			EXPLOSAO_HEX6[5:4] <= 2'b00;
			EXPLOSAO_HEX7[5:4] <= 2'b00;
			EXPLOSAO_LEDR[2]   <= 1;
			EXPLOSAO_LEDR[6]   <= 1;
			EXPLOSAO_LEDR[10]  <= 1;
			EXPLOSAO_LEDR[14]  <= 1;
			EXPLOSAO_HEX0[3:2] <= 2'b11;
			EXPLOSAO_HEX1[3:2] <= 2'b11;
			EXPLOSAO_HEX2[3:2] <= 2'b11;
			EXPLOSAO_HEX3[3:2] <= 2'b11;
			EXPLOSAO_HEX4[3:2] <= 2'b11;
			EXPLOSAO_HEX5[3:2] <= 2'b11;
			EXPLOSAO_HEX6[3:2] <= 2'b11;
			EXPLOSAO_HEX7[3:2] <= 2'b11;
			EXPLOSAO_LEDR[1]   <= 0;
			EXPLOSAO_LEDR[5]   <= 0;
			EXPLOSAO_LEDR[9]   <= 0;
			EXPLOSAO_LEDR[13]  <= 0;
			EXPLOSAO_LEDR[17]  <= 0;
		end
		else if (counter == 3) begin
			EXPLOSAO_HEX0[6]   <= 0;
			EXPLOSAO_HEX1[6]   <= 0;
			EXPLOSAO_HEX2[6]   <= 0;
			EXPLOSAO_HEX3[6]   <= 0;
			EXPLOSAO_HEX4[6]   <= 0;
			EXPLOSAO_HEX5[6]   <= 0;
			EXPLOSAO_HEX6[6]   <= 0;
			EXPLOSAO_HEX7[6]   <= 0;
			EXPLOSAO_LEDR[3]   <= 1;
			EXPLOSAO_LEDR[7]   <= 1;
			EXPLOSAO_LEDR[11]  <= 1;
			EXPLOSAO_LEDR[15]  <= 1;
			EXPLOSAO_HEX0[5:4] <= 2'b11;
			EXPLOSAO_HEX1[5:4] <= 2'b11;
			EXPLOSAO_HEX2[5:4] <= 2'b11;
			EXPLOSAO_HEX3[5:4] <= 2'b11;
			EXPLOSAO_HEX4[5:4] <= 2'b11;
			EXPLOSAO_HEX5[5:4] <= 2'b11;
			EXPLOSAO_HEX6[5:4] <= 2'b11;
			EXPLOSAO_HEX7[5:4] <= 2'b11;
			EXPLOSAO_LEDR[2]   <= 0;
			EXPLOSAO_LEDR[6]   <= 0;
			EXPLOSAO_LEDR[10]  <= 0;
			EXPLOSAO_LEDR[14]  <= 0;
		end
	end
end

endmodule
