// $Id: $
// File name:   mealy.sv
// Created:     2/4/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: FSM Mealy
module mealy(
	input wire clk,n_rst,i,
	output reg o
);

	typedef enum bit [1:0] {IDLE, State1, State11, State110} stateType;
	stateType state;
	stateType nxt_state;

	always_ff @ (posedge clk, negedge n_rst)
	begin : REG_LOGIC
		if(1'b0 == n_rst)
			state <= IDLE;
		else
			state <= nxt_state;
	end

	always_comb
	begin : NXT_LOGIC
		nxt_state=state;
		case(state)
			IDLE:
			begin
				if(i==1'b1)
					nxt_state=State1;
				else
					nxt_state=IDLE;
			end

			State1:
			begin
				if(i==1'b1)
					nxt_state=State11;
				else
					nxt_state=IDLE;
			end

			State11:
			begin
				if(i==1'b1)
					nxt_state=State11;
				else
					nxt_state=State110;
			end
			State110:
			begin
				if(i==1'b1)
				begin
					nxt_state=State1;
					//o=1;
				end
				else
					nxt_state=IDLE;
			end
		endcase
	end

	always_comb
	begin
		if((state == State110) && (i == 1))
			o=1'b1;
		else
			o=1'b0;
	end

endmodule
	
