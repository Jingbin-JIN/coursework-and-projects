module eight_bit_register_structural_module(in, clk, rst, out);

	input [7:0] in;
	input clk; //clock
	input rst; //reset

	output [7:0] out;
	wire [7:0] out;
	wire [7:0] rst_out = 8'b11001010;
	wire [7:0] and_out_1, and_out_2;
	wire [7:0] or_out_1;
	wire not_out_1;

not_gate not_1 (.a(rst), .out(not_out_1));

and_gate and_1 (.a(rst), .b(rst_out[0]), .out(and_out_1[0]));
and_gate and_2 (.a(rst), .b(rst_out[1]), .out(and_out_1[1]));
and_gate and_3 (.a(rst), .b(rst_out[2]), .out(and_out_1[2]));
and_gate and_4 (.a(rst), .b(rst_out[3]), .out(and_out_1[3]));
and_gate and_5 (.a(rst), .b(rst_out[4]), .out(and_out_1[4]));
and_gate and_6 (.a(rst), .b(rst_out[5]), .out(and_out_1[5]));
and_gate and_7 (.a(rst), .b(rst_out[6]), .out(and_out_1[6]));
and_gate and_8 (.a(rst), .b(rst_out[7]), .out(and_out_1[7]));

and_gate and_11 (.a(not_out_1), .b(in[0]), .out(and_out_2[0]));
and_gate and_22 (.a(not_out_1), .b(in[1]), .out(and_out_2[1]));
and_gate and_33 (.a(not_out_1), .b(in[2]), .out(and_out_2[2]));
and_gate and_44 (.a(not_out_1), .b(in[3]), .out(and_out_2[3]));
and_gate and_55 (.a(not_out_1), .b(in[4]), .out(and_out_2[4]));
and_gate and_66 (.a(not_out_1), .b(in[5]), .out(and_out_2[5]));
and_gate and_77 (.a(not_out_1), .b(in[6]), .out(and_out_2[6]));
and_gate and_88 (.a(not_out_1), .b(in[7]), .out(and_out_2[7]));

or_gate or_1 (.a(and_out_1[0]), .b(and_out_2[0]), .out(or_out_1[0]));
or_gate or_2 (.a(and_out_1[1]), .b(and_out_2[1]), .out(or_out_1[1]));
or_gate or_3 (.a(and_out_1[2]), .b(and_out_2[2]), .out(or_out_1[2]));
or_gate or_4 (.a(and_out_1[3]), .b(and_out_2[3]), .out(or_out_1[3]));
or_gate or_5 (.a(and_out_1[4]), .b(and_out_2[4]), .out(or_out_1[4]));
or_gate or_6 (.a(and_out_1[5]), .b(and_out_2[5]), .out(or_out_1[5]));
or_gate or_7 (.a(and_out_1[6]), .b(and_out_2[6]), .out(or_out_1[6]));
or_gate or_8 (.a(and_out_1[7]), .b(and_out_2[7]), .out(or_out_1[7]));

one_bit_register_behavioral_module one_bit_reg_1 (.in(or_out_1[0]), .clk(clk), .out(out[0]));
one_bit_register_behavioral_module one_bit_reg_2 (.in(or_out_1[1]), .clk(clk), .out(out[1]));
one_bit_register_behavioral_module one_bit_reg_3 (.in(or_out_1[2]), .clk(clk), .out(out[2]));
one_bit_register_behavioral_module one_bit_reg_4 (.in(or_out_1[3]), .clk(clk), .out(out[3]));
one_bit_register_behavioral_module one_bit_reg_5 (.in(or_out_1[4]), .clk(clk), .out(out[4]));
one_bit_register_behavioral_module one_bit_reg_6 (.in(or_out_1[5]), .clk(clk), .out(out[5]));
one_bit_register_behavioral_module one_bit_reg_7 (.in(or_out_1[6]), .clk(clk), .out(out[6]));
one_bit_register_behavioral_module one_bit_reg_8 (.in(or_out_1[7]), .clk(clk), .out(out[7]));


endmodule
