// $Id: $
// File name:   rx_fifo.sv
// Created:     2/21/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: RX FIFO Block
module rx_fifo(
	input wire clk,n_rst,r_enable,w_enable,
	input wire [7:0] w_data,
	output wire [7:0] r_data,
	output wire empty,full
);

	fifo rx_fifo(.r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(w_enable), .w_data(w_data), .r_data(r_data), .empty(empty), .full(full));

endmodule
