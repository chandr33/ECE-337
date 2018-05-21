// $Id: $
// File name:   tb_arc.sv
// Created:     4/15/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Arc Block
`timescale 1ns / 100ps

module tb_arc();

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
	reg tb_n_rst,tb_arc_en;
	reg [44:0] tb_arc_info;
	reg tb_buffer_full;
	reg [8:0] tb_output_x;
	reg [8:0] tb_output_y;
	reg tb_arc_done;
	reg tb_w_enable;

	//DUT Port Map

	arc DUT(.clk(tb_clk), .n_rst(tb_n_rst), .arc_en(tb_arc_en), .buffer_full(tb_buffer_full), .arc_info(tb_arc_info), .arc_done(tb_arc_done), .nxt(tb_w_enable), .output_x(tb_output_x), .output_y(tb_output_y));
	integer file;
	//Test Bench Process
	always@(*) //Write x and y coordinates to file whenever write enable is 1
	begin
		file = $fopen("arc_coordinates_0-360.txt","a");
		@(negedge tb_clk);
		if (tb_w_enable == 1'b1) begin
			$fwrite(file,"%d,%d\n",tb_output_x,tb_output_y);
		end
		$fclose(file);
	end

	initial 
	begin
		tb_arc_en = '0;
		tb_n_rst = 1'b0;//Clear everything
		@(negedge tb_clk);
		tb_n_rst= 1'b1;
		@(negedge tb_clk);

		//TestCase 1 - 
		tb_arc_en = 1;	//Enable arc block
		tb_arc_info = {9'd360,9'd0,9'd30,9'd100,9'd100};//Provide center x and y coordinates, radius and start and end degree
		tb_buffer_full = 0; //Buffer is empty
		@(negedge tb_clk);
		tb_arc_en = 0;	//Disable arc block after 1st cycle	
	
	end

endmodule
