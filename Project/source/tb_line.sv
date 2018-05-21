// $Id: $
// File name:   tb_line.sv
// Created:     4/15/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Line Block

`timescale 1ns / 100ps

module tb_line();

	localparam CLK_PERIOD= 10;
	reg tb_clk;

		//Clock generation block
	always
	begin
		tb_clk=1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk=1'b1;
		#(CLK_PERIOD/2.0);
	end

	//Declare DUT port map signals
	reg tb_n_rst,tb_line_en;
	reg [35:0] tb_line_info;
	reg tb_buffer_full;
	reg [8:0] tb_output_x;
	reg [8:0] tb_output_y;
	reg tb_line_done;
	reg tb_w_enable;

	//DUT Port Map

	line DUT(.clk(tb_clk), .n_rst(tb_n_rst), .line_en(tb_line_en), .buffer_full(tb_buffer_full), .line_info(tb_line_info), .line_done(tb_line_done), .w_enable(tb_w_enable), .output_x(tb_output_x), .output_y(tb_output_y));
	integer file;	
	
	//Test Bench Process
	always@(*)//Write x and y coordinates to file whenever write enable is 1
	begin
		file = $fopen("line_coordinates-((1,1)-(8,8)).txt","a");
		@(negedge tb_clk);
		if (tb_w_enable == 1'b1) begin
			$fwrite(file,"%d,%d\n",tb_output_x,tb_output_y);
		end
		$fclose(file);
	end

	initial 
	begin
		tb_n_rst = 1'b0;//Clear everything
		tb_line_en = '0;
		@(negedge tb_clk);
		tb_n_rst= 1'b1;
		@(negedge tb_clk);

		//TestCase 1 - 
		tb_line_en = 1; //Enable line block	
		tb_line_info = {9'd4,9'd7,9'd0,9'd0}; // X and Y coordinates of first and end points respectively
		tb_buffer_full = 0;//Buffer is empty
		@(negedge tb_clk);
		tb_line_en = 0;	//Disable line block after 1st cycle	
	
	end

endmodule
