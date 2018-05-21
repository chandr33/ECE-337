// $Id: $
// File name:   sr_9bit.sv
// Created:     2/8/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: SR 9 bit
module sr_9bit (
	input wire clk,n_rst,shift_strobe,serial_in,
	output reg [7:0] packet_data,
	output reg stop_bit
);

	flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0)) SHIFT_BITS(.clk(clk), .n_rst(n_rst), .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({stop_bit,packet_data}));

endmodule
