module Comparacao (
	input logic [0:3] A,
	input logic [0:2] B,
	input logic [0:3] TENTATIVA,
	input logic ENABLE,
	input logic ENTER,
	output logic ACERTOU_SENHA_A,
	output logic ACERTOU_SENHA_B
);


always_ff @(posedge ENTER) begin
	if (ENABLE) begin
		if (!ACERTOU_SENHA_A)
			if (TENTATIVA == A) ACERTOU_SENHA_A <= 1; 
		else
			if (TENTATIVA[0:2] == B) ACERTOU_SENHA_B <= 1;
	end
end

endmodule