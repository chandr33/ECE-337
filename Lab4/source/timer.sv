// $Id: $
// File name:   timer.sv
// Created:     2/8/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Timer Module
module timer(
	input wire clk,n_rst,enable_timer,
	output reg shift_strobe,packet_done
);
	reg [3:0] count_out1;
	reg [3:0] count_out2;
	flex_counter COUNT_CLOCK_CYCLES (
		.clk(clk),
		.n_rst(n_rst),
		.count_enable(enable_timer),
		.clear(packet_done),
		.rollover_val(4'b1010),
		.rollover_flag(shift_strobe),
		.count_out(count_out1)
	);

	flex_counter COUNT_BITS (
		.clk(clk),
		.n_rst(n_rst),
		.count_enable(shift_strobe),
		.clear(packet_done),
		.rollover_val(4'b1001),
		.rollover_flag(packet_done),
		.count_out(count_out2)
	);

endmodule
