// $Id: $
// File name:   decode.sv
// Created:     2/21/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: NRZ Decoder
module decode(
	input wire clk,n_rst,d_plus,shift_enable,eop,
	output reg d_orig
);
	reg current_state;
	reg next_d_orig;
	reg next_state;
	

	always_ff @ (posedge clk, negedge n_rst)
	begin

		if(n_rst == 1'b0)
		begin
			d_orig <= 1'b1;
			current_state <= 1'b1;
		end

		else
		begin

			d_orig <= next_d_orig;
			current_state <= next_state;

		end

	end

	always_comb
	begin

		if(shift_enable)
		begin

			if(eop)
			begin
				next_state = 1'b1;
			end
			else if (~eop)
			begin
				next_state = d_plus;
			end
		end
		else
			next_state = current_state;
	end

	always_comb
	begin
		if(current_state == d_plus)
			next_d_orig = 1'b1;
		else if(current_state != d_plus)
			next_d_orig = 1'b0;
		else
			next_d_orig=1'b1;
	end

endmodule
