// $Id: $
// File name:   tb_decode.sv
// Created:     2/21/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Decoder Block
`timescale 1ns / 100ps
module tb_decode();

	localparam CLK_PERIOD=2.5;
	reg tb_clk;

	
	//CLOCK DIVIDER
	always
	begin
		tb_clk=1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk=1'b1;
		#(CLK_PERIOD/2.0);
	end

	//Test Bench Signals
	reg tb_n_rst,tb_d_plus,tb_shift_enable,tb_eop,tb_d_orig;

	//DUT PORT MAP

	decode DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .shift_enable(tb_shift_enable), .eop(tb_eop), .d_orig(tb_d_orig));

	//Declare variable testcase counter
	integer testcase;

	//Test Bench Process
	initial
	begin

		//Test Case 1 check reset
		testcase=1;
		tb_d_plus=1'b1;
		tb_shift_enable=1'b1;
		tb_eop=1'b0;
		tb_n_rst=1'b0;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_orig == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);
		
		//Test Case 2 different D+ without eop
		testcase=2;
		tb_d_plus=1'b0;
		tb_shift_enable=1'b1;
		tb_eop=1'b0;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_orig == 1'b0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);



		//Test Case 3 different D+ without eop
		testcase=3;
		tb_d_plus=1'b1;
		tb_shift_enable=1'b1;
		tb_eop=1'b0;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_orig == 1'b0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);


		//Test Case 4 - Same D+ without eop
		testcase=4;
		tb_d_plus=1'b1;
		tb_shift_enable=1'b1;
		tb_eop=1'b0;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_orig == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);



		//Test Case 5 - Same D+ with reset
		testcase=5;
		tb_d_plus=1'b1;
		tb_shift_enable=1'b1;
		tb_eop=1'b0;
		tb_n_rst=1'b0;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_orig == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);

		//Test Case 6 - Different D+ with eop
		testcase=6;
		tb_d_plus=1'b0;
		tb_shift_enable=1'b1;
		tb_eop=1'b1;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_orig == 1'b0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);


		//Test Case 7 - Different D+ with eop without shift enable
		testcase=7;
		tb_d_plus=1'b1;
		tb_shift_enable=1'b0;
		tb_eop=1'b0;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_orig == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);

		
	end
		

endmodule
