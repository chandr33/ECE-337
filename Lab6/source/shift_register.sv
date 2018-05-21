// $Id: $
// File name:   shift_register.sv
// Created:     2/23/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: .
module shift_register (
	input wire clk,n_rst,shift_enable,d_orig,
	output wire [7:0] rcv_data
);

	flex_stp_sr #(8,0) shift_reg(.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .serial_in(d_orig), .parallel_out(rcv_data));
endmodule
