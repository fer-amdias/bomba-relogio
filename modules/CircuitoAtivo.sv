module CircuitoAtivo (
	input logic RESET,
	input logic START,
	input logic ACERTOU_SENHA_B,
	output logic ENABLE
);

initial ENABLE = 0;

always_ff @(posedge START, posedge ACERTOU_SENHA_B, posedge RESET) begin
	if (START) ENABLE <= 1'b1;
	else if (RESET || ACERTOU_SENHA_B) ENABLE <= 1'b0;
end

endmodule