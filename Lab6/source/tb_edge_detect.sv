// $Id: $
// File name:   tb_edge_detect.sv
// Created:     2/21/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Edge Dectector
`timescale 1ns / 100ps
module tb_edge_detect();

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
	reg tb_n_rst,tb_d_plus,tb_d_edge;

	//DUT PORT MAP

	edge_detect DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .d_edge(tb_d_edge));

	//Declare variable testcase counter
	integer testcase;

	//Test Bench Process
	initial
	begin

		//Test Case 1 check reset
		//@(negedge tb_clk);
		//#(CLK_PERIOD);
		//@(posedge tb_clk);
		testcase=1;
		tb_d_plus=1'b1;
		tb_n_rst=1'b0;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_edge == 1'b0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);
		

		//#(CLK_PERIOD);
		//@(posedge tb_clk);
		//Test Case 2 falling edge
		testcase=2;
		tb_d_plus=1'b0;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_edge == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);


		//#(CLK_PERIOD);
		//@(posedge tb_clk);
		//Test Case 3 rising edge
		testcase=3;
		tb_d_plus=1'b1;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_edge == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);



		//#(CLK_PERIOD);
		//@(posedge tb_clk);
		//Test Case 4 - No change
		testcase=4;
		tb_d_plus=1'b1;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_edge == 1'b0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);

		//#(CLK_PERIOD);
		//@(posedge tb_clk);
		//Test Case 5 - falling edge with reset
		testcase=5;
		tb_d_plus=1'b0;
		tb_n_rst=1'b0;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_d_edge == 1'b0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);
	end
		

endmodule
