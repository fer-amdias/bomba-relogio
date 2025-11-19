module CircuitoAtivo (
	input logic START,
	input logic ACERTOU_SENHA_B,
	output logic ENABLE
);

always_ff @(posedge START, posedge ACERTOU_SENHA_B) begin
	ENABLE <= ~ACERTOU_SENHA_B;
end

endmodule