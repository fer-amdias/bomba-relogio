module DicaBitsCorretos (
	input logic ENABLE,
	input logic [3:0] TENTATIVA,
	input logic [3:0] A,
	input logic [2:0] B,
	input logic ENTER,
	input logic ACERTOU_SENHA_A,
	output logic [0:3] LEDR,
	input logic RESET
);

logic [2:0] bits_corretos;

always_ff @(posedge ENTER, posedge RESET) begin
		if(RESET) bits_corretos <= 0;
		else
		if (!ACERTOU_SENHA_A) begin
			bits_corretos[2:0] <= (~(TENTATIVA[0] ^ A[0])) + (~(TENTATIVA[1] ^ A[1])) + (~(TENTATIVA[2] ^ A[2])) + (~(TENTATIVA[3] ^ A[3]));
		end
		else begin
			bits_corretos[2:0] <= (~(TENTATIVA[0] ^ B[0])) + (~(TENTATIVA[1] ^ B[1])) + (~(TENTATIVA[2] ^ B[2]));
	end
end

always_comb begin
	if (!ENABLE) begin 
		LEDR = 4'b0000;
	end else 
	case (bits_corretos)
				3'b 000: LEDR = 4'b0000;
				3'b 001: LEDR = 4'b0001;
				3'b 010: LEDR = 4'b0011;
				3'b 011: LEDR = 4'b0111;
				3'b 100: LEDR = 4'b1111;
				default: LEDR = 4'b1111;
	endcase
end

endmodule