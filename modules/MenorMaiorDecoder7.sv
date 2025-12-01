module MenorMaiorDecoder7 (
	input logic MENOR_OU_MAIOR,
	output logic [6:0] OUT
);

always_comb begin
	if (MENOR_OU_MAIOR)  OUT = 7'b1111001;
	else 						OUT = 7'b1001111;
end
endmodule
