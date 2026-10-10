module three_bit_up_down_counter_mealy_module(clk, in, rst, out, state);

	input clk, in, rst;

	output [2:0] out, state;
	reg [2:0] out, state;


	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7;


	always @ (state or in)
	begin
		if (rst == 1'b1)
			out = S0;
		else case (state)
			S0: begin if (in == 1'b1) out = S1; else out = S0; end
			S1: begin if (in == 1'b1) out = S2; else out = S1; end
			S2: begin if (in == 1'b1) out = S3; else out = S2; end
			S3: begin if (in == 1'b1) out = S4; else out = S3; end
			S4: begin if (in == 1'b1) out = S5; else out = S4; end
			S5: begin if (in == 1'b1) out = S6; else out = S5; end
			S6: begin if (in == 1'b1) out = S7; else out = S6; end
			S7: begin if (in == 1'b1) out = S0; else out = S7; end
			default out = S0;
		endcase
	end


	always @ (posedge clk) begin
		if (rst == 1'b1)
			state <= S0;
		else case (state)
			S0: begin if (in == 1'b1) state <= S1; else state <= S7; end
			S1: begin if (in == 1'b1) state <= S2; else state <= S0; end
			S2: begin if (in == 1'b1) state <= S3; else state <= S1; end
			S3: begin if (in == 1'b1) state <= S4; else state <= S2; end
			S4: begin if (in == 1'b1) state <= S5; else state <= S3; end
			S5: begin if (in == 1'b1) state <= S6; else state <= S4; end
			S6: begin if (in == 1'b1) state <= S7; else state <= S5; end
			S7: begin if (in == 1'b1) state <= S0; else state <= S6; end
		endcase
	end

endmodule
