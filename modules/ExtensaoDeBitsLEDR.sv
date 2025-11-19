module ExtensaoDeBitsLEDR (
	input logic [0:3] LEDR_IN,
	output logic [0:17] LEDR_OUT
);

assign LEDR_OUT = LEDR_IN; //faz a extensao de sinal por si so

endmodule