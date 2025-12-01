module ExtensaoDeBitsLEDG (
	input logic LEDG_IN,
	output logic [0:7] LEDG_OUT
);

assign LEDG_OUT = {8{LEDG_IN}}; //faz a extensao de sinal por si so

endmodule