// $Id: $
// File name:   sync_low.sv
// Created:     1/25/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic Low synchronizer

module sync_low (
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);

	reg Q;

	always_ff@(posedge clk, negedge n_rst) 
	begin : sync_low
		if(1'b0==n_rst)
		begin
			Q <= 0;
			sync_out <= 0;
		end
		else
		begin
			Q <= async_in;
			sync_out <= Q;
		end
	end
endmodule
