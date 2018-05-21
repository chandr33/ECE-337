// $Id: $
// File name:   rcv_block.sv
// Created:     2/8/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: RCV Block
module rcv_block
(
	input wire clk, n_rst, serial_in, data_read,
	output reg [7:0] rx_data,
	output reg data_ready, overrun_error, framing_error
);
	reg shift_strobe;
	reg [7:0]packet_data;
	reg stop_bit;
	reg load_buffer;

	reg sbc_enable;
	reg sbc_clear;
	reg enable_timer;
	reg packet_done;
	reg start_bit_detected;



	sr_9bit SHIFT_REGISTER 
	(
		.clk         (clk),
		.n_rst       (n_rst),
		.shift_strobe(shift_strobe),
		.packet_data (packet_data),
		.stop_bit    (stop_bit),
		.serial_in   (serial_in)
	);

	start_bit_det START_BIT
	(
		.clk               (clk),
		.n_rst             (n_rst),
		.serial_in         (serial_in),
		.start_bit_detected(start_bit_detected)	
	);

	stop_bit_chk STOP_BIT_CHECK
	(
		.clk          (clk),
		.n_rst        (n_rst),
		.sbc_enable   (sbc_enable),
		.stop_bit     (stop_bit),
		.sbc_clear    (sbc_clear),
		.framing_error(framing_error)
	);

	timer TIMER 
	(
		.clk         (clk),
		.n_rst       (n_rst),
		.packet_done (packet_done),
		.enable_timer(enable_timer),
		.shift_strobe(shift_strobe)
	);

	rcu RCU 
	(
		.clk               (clk),
		.n_rst             (n_rst),
		.packet_done       (packet_done),
		.enable_timer      (enable_timer),
		.start_bit_detected(start_bit_detected),
		.framing_error     (framing_error),
		.sbc_clear         (sbc_clear),
		.sbc_enable        (sbc_enable),
		.load_buffer       (load_buffer)

	);

	rx_data_buff RX_DATA_BUFFER
	(
		.clk          (clk),
		.n_rst        (n_rst),
		.load_buffer  (load_buffer),
		.packet_data  (packet_data),
		.data_read    (data_read),
		.rx_data      (rx_data),
		.data_ready   (data_ready),
		.overrun_error(overrun_error)
	);
	
endmodule
