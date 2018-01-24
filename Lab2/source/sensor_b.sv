// $Id: $
// File name:   sensor_b.sv
// Created:     1/24/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Behavioral Style Sensor


module sensor_b (
	input wire[3:0] sensors,
	output reg error
);

	always@(sensors)
	begin
		error=(((sensors[3] & sensors[1]) | (sensors[2] & sensors[1])) | sensors[0] ); 
	end

endmodule
