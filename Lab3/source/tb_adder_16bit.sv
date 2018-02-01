// $Id: $
// File name:   tb_adder_16bit.sv
// Created:     1/30/2018
// Author:      Rochak Chandra
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry
// Description: Test Bench for 16 bit Adder
`timescale 1ns / 100ps

module tb_adder_16bit
();
	// Define local parameters used by the test bench
	localparam NUM_INPUT_BITS			= 16;
	localparam NUM_OUTPUT_BITS		= NUM_INPUT_BITS + 1;
	localparam MAX_OUTPUT_BIT			= NUM_OUTPUT_BITS - 1;
	localparam NUM_TEST_BITS 			= (NUM_INPUT_BITS * 2) + 1;
	localparam MAX_TEST_BIT				= NUM_TEST_BITS - 1;
	localparam NUM_TEST_CASES 		= 2 ** NUM_TEST_BITS;
	localparam MAX_TEST_VALUE 		= NUM_TEST_CASES - 1;
	localparam TEST_A_BIT					= 0;
	localparam TEST_B_BIT					= NUM_INPUT_BITS;
	localparam TEST_CARRY_IN_BIT	= MAX_TEST_BIT;
	localparam TEST_SUM_BIT				= 0;
	localparam TEST_CARRY_OUT_BIT	= MAX_OUTPUT_BIT;
	localparam TEST_DELAY					= 10;
	
	// Declare Design Under Test (DUT) portmap signals
	reg	[15:0] tb_a;
	reg	[15:0] tb_b;
	reg	tb_carry_in;
	reg	[15:0] tb_sum;
	reg	tb_carry_out;
	reg     no_match;
	
	// Declare test bench signals
	integer tb_test_case;
	reg [MAX_TEST_BIT:0] tb_test_inputs;
	reg [MAX_OUTPUT_BIT:0] tb_expected_outputs;
	
	// DUT port map
	adder_16bit DUT(.a(tb_a), .b(tb_b), .carry_in(tb_carry_in), .sum(tb_sum), .overflow(tb_carry_out));
	
	// Connect individual test input bits to a vector for easier testing
	assign tb_a					= tb_test_inputs[15:0];
	assign tb_b					= tb_test_inputs[31:16];
	assign tb_carry_in	= tb_test_inputs[TEST_CARRY_IN_BIT];

	initial 
	begin
		no_match=1'b0;
		tb_test_inputs[15:0] = 16'h0000;
		tb_test_inputs[31:16] = 16'h0000;
		tb_test_inputs[32] = 1'b0;
		// Calculate the expected outputs
		#1;
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin
			no_match = 1'b1; 
			$error("Incorrect Sum value for test case 1!");
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		else
		begin 
			no_match = 1'b1;
			$error("Incorrect Carry Out value for test case 1!");
		end

		#1;


		tb_test_inputs[15:0] = 16'hFFFF;
		tb_test_inputs[31:16] = 16'h0000;
		tb_test_inputs[32] = 1'b1;
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin
			no_match = 1'b1; 
			$error("Incorrect Sum value for test case 1!");
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		else
		begin 
			no_match = 1'b1;
			$error("Incorrect Carry Out value for test case 1!");
		end

		#1;

		tb_test_inputs[15:0] = 16'h0000;
		tb_test_inputs[31:16] = 16'hAAAA;
		tb_test_inputs[32] = 1'b0;
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin
			no_match = 1'b1; 
			$error("Incorrect Sum value for test case 1!");
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		else
		begin 
			no_match = 1'b1;
			$error("Incorrect Carry Out value for test case 1!");
		end

		#1;
	
				
		tb_test_inputs[15:0] = 16'hFFFF;
		tb_test_inputs[31:16] = 16'hACAA;
		tb_test_inputs[32] = 1'b1;
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin
			no_match = 1'b1; 
			$error("Incorrect Sum value for test case 1!");
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		else
		begin 
			no_match = 1'b1;
			$error("Incorrect Carry Out value for test case 1!");
		end

		#1;

		tb_test_inputs[15:0] = 16'h0000;
		tb_test_inputs[31:16] = 16'h0011;
		tb_test_inputs[32] = 1'b0;
		// Calculate the expected outputs
		tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
		// Wait for DUT to process the inputs
		#(TEST_DELAY - 1);
			
		// Check the DUT's Sum output value
		assert(tb_expected_outputs[15:0] == tb_sum)
		else
		begin
			no_match = 1'b1; 
			$error("Incorrect Sum value for test case 1!");
		end
			
		// Check the DUT's Carry Out output value
		assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
		else
		begin 
			no_match = 1'b1;
			$error("Incorrect Carry Out value for test case 1!");
		end

	end
endmodule
