// $Id: $
// File name:   timer.sv
// Created:     2/23/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Timer Block
module timer (
	input wire clk,n_rst,d_edge,rcving,
	output wire shift_enable,byte_received
);
	reg [3:0] count1;
	reg [3:0] count2;
	reg rollover_flag;

	flex_counter #(4) count_cycles(.clk(clk), .n_rst(n_rst), .count_enable(rcving), .clear(d_edge), .rollover_val(4'b1000), .count_out(count1), .rollover_flag(rollover_flag));
	
	assign shift_enable = (count1 == 4'b0011) ? 1'b1:1'b0;

	flex_counter #(4) count_bits(.clk(clk), .n_rst(n_rst), .count_enable(shift_enable), .clear(byte_received || !rcving), .rollover_val(4'b1000), .count_out(count2), .rollover_flag(byte_received));
endmodule
