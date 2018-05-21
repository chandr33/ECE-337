// $Id: $
// File name:   rcu.sv
// Created:     2/23/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: .
module rcu(
	input wire clk,n_rst,d_edge,eop,shift_enable,
	input wire [7:0] rcv_data,
	input wire byte_received,
	output reg rcving,w_enable,r_error
);

	typedef enum bit [3:0] {IDLE,START,CHECK_SYNC,DATA_READY,RECEIVE_DATA,STORE,WAIT,EIDLE,DELAY,NO_MATCH,DEFAULT} state;
	state current_state;
	state next_state;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
		begin
			current_state <= IDLE;
		end
		else
		begin
			current_state <= next_state;
		end
	end

	always_comb
	begin
		next_state = current_state;
		case(current_state)
		IDLE:
		begin
			if(d_edge == 1'b1)
				next_state=START;
		end

		START:
		begin
			if(byte_received)
				next_state=CHECK_SYNC;
		end

		CHECK_SYNC:
		begin
			if(rcv_data == 8'b10000000)
				next_state=DATA_READY;
			else
				next_state=NO_MATCH;
		end

		DATA_READY:
		begin
			if(shift_enable & ~eop)
				next_state=RECEIVE_DATA;

			else if(shift_enable & eop)
				next_state=WAIT;
		end

		RECEIVE_DATA:
		begin
			if(byte_received)
				next_state = STORE;
			else if(eop & shift_enable)
				next_state = DELAY;
			else if(~byte_received)
				next_state = RECEIVE_DATA;
		end

		STORE:
		begin
			next_state = DATA_READY;
		end

		WAIT:
		begin
			if(d_edge)
				next_state = IDLE;
			else if(~d_edge)
				next_state = WAIT;
		end

		NO_MATCH:
		begin
			if(shift_enable & eop)
				next_state = DELAY;
			else if(shift_enable & ~eop)
				next_state = NO_MATCH;
		end

		DELAY:
		begin
			if(d_edge)
				next_state = EIDLE;
			else if(~d_edge)
				next_state = DELAY;
		end

		EIDLE:
		begin
			if(d_edge)
				next_state = START;
			else if(~d_edge)
				next_state = EIDLE;
		end
		endcase
	end

	always_comb 
	begin
		rcving='0;
		w_enable='0;
		r_error='0;

		if(current_state == IDLE)
		begin
			rcving='0;
			w_enable='0;
			r_error='0;
		end
		
		else if(current_state == START)
			rcving=1'b1;

		else if(current_state == CHECK_SYNC)
			rcving=1'b1;

		else if(current_state == DATA_READY)
			rcving=1'b1;

		else if(current_state == RECEIVE_DATA)
			rcving=1'b1;
			
		else if(current_state == STORE)
		begin
			rcving=1'b1;
			w_enable=1'b1;
		end

		else if(current_state == WAIT)
		begin
			rcving=1'b1;
			//w_enable=1'b0;
			//r_error=1'b0;
		end
		
		else if(current_state == NO_MATCH)
		begin
			rcving=1'b1;
			r_error=1'b1;
		end

		else if(current_state == DELAY)
		begin
			r_error=1'b1;
			rcving=1'b1;
		end

		else if(current_state == EIDLE)
		begin
			r_error=1'b1;
		end
	end
	
endmodule
