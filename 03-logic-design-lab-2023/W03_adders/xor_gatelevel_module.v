module xor_gatelevel_gate (a, b, out);

	input a, b;

	output out;

	wire and_out1;
	wire and_out2;
	wire not_out1;
	wire not_out2;

	not_gate not_1 (.a(a), .out(not_out1));
	not_gate not_2 (.a(b), .out(not_out2));
	and_gate and_1 (.a(a), .b(not_out2), .out(and_out1));
	and_gate and_2 (.a(not_out1), .b(b), .out(and_out2));
	or_gate or_1 (.a(and_out1), .b(and_out2), .out(out));




endmodule
