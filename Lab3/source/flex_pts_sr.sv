// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/1/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Serial to Paraller Shift Register
module flex_pts_sr
#(
	NUM_BITS=4,
	SHIFT_MSB=1
)
(
	input wire clk,n_rst,shift_enable,load_enable,
	input reg [NUM_BITS-1:0] parallel_in,
	output wire serial_out
);

	reg [NUM_BITS-1:0] current_state;
	reg [NUM_BITS-1:0] next_state;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst==0)
			current_state <= '1;
		else
			current_state <= next_state;
	end
	
	always_comb
	begin
		if(load_enable == 1)
			next_state = parallel_in;
		else
		begin
			if(shift_enable == 1)
			begin
				if(SHIFT_MSB==1)
					next_state={current_state[NUM_BITS-2:0],1'b1};
				else
					next_state={1'b1,current_state[NUM_BITS-1:1]};
			end
			else
				next_state = current_state;
		end
	end

	if(SHIFT_MSB == 1)
		assign serial_out=current_state[NUM_BITS-1];
	else
		assign serial_out=current_state[0];

endmodule

