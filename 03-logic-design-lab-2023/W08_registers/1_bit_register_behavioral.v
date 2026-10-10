//This is a 1-bit register module without reset

module one_bit_register_behavioral_module(in, clk, out);

	input in;
	input clk; //clock

	output out;
	reg out;

	always@(posedge clk)
	begin
		out <= in;
	end


endmodule
