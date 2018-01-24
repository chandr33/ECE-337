// $Id: $
// File name:   sensor_s.sv
// Created:     1/24/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Structural Style Sensor

module sensor_s
(
	input wire[3:0] sensors,
	output wire error
);

	wire first_and;
	wire second_and;
	wire first_or;

	AND2X1 A1 (.Y(first_and), .A(sensors[3]), .B(sensors[1]));
	AND2X1 A2 (.Y(second_and), .A(sensors[2]), .B(sensors[1]));
	OR2X1  O1 (.Y(first_or), .A(first_and), .B(second_and));
	OR2X1  O2 (.Y(error), .A(first_or), .B(sensors[0]));

endmodule
