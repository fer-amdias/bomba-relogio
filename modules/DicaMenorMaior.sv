module DicaMenorMaior (
	input logic ENABLE,
	input logic ENTER,
	input logic [0:3] TENTATIVA,
	input logic [0:3] A,
	input logic [0:2] B,
	input logic ACERTOU_SENHA_A,
	output logic [0:6] MENOR_OU_MAIOR,
	input logic RESET
);

always_ff @(posedge ENTER, posedge RESET) begin
	if(RESET) begin
	MENOR_OU_MAIOR <= 7'b 1111111;
	end else
	if (ENABLE) begin
		if (ACERTOU_SENHA_A) begin
			if (TENTATIVA[1:3] > B) MENOR_OU_MAIOR <= 7'b1001111;
			else if (TENTATIVA[1:3] == B) MENOR_OU_MAIOR <= 7'b 1111111;
			else MENOR_OU_MAIOR <= 7'b1111001;
		end
		else begin
			if (TENTATIVA > A) MENOR_OU_MAIOR <= 7'b1001111;
			else if (TENTATIVA == A) MENOR_OU_MAIOR <= 7'b 1111111;
			else MENOR_OU_MAIOR <= 7'b1111001;
		end
	end
end

endmodule