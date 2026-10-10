//This is for the D latch module.

module d_latch_gatelevel_module (d, en, q, q_bar);
	input d;
	input en; //enable

	output q, q_bar;

	wire not_1_output;
	wire and_1_output, and_2_output;
	wire or_1_output, or_2_output;

	//Fill this out.
	not_gate not_1(.a(d), .out(not_1_output));

	and_gate and_1(.a(not_1_output), .b(en), .out(and_1_output));
  and_gate and_2(.a(d), .b(en), .out(and_2_output));

  or_gate or_2(.a(and_2_output), .b(q), .out(or_2_output));
  not_gate not_3(.a(or_2_output), .out(q_bar));

  or_gate or_1(.a(and_1_output), .b(q_bar), .out(or_1_output));
  not_gate not_2(.a(or_1_output), .out(q));

endmodule
