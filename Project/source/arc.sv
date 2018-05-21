// $Id: $
// File name:   arc.sv
// Created:     4/15/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Arc Block
// 
module arc(
	input wire clk,n_rst,arc_en,
	input wire [44:0] arc_info,
	input wire buffer_full,
	output reg [8:0] output_x,
	output reg [8:0] output_y,
	output reg arc_done,
	output reg nxt
);

	typedef enum bit [4:0] {IDLE,LOAD,RUN,FIRST,WRITE_PIXEL1,SECOND,WRITE_PIXEL2,THIRD,WRITE_PIXEL3,FOURTH,WRITE_PIXEL4,FIFTH,WRITE_PIXEL5,SIXTH,WRITE_PIXEL6,SEVENTH,WRITE_PIXEL7,EIGHTH,WRITE_PIXEL8,LOAD2,UPDATE} state;
	state next_state,current_state;

	logic unsigned [8:0] start_x;
	logic unsigned [8:0] start_y;
	logic unsigned [8:0] current_x;
	logic unsigned [8:0] temp_x;
	logic unsigned [8:0] current_y;
	logic unsigned [8:0] temp_y;
	logic unsigned [8:0] next_x;
	logic unsigned [8:0] next_y;
	logic unsigned [8:0] addr_x;
	logic unsigned [8:0] addr_y;
	logic unsigned [8:0] next_output_x;
	logic unsigned [8:0] next_output_y;
	logic unsigned [8:0] radius;
	logic [8:0] start_angle;
	logic unsigned [8:0] next_start_angle;
	logic unsigned [8:0] end_angle;
	logic unsigned [3:0] current_number;
	logic unsigned [3:0] next_number;
	logic unsigned [8:0] difference;
	reg w_enable;
	logic signed [8:0] d;//Number of bits?
	logic signed [8:0] next_d;
	logic arc_done_temp;
	logic w_enable_temp;
	logic [8:0] temp_start_angle;
	assign start_x = arc_info[8:0];// X Coordinate of center
	assign start_y = arc_info[17:9];// Y Coordinate of center
	assign radius = arc_info[26:18];//Radius of circle
	assign end_angle = arc_info[44:36];//End degree of arc
	assign temp_start_angle = arc_info[35:27];//Start degree of arc
	assign difference = end_angle - temp_start_angle;
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == '0) begin
			current_state <= IDLE;
			current_x <= '0;
			current_y <= '0;
			addr_x <= '0;
			addr_y <= '0;
			arc_done <= '0;
			w_enable <= '0;
			d <= '0;
			current_number <= '0;
			start_angle <= '0;
			output_x <= '0;
			output_y <= '0;
			nxt <= '0;
		end

		else begin
			current_state <= next_state;
			current_x <= next_x;
			current_y <= next_y;
			addr_x <= temp_x;
			addr_y <= temp_y;
			arc_done <= arc_done_temp;
			w_enable <= w_enable_temp;
			d <= next_d;
			current_number <= next_number;
			start_angle <= next_start_angle;
			output_x <= next_output_x;
			output_y <= next_output_y;
			nxt <= w_enable;
		end
	end

	always_comb
	begin		//NEXT STATE LOGIC
		next_state = current_state;
		arc_done_temp = arc_done;
		w_enable_temp = w_enable;
		next_number = current_number;
		next_start_angle = start_angle;
		next_number = current_number;

		case(current_state)
		IDLE:    begin
			arc_done_temp = '1;
			w_enable_temp = '0;
			next_number = difference/45;//Calculates the number of octants according to start and end degree
			if (arc_en == '1) begin
				next_state = LOAD;
				next_start_angle = arc_info[35:27];
				arc_done_temp = '0;
			end
			else
				next_state = IDLE;
		end

		LOAD:    begin
			next_state = RUN;
			arc_done_temp = '0;
			w_enable_temp = '0;
		end

		RUN:    begin
			if (current_y >= current_x) begin //Check if the reached the end
				if (next_start_angle == 0) begin //Octant 1
					if (current_number != 0)
						next_state = FIRST;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 45) begin //Octant 2
					if (current_number != 0)
						next_state = SECOND;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 90) begin //Octant 3
					if (current_number != 0)
						next_state = THIRD;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 135) begin //Octant 4
					if (current_number != 0)
						next_state = FOURTH;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 180) begin //Octant 5
					if (current_number != 0) 
						next_state = FIFTH;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 225) begin //Octant 6
					if (current_number != 0)
						next_state = SIXTH;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 270) begin //Octant 7
					if (current_number != 0)
						next_state = SEVENTH;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 315) begin //Octant 8
					if (current_number != 0)
						next_state = EIGHTH;
					else
						next_state = LOAD2;
				end
			end
			else if ((current_x - current_y) == 1) begin//To plot the last points after the end
				if (next_start_angle == 0) begin
					if (current_number != 0)
						next_state = FIRST;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 45) begin
					if (current_number != 0)
						next_state = SECOND;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 90) begin
					if (current_number != 0)
						next_state = THIRD;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 135) begin
					if (current_number != 0)
						next_state = FOURTH;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 180) begin
					if (current_number != 0) 
						next_state = FIFTH;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 225) begin
					if (current_number != 0)
						next_state = SIXTH;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 270) begin
					if (current_number != 0)
						next_state = SEVENTH;
					else
						next_state = LOAD2;
				end
				if (next_start_angle == 315) begin
					if (current_number != 0)
						next_state = EIGHTH;
					else
						next_state = LOAD2;
				end
			end

			else begin
				next_state = IDLE;
				arc_done_temp = '1;
			end
		end

		FIRST:    begin // Go to write state if buffer not full
			if (buffer_full == '0) begin
				next_state = WRITE_PIXEL1;
				w_enable_temp = '1;
			end
			else
				w_enable_temp = '0;
			arc_done_temp = '0;
		end
		
		WRITE_PIXEL1:    begin // Check if number is not 0; Increase start angle by 45 and decrement number by 1
				if ((current_number >= 0)) begin
					next_start_angle = start_angle + 45;
					next_number = current_number - 4'd1;
					next_state = RUN;
				end
				arc_done_temp = '0;
				w_enable_temp = '0;
		end

		SECOND:    begin // Go to write state if buffer not full
			if (buffer_full == '0) begin
				next_state = WRITE_PIXEL2;
				w_enable_temp = '1;
			end
			else
				w_enable_temp = '0;
			arc_done_temp = '0;
		end

		WRITE_PIXEL2:    begin // Check if number is not 0; Increase start angle by 45 and decrement number by 1
				if ((current_number >= 0)) begin
					next_start_angle = start_angle + 45;
					next_number = current_number - 4'd1;
					next_state = RUN;
				end
				arc_done_temp = '0;
				w_enable_temp = '0;
		end
				
		THIRD:    begin // Go to write state if buffer not full
			if (buffer_full == '0) begin
				next_state = WRITE_PIXEL3;
				w_enable_temp = '1;
			end
			else
				w_enable_temp = '0;
			arc_done_temp = '0;
		end

		WRITE_PIXEL3:    begin// Check if number is not 0; Increase start angle by 45 and decrement number by 1
				if((current_number >= 0)) begin
					next_start_angle = start_angle + 45;
					next_number = current_number - 4'd1;
					next_state = RUN;
				end
				arc_done_temp = '0;
				w_enable_temp = '0;
		end

		FOURTH:    begin // Go to write state if buffer not full
			if (buffer_full == '0) begin
				next_state = WRITE_PIXEL4;
				w_enable_temp = '1;
			end
			else
				w_enable_temp = '0;
			arc_done_temp = '0;
		end

		WRITE_PIXEL4:    begin// Check if number is not 0; Increase start angle by 45 and decrement number by 1
				if ((current_number >= 0)) begin
					next_start_angle = start_angle + 45;
					next_number = current_number - 4'd1;
					next_state = RUN;
				end
				arc_done_temp = '0;
				w_enable_temp = '0;
		end

		FIFTH:    begin // Go to write state if buffer not full
			if (buffer_full == '0) begin
				next_state = WRITE_PIXEL5;
				w_enable_temp = '1;
			end
			else
				w_enable_temp = '0;
			arc_done_temp = '0;
		end

		WRITE_PIXEL5:    begin// Check if number is not 0; Increase start angle by 45 and decrement number by 1
				if ((current_number >= 0)) begin
					next_start_angle = start_angle + 45;
					next_number = current_number - 4'd1;
					next_state = RUN;
				end
				arc_done_temp = '0;
				w_enable_temp = '0;
		end
		
		SIXTH:    begin // Go to write state if buffer not full
			if (buffer_full == '0) begin
				next_state = WRITE_PIXEL6;
				w_enable_temp = '1;
			end
			else
				w_enable_temp = '0;
			arc_done_temp = '0;
		end

		WRITE_PIXEL6:    begin// Check if number is not 0; Increase start angle by 45 and decrement number by 1
				if ((current_number >= 0)) begin
					next_start_angle = start_angle + 45;
					next_number = current_number - 4'd1;
					next_state = RUN;
				end
				arc_done_temp = '0;
				w_enable_temp = '0;
		end

		SEVENTH:    begin // Go to write state if buffer not full
			if (buffer_full == '0) begin
				next_state = WRITE_PIXEL7;
				w_enable_temp = '1;
			end
			else
				w_enable_temp = '0;
			arc_done_temp = '0;
		end

		WRITE_PIXEL7:    begin// Check if number is not 0; Increase start angle by 45 and decrement number by 1
				if ((current_number >= 0)) begin
					next_start_angle = start_angle + 45;
					next_number = current_number - 4'd1;
					next_state = RUN;
				end
				arc_done_temp = '0;
				w_enable_temp = '0;
		end

		EIGHTH:    begin // Go to write state if buffer not full
			if (buffer_full == '0) begin
				next_state = WRITE_PIXEL8;
				w_enable_temp = '1;
			end
			else
				w_enable_temp = '0;
			arc_done_temp = '0;
		end

		WRITE_PIXEL8:    begin//Directly go to buffer state
				next_state = LOAD2;
				arc_done_temp = '0;
				w_enable_temp = '0;
		end

		LOAD2:    begin//Buffer state: Wait for values to load
			next_state = UPDATE;
			arc_done_temp = '0;
			w_enable_temp = '0;
		end

		UPDATE:    begin//Set the current number and start angle back to the initial values
				next_state = RUN;
				next_number = difference/45;
				next_start_angle = arc_info[35:27];
				arc_done_temp = '0;
				w_enable_temp = '0;
		end
		endcase
	end

	always_comb
	begin  //OUTPUT LOGIC
		next_x = current_x;
		next_y = current_y;
		next_d = d;
		temp_x = addr_x;
		temp_y = addr_y;
		next_output_x = output_x;
		next_output_y = output_y;

		case(current_state)
		IDLE:    begin //Initialize current x to 1 and y to radius
			next_x = 9'd1;
			next_y = radius;
			next_d = (3 - 2*radius);
			temp_x = '0;
			temp_y = '0;
		end

		FIRST:    begin //Update the pixel value to store accordint to Octant 1 (xc+x,yc+x)
			temp_x = start_x + current_x;
			temp_y = start_y + current_y;
		end
	
		WRITE_PIXEL1:    begin // Output x and y coordinates of the updated pixel
				next_output_x = addr_x;
				next_output_y = addr_y;
		end

		SECOND:    begin //Update the pixel value to store accordint to Octant 2 (xc+y,yc+x)
			temp_x = start_x + current_y;
			temp_y = start_y + current_x;
		end

		WRITE_PIXEL2:    begin // Output x and y coordinates of the updated pixel
				next_output_x = addr_x;
				next_output_y = addr_y;
		end

		THIRD:    begin //Update the pixel value to store accordint to Octant 3 (xc+y,yc-x)
			temp_x = start_x + current_y;
			temp_y = start_y - current_x;
		end

		WRITE_PIXEL3:    begin // Output x and y coordinates of the updated pixel
				next_output_x = addr_x;
				next_output_y = addr_y;
		end

		FOURTH:    begin //Update the pixel value to store accordint to Octant 4 (xc+x,yc-y)
			temp_x = start_x + current_x;
			temp_y = start_y - current_y;
		end

		WRITE_PIXEL4:    begin // Output x and y coordinates of the updated pixel
				next_output_x = addr_x;
				next_output_y = addr_y;
		end

		FIFTH:    begin //Update the pixel value to store accordint to Octant 5 (xc-x,yc-y)
			temp_x = start_x - current_x;
			temp_y = start_y - current_y;
		end

		WRITE_PIXEL5:    begin // Output x and y coordinates of the updated pixel
				next_output_x = addr_x;
				next_output_y = addr_y;
		end

		SIXTH:    begin //Update the pixel value to store accordint to Octant 6 (xc-y,yc-x)
			temp_x = start_x - current_y;
			temp_y = start_y - current_x;
		end

		WRITE_PIXEL6:    begin // Output x and y coordinates of the updated pixel
				next_output_x = addr_x;
				next_output_y = addr_y;
		end

		SEVENTH:    begin //Update the pixel value to store accordint to Octant 7 (xc-y,yc+x)
			temp_x = start_x - current_y;
			temp_y = start_y + current_x;
		end

		WRITE_PIXEL7:    begin // Output x and y coordinates of the updated pixel
				next_output_x = addr_x;
				next_output_y = addr_y;
		end

		EIGHTH:    begin //Update the pixel value to store accordint to Octant 8 (xc-x,yc+y)
			temp_x = start_x - current_x;
			temp_y = start_y + current_y;
		end

		WRITE_PIXEL8:    begin // Output x and y coordinates of the updated pixel
				next_output_x = addr_x;
				next_output_y = addr_y;
		end


		UPDATE:    begin//Update x,y,d
			if (d > 0) begin
				next_d = d + (9'd4 * (current_x - current_y)) + 9'd10;
			end

			else begin
				next_d = d + (9'd4 * current_x) + 9'd6;
			end
			if (next_d > 0) begin
				next_y = current_y - 9'd1;
			end
			next_x = current_x + 9'd1;
		end
		endcase
	end
endmodule
