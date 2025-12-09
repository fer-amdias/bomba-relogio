module DicaParidade (
	input logic ENABLE,
	input logic [0:3] A,
	input logic [0:2] B,
	output logic BIT_PARIDADE
);

assign BIT_PARIDADE = A[0] ^ A[1] ^ A[2] ^ A[3] ^ B[0] ^ B[1] ^ B[2];

endmodule