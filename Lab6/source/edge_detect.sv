// $Id: $
// File name:   edge_detect.sv
// Created:     2/21/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Rising Edge Detector
module edge_detect(
	input wire clk,n_rst,d_plus,
	output reg d_edge
);

	reg previous_d_plus;
	reg next_d_edge;
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 1'b0)
		begin
			d_edge <= 1'b0;
			previous_d_plus <= 1'b1;
		end

		else
		begin
			d_edge <= next_d_edge;
			previous_d_plus <= d_plus;
		end
	end

	always_comb
	begin
	
		if(previous_d_plus == d_plus)
			next_d_edge=1'b0;
		else if(previous_d_plus != d_plus)
			next_d_edge=1'b1;

		else
			next_d_edge=1'b0;
	end

endmodule
