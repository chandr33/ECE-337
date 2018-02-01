// $Id: $
// File name:   adder_1bit.sv
// Created:     1/24/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: 1 bit adder
module adder_1bit (
	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);

	always @ (a,b,carry_in)
	begin
		assert((a==1'b1)||(a==1'b0))
		else $error("Input 'a' of component is not of a digital logic value");

		assert((b==1'b1)||(b==1'b0))
		else $error("Input 'b' of component is not of a digital logic value");

		assert((carry_in==1'b1)||(carry_in==1'b0))
		else $error("Input 'carry_in' of component is not of a digital logic value");
	end

	

	assign sum = carry_in ^ (a ^ b);
	assign carry_out = ((~carry_in) & b & a) | (carry_in & (b | a));

	always@(a[0],b[0],carry_in[0])
	begin
		#(2) assert(((a[0] + b[0] + carry_in[0]) %2 ) == sum[0])
		else $error("Output 's' of first 1 bit adder is not correct");
	end



endmodule

