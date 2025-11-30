module CircuitoAtivo (
	input logic RESET,
	input logic START,
	input logic ACERTOU_SENHA_B,
	output logic ENABLE
);

always_ff @(posedge START, posedge ACERTOU_SENHA_B, posedge RESET) begin
	if (RESET | ACERTOU_SENHA_B) ENABLE <= 1'b0;
	else if (START) ENABLE <= 1'b1;
end

endmodule