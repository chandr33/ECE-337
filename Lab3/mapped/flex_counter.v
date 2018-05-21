/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb  8 15:57:20 2018
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, count_enable, clear, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, count_enable, clear;
  output rollover_flag;
  wire   next_flag, n13, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73;
  wire   [3:0] next_count;

  DFFSR rollover_flag_reg ( .D(next_flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n13), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  MUX2X1 U47 ( .B(n47), .A(n48), .S(count_enable), .Y(next_flag) );
  NAND3X1 U48 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  NOR2X1 U49 ( .A(n52), .B(n53), .Y(n51) );
  XOR2X1 U50 ( .A(n13), .B(rollover_val[2]), .Y(n53) );
  XOR2X1 U51 ( .A(next_count[0]), .B(rollover_val[0]), .Y(n52) );
  XOR2X1 U52 ( .A(n54), .B(rollover_val[1]), .Y(n50) );
  XOR2X1 U53 ( .A(n55), .B(rollover_val[3]), .Y(n49) );
  NAND3X1 U54 ( .A(n56), .B(n57), .C(n58), .Y(n47) );
  NOR2X1 U55 ( .A(n59), .B(n60), .Y(n58) );
  XOR2X1 U56 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n60) );
  XOR2X1 U57 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n59) );
  XOR2X1 U58 ( .A(rollover_val[1]), .B(n61), .Y(n57) );
  XOR2X1 U59 ( .A(rollover_val[2]), .B(n62), .Y(n56) );
  INVX1 U60 ( .A(n55), .Y(next_count[3]) );
  MUX2X1 U61 ( .B(n63), .A(n64), .S(count_out[3]), .Y(n55) );
  OAI21X1 U62 ( .A(count_out[2]), .B(n65), .C(n66), .Y(n64) );
  NOR2X1 U63 ( .A(n62), .B(n67), .Y(n63) );
  INVX1 U64 ( .A(count_out[2]), .Y(n62) );
  INVX1 U65 ( .A(n54), .Y(next_count[1]) );
  MUX2X1 U66 ( .B(n68), .A(n69), .S(count_out[1]), .Y(n54) );
  AND2X1 U67 ( .A(n70), .B(count_out[0]), .Y(n68) );
  OAI22X1 U68 ( .A(count_out[0]), .B(n65), .C(clear), .D(n71), .Y(
        next_count[0]) );
  MUX2X1 U69 ( .B(count_out[0]), .A(rollover_flag), .S(count_enable), .Y(n71)
         );
  MUX2X1 U70 ( .B(n67), .A(n66), .S(count_out[2]), .Y(n13) );
  AOI21X1 U71 ( .A(n61), .B(n70), .C(n69), .Y(n66) );
  OAI22X1 U72 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n65), .Y(n69) );
  INVX1 U73 ( .A(count_out[1]), .Y(n61) );
  NAND3X1 U74 ( .A(count_out[0]), .B(n70), .C(count_out[1]), .Y(n67) );
  INVX1 U75 ( .A(n65), .Y(n70) );
  NAND3X1 U76 ( .A(n72), .B(n73), .C(count_enable), .Y(n65) );
  INVX1 U77 ( .A(rollover_flag), .Y(n73) );
  INVX1 U78 ( .A(clear), .Y(n72) );
endmodule

