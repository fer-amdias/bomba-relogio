module display7mux2(
	input logic selector,
	input logic [6:0] InputA,
	input logic [6:0] InputB,
	output logic [6:0] Output
);

always_comb begin
	if (selector) Output = InputB;
	else Output = InputA;
end
endmodule
