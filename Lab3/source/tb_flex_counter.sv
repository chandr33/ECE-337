// $Id: $
// File name:   tb_flex_counter.sv
// Created:     2/2/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Flex Counter

`timescale 1ns / 100ps

module tb_flex_counter();

	localparam CLK_PERIOD=2.5;
	reg tb_clk;

	//Clock generation block
	always
	begin
		tb_clk=1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk=1'b1;
		#(CLK_PERIOD/2.0);
	end

	localparam CHECK_DELAY=1;//checks for 1 ns propagation delay
	localparam NUM_CNT_BITS=4;
	//Declare DUT port map signals

	reg tb_n_rst,tb_count_enable,tb_clear;
	reg [NUM_CNT_BITS-1:0] tb_rollover_val;
	reg [NUM_CNT_BITS-1:0] tb_count_out;
	reg tb_rollover_flag;

	//reg tb_expected_output;

	flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));

	//Test Bench Process

	initial 
	begin
		@(posedge tb_clk);
		tb_n_rst=0;
		@(posedge tb_clk);
		tb_n_rst=1;

		//TestCase 1 - clear the values

		tb_rollover_val=4'b0100;
		tb_count_enable=1'b0;
		tb_clear=1;
		#(CLK_PERIOD);
		tb_clear=0;
		#(1);
		if((tb_count_out == 0) && (tb_rollover_flag == 0))
			$info("Test Case 1 passed");
		else
			$error("Test Case 1 failed");

		
		//TestCase 2 -  count till 3

		@(posedge tb_clk);
		tb_clear=1;
		@(posedge tb_clk);
		tb_clear=0;

		tb_n_rst=1;
		tb_rollover_val=3;

		tb_count_enable=1'b1;

		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		if((tb_count_out == tb_rollover_val) && (tb_rollover_flag == 1 ))
			$info("Test Case 2 passed");
		else
			$error("Test Case 2 failed");

		#1;
		//Test case 3- Count Enable disable

		@(posedge tb_clk);
		tb_clear=1;
		@(posedge tb_clk);
		tb_clear=0;

		tb_n_rst=1;

		tb_rollover_val=3;
		tb_count_enable=0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		if((tb_count_out==0) && (tb_rollover_flag == 0))
			$info("Test Case 3 passed");
		else
			$error("Test Case 3 failed");

		#1;

		//Test Case 4 - Count till 5
		
		@(posedge tb_clk);
		tb_clear=1;
		@(posedge tb_clk);
		tb_clear=0;

		tb_n_rst=1;
		tb_rollover_val=6;

		tb_count_enable=1'b1;

		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		if((tb_count_out == tb_rollover_val) && (tb_rollover_flag ==1 ))
			$info("Test Case 4 passed");
		else
			$error("Test Case 4 failed");

		#1;

		//Test case 5 - Count till 3 and then clear

		@(posedge tb_clk);
		tb_clear=1;
		@(posedge tb_clk);
		tb_clear=0;

		tb_n_rst=1;
		tb_rollover_val=3;

		tb_count_enable=1'b1;

		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_n_rst=0;
		@(posedge tb_clk);
		if((tb_count_out == 0) && (tb_rollover_flag == 0 ))
			$info("Test Case 5 passed");
		else
			$error("Test Case 5 failed");

	end

endmodule

		


