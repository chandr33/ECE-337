// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/21/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Test Bench for EOP Detector
`timescale 1ns / 100ps
module tb_eop_detect();

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
	reg tb_n_rst,tb_d_plus,tb_d_minus,tb_eop;

	//DUT PORT MAP

	eop_detect DUT(.d_plus(tb_d_plus), .d_minus(tb_d_minus), .eop(tb_eop));

	//Declare variable testcase counter
	integer testcase;

	//Test Bench Process
	initial
	begin

		//Test Case 1 - D+=0 D-=0
		//@(negedge tb_clk);
		testcase=1;
		tb_d_plus=1'b0;
		tb_d_minus=1'b0;
		#(1);
		assert(tb_eop == 1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);
		

		#(1);
		//Test Case 2 - D+=0 D-=1
		testcase=2;
		tb_d_plus=1'b0;
		tb_d_minus=1'b1;
		#(1);
		assert(tb_eop == 0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);


		#(1);
		//Test Case 3 - D+=1 D-=0
		testcase=3;
		tb_d_plus=1'b1;
		tb_d_minus=1'b0;
		#(1);
		assert(tb_eop == 0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);



		#(1);
		//Test Case 4 - D+=1 D-=1
		testcase=4;
		tb_d_plus=1'b1;
		tb_d_minus=1'b1;
		#(1);
		assert(tb_eop == 0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);

		#(1);

		//Test Case 5 - D+=1 D-=1
		testcase=5;
		tb_d_plus=1'b0;
		tb_d_minus=1'b0;
		#(1);
		assert(tb_eop == 1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);
	end
		

endmodule

