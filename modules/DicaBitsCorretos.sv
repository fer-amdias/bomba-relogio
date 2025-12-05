module DicaBitsCorretos (
	input logic ENABLE,
	input logic [3:0] TENTATIVA,
	input logic [3:0] A,
	input logic [2:0] B,
	input logic ENTER,
	input logic ACERTOU_SENHA_A,
	output logic [0:3] LEDR
);

logic [1:0] bits_corretos;

always_ff @(posedge ENTER) begin
	if (!ENABLE) begin 
		LEDR <= 4'b0000;
	end
	else begin
		if (!ACERTOU_SENHA_A) begin
			bits_corretos <= (~(TENTATIVA[0] ^ A[0])) + (~(TENTATIVA[1] ^ A[1])) + (~(TENTATIVA[2] ^ A[2])) + (~(TENTATIVA[3] ^ A[3]));
		end
		else begin
			bits_corretos <= (~(TENTATIVA[0] ^ B[0])) + (~(TENTATIVA[1] ^ B[1])) + (~(TENTATIVA[2] ^ B[2]));
		end
		
		case (bits_corretos)
			0: LEDR <= 4'b0000;
			1: LEDR <= 4'b0001;
			2: LEDR <= 4'b0011;
			3: LEDR <= 4'b0111;
			4: LEDR <= 4'b1111;
			default: LEDR <= 4'b1111;
		endcase
	end
end

endmodule