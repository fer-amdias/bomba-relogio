module ledr18mux2(
	input logic selector,
	input logic [17:0] InputA,
	input logic [17:0] InputB,
	output logic [17:0] Output
);

always_comb begin
	if (selector) Output = InputB;
	else Output = InputA;
end
endmodule
