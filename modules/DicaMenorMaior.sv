module DicaMenorMaior (
	input logic ENABLE,
	input logic ENTER,
	input logic [0:3] TENTATIVA,
	input logic [0:3] A,
	input logic [0:2] B,
	input logic ACERTOU_SENHA_A,
	output logic MENOR_OU_MAIOR
);

always_ff @(posedge ENTER) begin
	if (ENABLE) begin
		if (ACERTOU_SENHA_A) begin
			if (TENTATIVA > B) MENOR_OU_MAIOR <= 1;
			else MENOR_OU_MAIOR <= 0;
		end
		else begin
			if (TENTATIVA > A) MENOR_OU_MAIOR <= 1;
			else MENOR_OU_MAIOR <= 0;
		end
	end
end

endmodule