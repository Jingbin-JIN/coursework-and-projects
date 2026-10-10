module jk_flip_flop_structural_module (j, k, clk, q, q_bar);

	input j, k;
	input clk;

	output q, q_bar;

	wire and_1_output, and_2_output;


	and_gate and_1(.a(k), .b(q), .out(and_1_output));
	and_gate and_2(.a(j), .b(q_bar), .out(and_2_output));

	sr_flip_flop_behavioral_module sr_flip_flop_behavioral(.s(and_2_output), .r(and_1_output), .clk(clk), .q(q), .q_bar(q_bar));

endmodule
