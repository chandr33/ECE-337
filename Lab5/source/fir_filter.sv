// $Id: $
// File name:   fir_filter.sv
// Created:     2/15/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: FIR Filter Module
module fir_filter(
	input wire clk,n_reset,data_ready,load_coeff,
	input wire [15:0] sample_data,
	input wire [15:0] fir_coefficient,
	output wire one_k_samples,modwait,err,
	output wire [15:0] fir_out
);

	reg synced_data;
	reg synced_coefficient;
	reg cnt_up;
	reg clear;
	reg [9:0] count;
	reg [16:0] outreg_data;
	reg overflow;
	reg [2:0] op;
	reg [3:0] src1;
	reg [3:0] src2;
	reg [3:0] dest;


	sync_low	sync_data(.clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(synced_data));
	sync_low 	sync_coeff(.clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(synced_coefficient));

	counter		count_num(.clk(clk), .n_reset(n_reset), .clear(clear), .cnt_up(cnt_up), .one_k_samples(one_k_samples));

	magnitude	mag(.in(outreg_data), .out(fir_out));

	datapath	path(.clk(clk), .n_reset(n_reset), .ext_data1(sample_data), .ext_data2(fir_coefficient), .overflow(overflow), .op(op), .src1(src1), .src2(src2), .dest(dest), .outreg_data(outreg_data));

	controller	control(.clk(clk), .n_reset(n_reset), .dr(synced_data), .lc(synced_coefficient), .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), .op(op), .src1(src1), .src2(src2), .dest(dest), .err(err));

endmodule
