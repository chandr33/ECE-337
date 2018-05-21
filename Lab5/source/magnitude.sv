// $Id: $
// File name:   magnitude.sv
// Created:     2/15/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Magnitude Module
module magnitude(
	input wire [16:0] in,
	output wire [15:0] out
);

	reg [16:0] temp;
	always_comb
	begin
		if(in[16] == 1'b1)
			temp = ~in[16:0] + 1'b1;
		else
			temp=in[16:0];
	end

	assign out=temp[15:0];

endmodule
			