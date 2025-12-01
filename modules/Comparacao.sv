module Comparacao (
	input logic RESET,
	input logic [0:3] A,
	input logic [0:2] B,
	input logic [0:3] TENTATIVA,
	input logic ENABLE,
	input logic ENTER,
	
	output logic ACERTOU_SENHA_A,
	output logic ACERTOU_SENHA_B
);

always_ff @(posedge ENTER, posedge RESET) begin
	if (RESET) begin
		ACERTOU_SENHA_A <= 0;
		ACERTOU_SENHA_B <= 0;
	end
	else if (ENABLE) begin
		if (!ACERTOU_SENHA_A) begin
			if (TENTATIVA == A) ACERTOU_SENHA_A <= 1; 
		end
		else begin
			if (TENTATIVA[1:3] == B) ACERTOU_SENHA_B <= 1;
		end
	end
end

endmodule