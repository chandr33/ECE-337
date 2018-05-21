// $Id: $
// File name:   counter.sv
// Created:     2/15/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Counter Module
module counter(
	input wire clk,n_reset,cnt_up,clear,
	output wire one_k_samples
);
	reg [9:0] count_out;

	
	flex_counter #(10) counter(.clk(clk), .n_rst(n_reset), .clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000), .rollover_flag(one_k_samples), .count_out(count_out));

endmodule
