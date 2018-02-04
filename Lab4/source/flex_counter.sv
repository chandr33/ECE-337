// $Id: $
// File name:   flex_counter.sv
// Created:     2/2/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Flex Counter Module
module flex_counter
#(
	NUM_CNT_BITS=4
)

(
	input wire clk,n_rst,count_enable,clear,
	input wire [NUM_CNT_BITS-1:0] rollover_val,
	output reg [NUM_CNT_BITS-1:0] count_out,
	output reg rollover_flag
);

	reg[NUM_CNT_BITS-1:0] next_count;
	reg next_flag;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
		begin
			rollover_flag <= 1'b0;
			count_out <= '0;
		end
		else
		begin
			count_out <= next_count;
			rollover_flag <= next_flag;
		end
	end

	always_comb
	begin
		if(clear == 1)
		begin
			next_count= 1'b0;
		end

		else
		begin
			next_flag=rollover_flag;
			if(count_enable == 1)
			begin
				next_count=count_out+1;
				next_flag=1'b0;
				if(next_count == rollover_val +1)
					next_count=1;
				if(next_count==rollover_val)
					next_flag=1'b1;
			end
			else
			begin
				next_count=count_out;
				next_flag=1'b0;
			end
		end
	end
	//assign count_out=next_count;
	//assign rollover_flag=next_flag;

endmodule

				