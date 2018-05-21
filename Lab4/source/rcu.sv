// $Id: $
// File name:   rcu.sv
// Created:     2/8/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: RCU BLock
module rcu(
	input wire clk,n_rst,start_bit_detected,packet_done,framing_error,
	output reg sbc_clear,sbc_enable,load_buffer,enable_timer
);

	typedef enum bit[2:0] {IDLE, START, RECEIVE_PACKETS, STOP, CHECK_STOP, STORE} stateType;
	stateType state;
	stateType next_state;

	always_ff @ (posedge clk, negedge n_rst)
	begin : REG_LOGIC
		if(n_rst == 0)
		begin
			state <= IDLE;
		end
		else
		begin
			state <= next_state;
		end
	end

	always_comb
	begin : NEXT_LOGIC

		next_state=state;
		sbc_clear=1'b0;
		sbc_enable=1'b0;
		load_buffer=1'b0;
		enable_timer=1'b0;
		case(state)
			IDLE:
			begin
				sbc_clear=1'b0;
				sbc_enable=1'b0;
				load_buffer=1'b0;
				enable_timer=1'b0;
				if(start_bit_detected == 1'b1)
					next_state = START;
				else
					next_state = IDLE;
			end

			START:
			begin
				sbc_clear = 1'b1;
				sbc_enable=1'b0;
				load_buffer=1'b0;
				enable_timer=1'b0;
				next_state = RECEIVE_PACKETS;
			end

			RECEIVE_PACKETS:
			begin
				sbc_clear = 1'b0;
				enable_timer = 1'b1;
				sbc_enable=1'b0;
				load_buffer=1'b0;
				if (packet_done == 1'b1)
					next_state = STOP;
				else
					next_state = RECEIVE_PACKETS;
			end

			STOP:
			begin
				enable_timer = 1'b0;
				sbc_enable = 1'b1;
				sbc_clear=1'b0;
				load_buffer=1'b0;
				next_state = CHECK_STOP;
			end

			CHECK_STOP:
			begin
				sbc_enable=1'b0;
				load_buffer=1'b0;
				sbc_clear = 1'b0;
				enable_timer = 1'b0;
				if(framing_error == 1'b1)
					next_state = IDLE;
				else
					next_state = STORE;
			end

			STORE:
			begin
				load_buffer = 1'b1;
				sbc_clear = 1'b0;
				enable_timer = 1'b0;
				sbc_enable=1'b0;
				next_state = IDLE;
			end
		endcase
	end
endmodule
