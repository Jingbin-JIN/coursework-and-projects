`timescale 1ns/1ns

module tb_w10;

	//clock
	reg CLK;

	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Moore Machine example
	//input
	reg RESET_MOORE_EXAMPLE;
	reg IN_MOORE_EXAMPLE;


	//output
	wire [1:0] OUT_MOORE_EXAMPLE;
	wire [1:0] STATE_MOORE_EXAMPLE;
	wire [1:0] NEXT_STATE_MOORE_EXAMPLE;

	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Mealy Machine example
	//input
	reg RESET_MEALY_EXAMPLE;
	reg IN_MEALY_EXAMPLE;


	//output
	wire [1:0] OUT_MEALY_EXAMPLE;
	wire [1:0] STATE_MEALY_EXAMPLE;


	//////////////////////////////////
	//////////////////////////////////
	//////////////////////////////////
	//Counter (Homework)
	//Fill this out.
  //3bit Updonw Counter Moore
	//input
	reg RESET_3_BIT_UP_DOWN_MOORE;
	reg IN_3_BIT_UP_DOWN_MOORE;

	//output
	wire [2:0] OUT_3_BIT_UP_DOWN_MOORE;
	wire [2:0] STATE_3_BIT_UP_DOWN_MOORE;
	wire [2:0] NEXT_STATE_3_BIT_UP_DOWN_MOORE;

	//3bit Updonw Counter Mealy
	//input
	reg RESET_3_BIT_UP_DOWN_MEALY;
	reg IN_3_BIT_UP_DOWN_MEALY;

	//output
	wire [2:0] OUT_3_BIT_UP_DOWN_MEALY;
	wire [2:0] STATE_3_BIT_UP_DOWN_MEALY;

	//Module instantiation
	//Moore Machine example
	moore_machine_module moore_machine_example(.clk(CLK), .in(IN_MOORE_EXAMPLE), .rst(RESET_MOORE_EXAMPLE), .out(OUT_MOORE_EXAMPLE), .state(STATE_MOORE_EXAMPLE), .next_state(NEXT_STATE_MOORE_EXAMPLE));

	//Mealy Machine example
	mealy_machine_module mealy_machine_example(.clk(CLK), .in(IN_MEALY_EXAMPLE), .rst(RESET_MEALY_EXAMPLE), .out(OUT_MEALY_EXAMPLE), .state(STATE_MEALY_EXAMPLE));

	//Counter (Homework)
	//Fill this out.
	//3bit Updonw Counter Moore
	three_bit_up_down_counter_moore_module three_bit_up_down_counter_moore(
	.clk(CLK), .in(IN_3_BIT_UP_DOWN_MOORE), .rst(RESET_3_BIT_UP_DOWN_MOORE),
	.out(OUT_3_BIT_UP_DOWN_MOORE), .state(STATE_3_BIT_UP_DOWN_MOORE), .next_state(NEXT_STATE_3_BIT_UP_DOWN_MOORE));

	//3bit Updonw Counter Mealy
	three_bit_up_down_counter_mealy_module three_bit_up_down_counter_mealy(
	.clk(CLK), .in(IN_3_BIT_UP_DOWN_MEALY), .rst(RESET_3_BIT_UP_DOWN_MEALY),
	.out(OUT_3_BIT_UP_DOWN_MEALY), .state(STATE_3_BIT_UP_DOWN_MEALY));

	initial
	begin
		 CLK = 1'b0;
	     RESET_MOORE_EXAMPLE = 1'b1;
		 IN_MOORE_EXAMPLE  = 1'b0;
		 RESET_MEALY_EXAMPLE = 1'b1;
		 IN_MEALY_EXAMPLE  = 1'b0;
		 //Counter (Homework)
		 //Fill this out.
	  RESET_3_BIT_UP_DOWN_MOORE = 1'b1;
		IN_3_BIT_UP_DOWN_MOORE = 1'b1;
		RESET_3_BIT_UP_DOWN_MEALY = 1'b1;
		IN_3_BIT_UP_DOWN_MEALY = 1'b1;
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
		//test patterns
		//Create a test pattern for the counter properly

		#20 RESET_MOORE_EXAMPLE = 1'b0;
			IN_MOORE_EXAMPLE  = 1'b1;
			RESET_MEALY_EXAMPLE = 1'b0;
			IN_MEALY_EXAMPLE  = 1'b1;

		#100 IN_MEALY_EXAMPLE  = 1'b0;
			RESET_MOORE_EXAMPLE = 1'b1;

		#20 RESET_3_BIT_UP_DOWN_MOORE = 1'b0;
			IN_3_BIT_UP_DOWN_MOORE = 1'b1;
			RESET_3_BIT_UP_DOWN_MEALY = 1'b0;
			IN_3_BIT_UP_DOWN_MEALY = 1'b1;

		#200 IN_3_BIT_UP_DOWN_MOORE = 1'b0;
			IN_3_BIT_UP_DOWN_MEALY = 1'b0;

		#200 RESET_3_BIT_UP_DOWN_MOORE = 1'b1;
			RESET_3_BIT_UP_DOWN_MEALY = 1'b1;
	end


endmodule
