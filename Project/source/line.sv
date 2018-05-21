// $Id: $
// File name:   line.sv
// Created:     4/15/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Line Block

module line (
	input wire clk,n_rst,line_en,
	input wire [35:0] line_info,
	input wire buffer_full,
	output reg [8:0] output_x,
	output reg [8:0] output_y,
	output reg line_done,
	output reg w_enable
);

	logic [8:0] first_x;
	logic [8:0] first_y;
	logic [8:0] last_x;
	logic [8:0] last_y;
	logic [8:0] next_output_x;
	logic [8:0] next_output_y;
	logic [8:0] current_x;
	logic [8:0] next_x;
	logic [8:0] current_y;
	logic [8:0] next_y;
	logic line_done_temp;
	logic w_enable_temp;

	logic signed [8:0] dx,dy,current_err,next_err,current_e_two,next_e_two,temp_dx,temp_dy;
	logic sx,sy;

	assign first_x = line_info[8:0];// X Coordinate of 1 point
	assign first_y = line_info[17:9];// Y Coordinate of 1 point
	assign last_x = line_info[26:18];// X Coordinate of 2 point
	assign last_y = line_info[35:27];// Y Coordinate of 2 point


	assign temp_dx = (last_x - first_x);// dx
	assign temp_dy = (last_y - first_y);//dy
	assign sx = (temp_dx > 0) ? (1'b1) : (1'b0);//Right or Left depending on dx
	assign sy = (temp_dy > 0) ? (1'b1) : (1'b0);//Down or Up depending on dy
	assign dx = (sx == '0) ? (first_x - last_x) : temp_dx;//Dx or -Dx depending on sx
	assign dy = (sy == '0) ? temp_dy : (first_y - last_y);//Dy or -Dy depending on sy

	typedef enum bit [2:0] {IDLE,WRITE_PIXEL,CHECK,CALC_E2,UPDATE_X,WAIT1,UPDATE_Y,WAIT2} state;
	state next_state,current_state;

	always_ff @ (posedge clk, negedge n_rst) 
	begin
		if(n_rst == 0) 
		begin
			current_state <= IDLE;
			current_err <= '0;
			current_e_two <= '0;
			current_x <= '0;
			current_y <= '0;
			line_done <= '0;
			w_enable <= '0;
			output_x <= '0;
			output_y <= '0;
		end

		else
		begin
			current_state <= next_state;
			current_err <= next_err;
			current_e_two <= next_e_two;
			current_x <= next_x;
			current_y <= next_y;
			line_done <= line_done_temp;
			w_enable <= w_enable_temp;
			output_x <= next_output_x;
			output_y <= next_output_y;
		end
	end

	always_comb
	begin  //NEXT STATE LOGIC
		next_state = current_state;
		line_done_temp = line_done;
		w_enable_temp = w_enable;
		
		case(current_state)
		IDLE:	begin
			    line_done_temp = '1;
			    w_enable_temp = '0;
			    if(line_en == 1'b1) begin
				next_state = WRITE_PIXEL;
				line_done_temp = 1'b0;
				//w_enable_temp = '1;
			    end
			
			    else
				next_state = IDLE;
		end

		WRITE_PIXEL:    begin //Proceed to next state if buffer is not full
			    	    line_done_temp = '0;
			            w_enable_temp = '1;
				    if (buffer_full == 1'b0)
					next_state = CHECK; //IDLE or WRITE_PIXEL
		end

		CHECK:    begin //CHeck if reached the end
			    line_done_temp = '0;
			    w_enable_temp = '0;
			    if ((current_x == last_x) && (current_y == last_y)) begin
				line_done_temp = '1;
				next_state = IDLE;
			    end
			    else begin
				line_done_temp = '0;
				next_state = CALC_E2;
			    end
		end

		CALC_E2:    begin //Load e2 
			    	line_done_temp = '0;
			    	w_enable_temp = '0;
				next_state = UPDATE_X;
		end

		UPDATE_X:    begin//Update x coordinate
			        line_done_temp = '0;
			        w_enable_temp = '0;
				next_state = WAIT1;
		end    

		WAIT1:	begin //Buffer state: Load all values before proceeding 
			    line_done_temp = '0;
			    w_enable_temp = '0;
			    next_state = UPDATE_Y;
		end

		UPDATE_Y:    begin // Update y coordinate
			        line_done_temp = '0;
			        w_enable_temp = '0;
				next_state = WAIT2;
		end

		WAIT2:	begin //Buffer state: Load all values before proceeding
			    line_done_temp = '0;
			    w_enable_temp = '0;
			    next_state = WRITE_PIXEL;
		end
		endcase
	end

	always_comb
	begin  //OUTPUT LOGIC
		next_x = current_x;
		next_y = current_y;
		next_err = current_err;
		next_e_two = current_e_two;
		next_output_x = output_x;
		next_output_y = output_y;
		case(current_state)
		IDLE:	begin
			    next_err = dx + dy;
			    next_x = first_x;
			    next_y = first_y;
		end

		WRITE_PIXEL:    begin //Store x and y coordinate of updated pixel
				    next_output_x = current_x;
				    next_output_y = current_y;
		end

		CALC_E2:    begin // Calculate e**2 as it is used to update x and y
				next_e_two = 2 * current_err;   	
		end

		UPDATE_X:    begin // Update x based on error value
				if (current_e_two > dy) begin
					$info("Entered Update x");
					next_err = current_err + dy;
					if (sx == '1)
						next_x = current_x + 9'd1;
					else
						next_x = current_x - 9'd1;
				end
		end

		UPDATE_Y:    begin // Update y based on error value
				if (current_e_two < dx) begin
					$info("Entered Update y");
					next_err = current_err + dx;
					if (sy == '1)
						next_y = current_y + 9'd1;
					else
						next_y = current_y - 9'd1;
				end
		end
		endcase
	end

endmodule
