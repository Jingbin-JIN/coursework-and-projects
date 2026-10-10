module t_flip_flop_behavioral_module (t, clk, q, q_bar);

	input t;
	input clk;

	output q, q_bar;

	reg q, q_bar;

	always@(posedge clk)

	begin

		case({t,q})
			2'b00: begin q <= 1'b0; q_bar <= 1'b1; end
			2'b01: begin q <= 1'b1; q_bar <= 1'b0; end
			2'b10: begin q <= 1'b1; q_bar <= 1'b0; end
			2'b11: begin q <= 1'b0; q_bar <= 1'b1; end
			default: begin q <= 1'b1; q_bar <= 1'b0; end
		endcase

	end

endmodule
