module DicaParidade (
	input logic ENABLE,
	input logic [0:3] A,
	input logic [0:2] B,
	output logic BIT_PARIDADE
);

assign BIT_PARIDADE = A[3] ^ B[2];

endmodule