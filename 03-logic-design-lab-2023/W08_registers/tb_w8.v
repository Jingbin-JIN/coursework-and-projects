`timescale 1ns/1ns

module tb_w8;

	//clock
	reg CLK;

	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//1-bit register
	//input
	reg IN_1_BIT_REGISTER;
	reg RESET_1_BIT_REGISTER;

	//output
	wire OUT_1_BIT_REGISTER;
	wire OUT_2_BIT_REGISTER;
	wire OUT_3_BIT_REGISTER;
	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//8-bit register
	//input
	reg [7:0] IN_8_BIT_REGISTER;
	reg RESET_8_BIT_REGISTER;

	//output
	wire [7:0] OUT_8_BIT_REGISTER_B; //behavioral modeling
	wire [7:0] OUT_8_BIT_REGISTER_S; //structural modeling


	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//8-bit shift register
	//input
	reg SHIFT_IN_8_BIT_SHIFT_REGISTER;
	reg RESET_8_BIT_SHIFT_REGISTER;

	//output
	wire [7:0] OUT_8_BIT_SHIFT_REGISTER_B, OUT_8_BIT_SHIFT_REGISTER_B2, OUT_8_BIT_SHIFT_REGISTER_B3; //behavioral modeling
	wire [7:0] OUT_8_BIT_SHIFT_REGISTER_S; //structural modeling


	//Module instantiation
	//1-bit register
	one_bit_register_behavioral_module one_bit_register_behavioral(.in(IN_1_BIT_REGISTER), .clk(CLK), .out(OUT_1_BIT_REGISTER));
  one_bit_register_behavioral_module one_bit_register_behavioral1(.in(RESET_8_BIT_SHIFT_REGISTER), .clk(CLK), .out(OUT_2_BIT_REGISTER));
  one_bit_register_behavioral_module one_bit_register_behavioral2(.in(RESET_8_BIT_REGISTER), .clk(CLK), .out(OUT_3_BIT_REGISTER));

	//8-bit register
	eight_bit_register_behavioral_module eight_bit_register_behavioral(.in(IN_8_BIT_REGISTER), .clk(CLK), .rst(RESET_8_BIT_REGISTER), .out(OUT_8_BIT_REGISTER_B));
	eight_bit_register_structural_module eight_bit_register_structural(.in(IN_8_BIT_REGISTER), .clk(CLK), .rst(OUT_3_BIT_REGISTER), .out(OUT_8_BIT_REGISTER_S));
	//Fill this out

	//8-bit shift register
	eight_bit_shift_register_behavioral_module eight_bit_shift_register_behavioral(.shift_in(SHIFT_IN_8_BIT_SHIFT_REGISTER), .clk(CLK), .rst(RESET_8_BIT_SHIFT_REGISTER), .out(OUT_8_BIT_SHIFT_REGISTER_B));
	eight_bit_shift_register_behavioral2_module eight_bit_shift_register_behavioral2(.shift_in(SHIFT_IN_8_BIT_SHIFT_REGISTER), .clk(CLK), .rst(RESET_8_BIT_SHIFT_REGISTER), .out(OUT_8_BIT_SHIFT_REGISTER_B2));
	eight_bit_shift_register_behavioral3_module eight_bit_shift_register_behavioral3(.shift_in(SHIFT_IN_8_BIT_SHIFT_REGISTER), .clk(CLK), .rst(RESET_8_BIT_SHIFT_REGISTER), .out(OUT_8_BIT_SHIFT_REGISTER_B3));
	eight_bit_shift_register_structural_module eight_bit_shift_register_structural(.shift_in(SHIFT_IN_8_BIT_SHIFT_REGISTER), .clk(CLK), .rst(OUT_2_BIT_REGISTER), .out(OUT_8_BIT_SHIFT_REGISTER_S));
	//Fill this out

	initial
	begin
		 CLK = 1'b0;
	     RESET_1_BIT_REGISTER = 1'b1;
		 RESET_8_BIT_REGISTER = 1'b1;
		 RESET_8_BIT_SHIFT_REGISTER = 1'b1;
	end

	//clock
	initial
	begin
		 forever
		 begin
			#10 CLK = !CLK;
		 end
	end

	initial
	begin
		//test pattern for 1-bit register
		#20 RESET_1_BIT_REGISTER = 1'b1; IN_1_BIT_REGISTER = 1'b1;
		#20 RESET_1_BIT_REGISTER = 1'b1; IN_1_BIT_REGISTER = 1'b0;
		#20 RESET_1_BIT_REGISTER = 1'b0; IN_1_BIT_REGISTER = 1'b1;
		#20 RESET_1_BIT_REGISTER = 1'b0; IN_1_BIT_REGISTER = 1'b0;

		//test pattern for 8-bit register
		//Fill this out
		#15 RESET_8_BIT_REGISTER = 1'b1; IN_8_BIT_REGISTER = 8'b00110100;

		#10 RESET_8_BIT_REGISTER = 1'b1; IN_8_BIT_REGISTER = 8'b01110111;

		#25 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b01111001;

		#15 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b00011000;

		#25 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b00101111;

		#20 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b10010010;

		#25 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b01111011;

		#25 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b11000100;

		#15 RESET_8_BIT_REGISTER = 1'b1; IN_8_BIT_REGISTER = 8'b11011100;

		#10 RESET_8_BIT_REGISTER = 1'b1; IN_8_BIT_REGISTER = 8'b01001110;

		#25 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b00000011;

		#20 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b00011110;

		#25 RESET_8_BIT_REGISTER = 1'b1; IN_8_BIT_REGISTER = 8'b11010001;

		#10 RESET_8_BIT_REGISTER = 1'b1; IN_8_BIT_REGISTER = 8'b11011110;

		#25 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b10000011;

		#20 RESET_8_BIT_REGISTER = 1'b0; IN_8_BIT_REGISTER = 8'b11100111;

		//test pattern for 8-bit shift register
		//Fill this out
		#15 RESET_8_BIT_SHIFT_REGISTER = 1'b1; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#10 RESET_8_BIT_SHIFT_REGISTER = 1'b1; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#25 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#15 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#25 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#20 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b1;

		#25 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#25 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b1;

		#15 RESET_8_BIT_SHIFT_REGISTER = 1'b1; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b1;

		#10 RESET_8_BIT_SHIFT_REGISTER = 1'b1; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#25 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#20 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b0;

		#25 RESET_8_BIT_SHIFT_REGISTER = 1'b1; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b1;

		#10 RESET_8_BIT_SHIFT_REGISTER = 1'b1; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b1;

		#25 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b1;

		#20 RESET_8_BIT_SHIFT_REGISTER = 1'b0; SHIFT_IN_8_BIT_SHIFT_REGISTER = 1'b1;



	end


endmodule
