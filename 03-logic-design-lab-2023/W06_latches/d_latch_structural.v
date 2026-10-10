//This is for the D latch module.

module d_latch_sturctural_module (d, en, q, q_bar);
	input d;
	input en; //enable

	output q, q_bar;

	wire not_1_output;

	//Fill this out.
	wire and_1_output, and_2_output;

  not_gate not_1(.a(d), .out(out_1_output));
  and_gate and_1(.a(d), .b(en), .out(and_1_output));
  and_gate and_2(.a(not_1_output), .b(en), .out(and_2_output));
  sr_latch_gatelevel_module sr_latch_gatelevel(.s(and_1_output), .r(and_2_output), .q(q), .q_bar(q_bar));

endmodule
