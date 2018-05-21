// $Id: $
// File name:   usb_receiver.sv
// Created:     2/23/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: USB Receiver
module usb_receiver (

	input wire clk,n_rst,d_plus,d_minus,r_enable,
	output wire [7:0] r_data,
	output wire empty,full,rcving,r_error
);

	reg d_plus_sync,d_minus_sync,d_edge,eop,shift_enable,d_orig,byte_received;
	reg [7:0] rcv_data;
	reg w_enable; 

	sync_high HIGH (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));
	sync_low LOW (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));
	edge_detect DETECT(.clk(clk), .n_rst(n_rst), .d_plus(d_plus), .d_edge(d_edge));
	eop_detect DETECT_EOP(.d_plus(d_plus), .d_minus(d_minus), .eop(eop));
	decode DECODE(.clk(clk), .n_rst(n_rst), .d_plus(d_plus), .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig));
	rx_fifo RX_FIFO(.clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(w_enable), .r_data(r_data), .w_data(rcv_data), .full(full), .empty(empty));
	timer TIMER(.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), .shift_enable(shift_enable), .byte_received(byte_received));
	rcu RCU(.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), .shift_enable(shift_enable), .byte_received(byte_received), .eop(eop), .w_enable(w_enable), .r_error(r_error), .rcv_data(rcv_data));
	shift_register SHIFT(.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .d_orig(d_orig), .rcv_data(rcv_data));

endmodule
