// $Id: $
// File name:   sensor_d.sv
// Created:     1/24/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Dataflow Style Sensor
// 
module sensor_d (
	input wire[3:0] sensors,
	output wire error
);

	wire and1;
	wire and2;
	wire or1;

	assign and1 = (sensors[3] & sensors[1]);//AC
	assign and2 = (sensors[2] & sensors[0]);//BC
	assign or1 = (and1 | and2);//AC + BC
	assign error = (sensors[0] | or1);//D+AC+BC

endmodule
