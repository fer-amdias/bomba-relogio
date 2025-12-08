module LEDRdecoder(
	input logic [3:0]bits,
	output logic [3:0]leds
);

logic [2:0]bits_corretos;

always_comb begin
	bits_corretos = bits[0] + bits[1] + bits[2] + bits[3];
	case (bits_corretos)
		0: leds = 4'b0000;
		1: leds = 4'b0001;
		2: leds = 4'b0011;
		3: leds = 4'b0111;
		4: leds = 4'b1111;
		default: leds = 4'b0000;
	endcase
end
endmodule