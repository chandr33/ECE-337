// $Id: $
// File name:   eop_detect.sv
// Created:     2/21/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: End of Packet Detector
module eop_detect(
	input wire d_plus,d_minus,
	output wire eop
);

	assign eop=~(d_plus)&~(d_minus);

endmodule
