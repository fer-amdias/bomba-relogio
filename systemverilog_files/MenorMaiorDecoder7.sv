module MenorMaiorDecoder7 (
	input logic MENOR_OU_MAIOR,
	output logic [6:0] OUT
);

always_comb begin
	if (MENOR_OU_MAIOR)  OUT = 7'b0000110;
	else 						OUT = 7'b0110000;
end
endmodule
