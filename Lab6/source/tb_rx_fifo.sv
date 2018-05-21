// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     2/21/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Test Bench for RX FIFO
`timescale 1ns / 100ps
module tb_rx_fifo();

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
	reg tb_n_rst,tb_r_enable,tb_w_enable;
	reg [7:0] tb_w_data;
	reg [7:0] tb_r_data;
	reg tb_empty,tb_full;

	//DUT PORT MAP

	rx_fifo DUT(.clk(tb_clk), .n_rst(tb_n_rst), .r_enable(tb_r_enable), .w_enable(tb_w_enable), .w_data(tb_w_data), .r_data(tb_r_data), .empty(tb_empty), .full(tb_full));

	//Declare variable testcase counter
	integer testcase;

	//Test Bench Process
	initial
	begin

		tb_r_enable=1'b0;
		tb_w_enable=1'b0;
		tb_n_rst=1'b1;
		tb_empty=1'b1;
		tb_full=1'b0;
		//Test Case 1 check FIFO empty and Write_ptr=Read_ptr
		testcase=1;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_empty == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);


		//Test Case 2 Write 1 word and check FIFO Empty
		testcase=2;
		tb_w_data=8'b00000000;
		tb_n_rst=1'b1;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_r_data == 8'b00000000)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);

		assert(tb_empty == 1'b0)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);

		
		//Test Case 3 Write 2 words and read 1 word
		testcase=3;
		tb_w_data=8'b00000001;
		tb_n_rst=1'b1;
		tb_w_enable=1'b1;
		tb_r_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_r_data == 8'b00000001)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);


		
		//Test Case 4 - Write 7 more words and check stack full
		testcase=4;
		tb_r_enable=1'b0;
		//word2
		tb_w_data=8'b00000010;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word3
		tb_w_data=8'b00000011;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word4
		tb_w_data=8'b00000100;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word5
		tb_w_data=8'b00000101;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word6
		tb_w_data=8'b00000110;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word7
		tb_w_data=8'b00000111;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word8
		tb_w_data=8'b00001000;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);

		assert(tb_full == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);

		//Test Case 5 read 2 words
		testcase=5;
		tb_n_rst=1'b1;
		tb_r_enable=1'b1;
		@(posedge tb_clk);
		tb_r_enable=1'b1;
		@(posedge tb_clk)
		#(CLK_PERIOD/2.0);
		assert(tb_r_data == 8'b00000011)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);
		
		
		//Test Case 6 reset
		testcase=6;
		tb_n_rst=1'b0;
		@(posedge tb_clk);
	
		assert(tb_empty == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);

		//Test case 7 - full drain
		testcase=7;
		tb_r_enable=1'b0;
		//word2
		tb_w_data=8'b00000010;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word3
		tb_w_data=8'b00000011;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word4
		tb_w_data=8'b00000100;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word5
		tb_w_data=8'b00000101;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word6
		tb_w_data=8'b00000110;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word7
		tb_w_data=8'b00000111;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word8
		tb_w_data=8'b00001000;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		//word9
		tb_w_data=8'b11111111;
		tb_w_enable=1'b1;
		@(posedge tb_clk);
		#(CLK_PERIOD/2.0);
		assert(tb_full == 1'b1)
			$display("Testcase %d passed",testcase);
		else
			$error("Testcase %d failed",testcase);
		
	end
		

endmodule
