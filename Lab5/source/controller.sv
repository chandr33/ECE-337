// $Id: $
// File name:   controller.sv
// Created:     2/15/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Controller Module
module controller (
	input wire clk,n_reset,dr,lc,overflow,
	output reg cnt_up,clear,
	output wire modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);

	typedef enum bit [4:0] {IDLE,STORE,INCREMENT_COUNT,ZERO,EIDLE,SORT1,SORT2,SORT3,SORT4,MUL1,ADD1,MUL2,SUB1,MUL3,ADD2,MUL4,SUB2,COEF1,WAIT1,COEF2,WAIT2,COEF3,WAIT3,COEF4} state;
	state current_state;
	state next_state;
	reg current_modwait;
	reg next_modwait;

	always_ff @ (posedge clk, negedge n_reset)
	begin
		if(n_reset == 1'b0)
		begin
			current_state <= IDLE;
			current_modwait <= 1'b0;
		end
		else
		begin
			current_state <= next_state;
			current_modwait <= next_modwait;
		end
	end
	assign modwait=current_modwait;

	always_comb
	begin
		next_state=current_state;
		case(current_state)
		IDLE:
		begin
			if(dr==1'b1)
			begin
				next_state=STORE;

			end

			else if(lc==1'b1)
			begin
				next_state=COEF1;
			end

			else
			begin
				next_state=IDLE;
			end

		end

		STORE:
		begin
			if(dr==1'b1)
			begin
				next_state=INCREMENT_COUNT;
			end

			else
			begin
				next_state=EIDLE;
			end
		end
			
		INCREMENT_COUNT:
		begin
			next_state=ZERO;
		end

		
		ZERO:
		begin
			next_state=SORT1;
		end

		SORT1:
		begin
			next_state=SORT2;
		end

		SORT2:
		begin
			next_state=SORT3;
		end

		SORT3:
		begin
			next_state=SORT4;
		end

		SORT4:
		begin
			next_state=MUL1;
		end

		MUL1:
		begin
			next_state=ADD1;
		end

		ADD1:
		begin
			if(overflow==1'b1)
			begin
				next_state=EIDLE;
			end

			else
			begin
				next_state=MUL2;
			end
		end
	
		MUL2:
		begin
			next_state=SUB1;
		end

		SUB1:
		begin
			if(overflow==1'b1)
			begin
				next_state=EIDLE;
			end

			else
			begin
				next_state=MUL3;
			end
		end

		MUL3:
		begin
			next_state=ADD2;
		end

		ADD2:
		begin
			if(overflow==1'b1)
			begin
				next_state=EIDLE;
			end

			else
			begin
				next_state=MUL4 ;
			end
		end

		MUL4:
		begin
			next_state=SUB2;
		end

		SUB2:
		begin
			if(overflow==1'b1)
			begin
				next_state=EIDLE;
			end

			else
			begin
				next_state=IDLE;
			end
		end

		COEF1:
		begin
			next_state=WAIT1;
		end

		WAIT1:
		begin
			if(lc==1)
			begin
				next_state=COEF2;
			end
			else
			begin
				next_state=WAIT1;
			end
		end

		COEF2:
		begin
			next_state=WAIT2;
		end

		WAIT2:
		begin
			if(lc==1)
			begin
				next_state=COEF3;
			end
			else
			begin
				next_state=WAIT2;
			end
		end

		COEF3:
		begin
			next_state=WAIT3;
		end

		WAIT3:
		begin
			if(lc==1)
			begin
				next_state=COEF4;
			end
			else
			begin
				next_state=WAIT3;
			end
		end

		COEF4:
		begin
			next_state=IDLE;

		end

		EIDLE:
		begin
			if(dr==1'b1)
			begin
				next_state=STORE;
			end

			else
			begin
				next_state=EIDLE;
			end
		end
		endcase
	end

	always_comb
	begin
		op='0;
		src1='0;
		src2='0;
		src2='0;
		dest='0;
		err='0;
		next_modwait=1'b1;
		cnt_up=1'b0;
		clear=1'b0;
		if(current_state == IDLE)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op='0;
			src1='0;
			src2='0;
			dest='0;
			err=1'b0;
			next_modwait=1'b0;
		end

		else if(current_state == STORE)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b010;
			src1='0;
			src2='0;
			dest=4'd5;
			err=1'b0;
		end

		else if(current_state == INCREMENT_COUNT)
		begin
			cnt_up=1'b1;
			clear=1'b0;
			op=3'b000;
			src1='0;
			src2='0;
			dest='0;
			err=1'b0;
		end

		else if(current_state == ZERO)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b101;
			src1='0;
			src2='0;
			dest='0;
			err=1'b0;
		end

		else if(current_state == SORT1)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b001;
			src1=4'd2;
			src2='0;
			dest=4'd1;
			err=1'b0;
		end

		else if(current_state == SORT2)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b001;
			src1=4'd3;
			src2='0;
			dest=4'd2;
			err=1'b0;
		end

		else if(current_state == SORT3)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b001;
			src1=4'd4;
			src2='0;
			dest=4'd3;
			err=1'b0;
		end

		else if(current_state == SORT4)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b001;
			src1=4'd5;
			src2='0;
			dest=4'd4;
			err=1'b0;
		end

		else if(current_state == MUL1)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b110;
			src1=4'd1;
			src2=4'd6;
			dest=4'd7;
			err=1'b0;
		end
		else if(current_state == ADD1)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b100;
			src1=4'd0;
			src2=4'd7;
			dest=4'd0;
			err=1'b0;
		end

		else if(current_state == MUL2)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b110;
			src1=4'd2;
			src2=4'd8;
			dest=4'd7;
			err=1'b0;
		end
		
		else if(current_state == SUB1)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b101;
			src1=4'd0;
			src2=4'd7;
			dest=4'd0;
			err=1'b0;
		end

		else if(current_state == MUL3)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b110;
			src1=4'd3;
			src2=4'd9;
			dest=4'd7;
			err=1'b0;
		end

		else if(current_state == ADD2)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b100;
			src1=4'd0;
			src2=4'd7;
			dest=4'd0;
			err=1'b0;	
		end

		else if(current_state == MUL4)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b110;
			src1=4'd4;
			src2=4'd10;
			dest=4'd7;
			err=1'b0;
		end

		else if(current_state == SUB2)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b101;
			src1=4'd0;
			src2=4'd7;
			dest=4'd0;
			err=1'b0;
		end

		else if(current_state == COEF1)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b011;
			src1='0;
			src2='0;
			dest=4'd10;
			err=1'b0;
		end

		else if(current_state == WAIT1)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b000;
			src1='0;
			src2='0;
			dest='0;
			err=1'b0;
			next_modwait=1'b0;
		end

		else if(current_state == COEF2)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b011;
			src1='0;
			src2='0;
			dest=4'd9;
			err=1'b0;
		end

		else if(current_state == WAIT2)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b000;
			src1='0;
			src2='0;
			dest='0;
			err=1'b0;
			next_modwait=1'b0;
		end
		
		else if(current_state == COEF3)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b011;
			src1='0;
			src2='0;
			dest=4'd8;
			err=1'b0;
		end

		else if(current_state == WAIT3)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b000;
			src1='0;
			src2='0;
			dest='0;
			err=1'b0;
			next_modwait=1'b0;
		end

		else if(current_state == COEF4)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op=3'b011;
			src1='0;
			src2='0;
			dest=4'd6;
			err=1'b0;
		end

		else if(current_state == EIDLE)
		begin
			cnt_up=1'b0;
			clear=1'b0;
			op='0;
			src1='0;
			src2='0;
			dest='0;
			err=1'b1;
			next_modwait=1'b0;
		end
			
	end

endmodule


