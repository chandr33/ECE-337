/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Mar 29 20:17:37 2018
/////////////////////////////////////////////////////////////


module rcu ( clk, n_rst, d_edge, eop, shift_enable, rcv_data, byte_received, 
        rcving, w_enable, r_error );
  input [7:0] rcv_data;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output rcving, w_enable, r_error;
  wire   n5, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146;
  wire   [3:0] current_state;

  DFFSR \current_state_reg[0]  ( .D(n79), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current_state[0]) );
  DFFSR \current_state_reg[3]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current_state[3]) );
  DFFSR \current_state_reg[2]  ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current_state[2]) );
  DFFSR \current_state_reg[1]  ( .D(n78), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current_state[1]) );
  NAND3X1 U85 ( .A(n80), .B(n81), .C(n82), .Y(rcving) );
  AOI22X1 U86 ( .A(n83), .B(current_state[2]), .C(current_state[1]), .D(n84), 
        .Y(n82) );
  NOR2X1 U87 ( .A(current_state[3]), .B(current_state[0]), .Y(n83) );
  OAI21X1 U88 ( .A(n85), .B(n86), .C(n81), .Y(r_error) );
  OAI21X1 U89 ( .A(n87), .B(n85), .C(n88), .Y(n79) );
  OAI21X1 U90 ( .A(n89), .B(n90), .C(n91), .Y(n88) );
  OAI21X1 U91 ( .A(n92), .B(n93), .C(n94), .Y(n90) );
  NAND3X1 U92 ( .A(n95), .B(n96), .C(n97), .Y(n89) );
  AND2X1 U93 ( .A(n86), .B(n98), .Y(n87) );
  OAI21X1 U94 ( .A(n98), .B(n99), .C(n100), .Y(n78) );
  OAI21X1 U95 ( .A(n101), .B(n102), .C(n91), .Y(n100) );
  OAI21X1 U96 ( .A(n103), .B(n97), .C(n104), .Y(n102) );
  INVX1 U97 ( .A(n105), .Y(n104) );
  MUX2X1 U98 ( .B(n86), .A(n106), .S(d_edge), .Y(n105) );
  OAI21X1 U99 ( .A(n107), .B(n108), .C(n109), .Y(n101) );
  NOR2X1 U100 ( .A(w_enable), .B(n110), .Y(n109) );
  NOR2X1 U101 ( .A(n111), .B(n112), .Y(n98) );
  NAND2X1 U102 ( .A(n113), .B(n114), .Y(n77) );
  AOI21X1 U103 ( .A(n115), .B(n103), .C(n116), .Y(n114) );
  OAI21X1 U104 ( .A(n108), .B(n117), .C(n93), .Y(n116) );
  OR2X1 U105 ( .A(n118), .B(byte_received), .Y(n117) );
  OR2X1 U106 ( .A(n119), .B(n120), .Y(n103) );
  NAND3X1 U107 ( .A(rcv_data[7]), .B(n121), .C(n122), .Y(n120) );
  NOR2X1 U108 ( .A(rcv_data[2]), .B(rcv_data[1]), .Y(n122) );
  INVX1 U109 ( .A(rcv_data[0]), .Y(n121) );
  NAND2X1 U110 ( .A(n123), .B(n124), .Y(n119) );
  NOR2X1 U111 ( .A(rcv_data[6]), .B(rcv_data[5]), .Y(n124) );
  NOR2X1 U112 ( .A(rcv_data[4]), .B(rcv_data[3]), .Y(n123) );
  INVX1 U113 ( .A(n97), .Y(n115) );
  AOI22X1 U114 ( .A(n112), .B(current_state[3]), .C(n125), .D(n126), .Y(n113)
         );
  INVX1 U115 ( .A(n127), .Y(n5) );
  OAI21X1 U116 ( .A(n128), .B(n129), .C(n91), .Y(n127) );
  INVX1 U117 ( .A(n111), .Y(n91) );
  OAI21X1 U118 ( .A(byte_received), .B(n130), .C(n131), .Y(n111) );
  AOI22X1 U119 ( .A(n132), .B(n133), .C(n134), .D(n126), .Y(n131) );
  INVX1 U120 ( .A(d_edge), .Y(n126) );
  INVX1 U121 ( .A(n95), .Y(n134) );
  NAND3X1 U122 ( .A(n85), .B(n99), .C(n84), .Y(n95) );
  AND2X1 U123 ( .A(n92), .B(n108), .Y(n132) );
  NAND2X1 U124 ( .A(shift_enable), .B(n135), .Y(n92) );
  INVX1 U125 ( .A(eop), .Y(n135) );
  OAI21X1 U126 ( .A(d_edge), .B(n86), .C(n94), .Y(n129) );
  AOI22X1 U127 ( .A(n136), .B(byte_received), .C(n125), .D(d_edge), .Y(n94) );
  OAI21X1 U128 ( .A(n137), .B(n138), .C(n139), .Y(n128) );
  AOI21X1 U129 ( .A(n136), .B(n108), .C(n140), .Y(n139) );
  INVX1 U130 ( .A(n107), .Y(n140) );
  NAND2X1 U131 ( .A(eop), .B(shift_enable), .Y(n108) );
  INVX1 U132 ( .A(n112), .Y(n138) );
  NOR2X1 U133 ( .A(n141), .B(n142), .Y(n112) );
  NAND3X1 U134 ( .A(n97), .B(n106), .C(n143), .Y(n142) );
  INVX1 U135 ( .A(n133), .Y(n143) );
  NAND2X1 U136 ( .A(n107), .B(n93), .Y(n133) );
  OR2X1 U137 ( .A(n81), .B(n85), .Y(n93) );
  NAND3X1 U138 ( .A(n84), .B(current_state[0]), .C(current_state[1]), .Y(n107)
         );
  INVX1 U139 ( .A(n125), .Y(n106) );
  NOR2X1 U140 ( .A(n81), .B(current_state[0]), .Y(n125) );
  NAND3X1 U141 ( .A(n99), .B(n137), .C(current_state[3]), .Y(n81) );
  NAND3X1 U142 ( .A(n84), .B(n85), .C(current_state[1]), .Y(n97) );
  NAND3X1 U143 ( .A(n86), .B(n96), .C(n144), .Y(n141) );
  NOR2X1 U144 ( .A(n110), .B(n136), .Y(n144) );
  INVX1 U145 ( .A(n118), .Y(n136) );
  NAND3X1 U146 ( .A(current_state[2]), .B(n85), .C(n145), .Y(n118) );
  NOR2X1 U147 ( .A(current_state[3]), .B(current_state[1]), .Y(n145) );
  INVX1 U148 ( .A(current_state[0]), .Y(n85) );
  INVX1 U149 ( .A(n130), .Y(n110) );
  NAND3X1 U150 ( .A(current_state[0]), .B(n99), .C(n84), .Y(n130) );
  NOR2X1 U151 ( .A(current_state[2]), .B(current_state[3]), .Y(n84) );
  INVX1 U152 ( .A(w_enable), .Y(n96) );
  NOR2X1 U153 ( .A(n137), .B(n80), .Y(w_enable) );
  NAND3X1 U154 ( .A(n99), .B(n146), .C(current_state[0]), .Y(n80) );
  INVX1 U155 ( .A(current_state[1]), .Y(n99) );
  NAND3X1 U156 ( .A(current_state[2]), .B(n146), .C(current_state[1]), .Y(n86)
         );
  INVX1 U157 ( .A(current_state[3]), .Y(n146) );
  INVX1 U158 ( .A(current_state[2]), .Y(n137) );
endmodule

