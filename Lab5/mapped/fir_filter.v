/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Feb 16 01:15:03 2018
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   Q;

  DFFSR Q_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(Q) );
  DFFSR sync_out_reg ( .D(Q), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   Q;

  DFFSR Q_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(Q) );
  DFFSR sync_out_reg ( .D(Q), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  XOR2X1 U1 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, count_enable, clear, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, count_enable, clear;
  output rollover_flag;
  wire   \next_count[0] , next_flag, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n1, n2, n3, n4, n5, n6, n7, n8, n20, n21, n22, n23;
  wire   SYNOPSYS_UNCONNECTED__0;

  DFFSR rollover_flag_reg ( .D(next_flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[0]  ( .D(\next_count[0] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n8), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  AND2X2 U14 ( .A(rollover_flag), .B(count_enable), .Y(n61) );
  NOR2X1 U28 ( .A(n33), .B(n34), .Y(next_flag) );
  NAND3X1 U29 ( .A(n35), .B(n36), .C(n37), .Y(n34) );
  NOR2X1 U30 ( .A(n38), .B(n39), .Y(n37) );
  NAND2X1 U31 ( .A(n40), .B(n41), .Y(n39) );
  XOR2X1 U32 ( .A(rollover_val[4]), .B(n42), .Y(n41) );
  XOR2X1 U33 ( .A(rollover_val[5]), .B(n43), .Y(n40) );
  XOR2X1 U34 ( .A(n2), .B(rollover_val[2]), .Y(n38) );
  XOR2X1 U35 ( .A(rollover_val[1]), .B(n44), .Y(n36) );
  XNOR2X1 U36 ( .A(rollover_val[0]), .B(\next_count[0] ), .Y(n35) );
  OR2X1 U37 ( .A(n45), .B(n46), .Y(n33) );
  NAND3X1 U38 ( .A(n47), .B(n48), .C(n49), .Y(n46) );
  XOR2X1 U39 ( .A(rollover_val[9]), .B(n50), .Y(n49) );
  XOR2X1 U40 ( .A(rollover_val[6]), .B(n51), .Y(n48) );
  XOR2X1 U41 ( .A(rollover_val[7]), .B(n52), .Y(n47) );
  NAND3X1 U42 ( .A(n53), .B(n22), .C(n54), .Y(n45) );
  XOR2X1 U43 ( .A(rollover_val[8]), .B(n55), .Y(n54) );
  XOR2X1 U44 ( .A(rollover_val[3]), .B(n56), .Y(n53) );
  AOI22X1 U45 ( .A(count_out[9]), .B(n57), .C(N16), .D(n21), .Y(n50) );
  AOI22X1 U46 ( .A(count_out[8]), .B(n57), .C(N15), .D(n21), .Y(n55) );
  AOI22X1 U47 ( .A(count_out[7]), .B(n57), .C(N14), .D(n21), .Y(n52) );
  AOI22X1 U48 ( .A(count_out[6]), .B(n57), .C(N13), .D(n21), .Y(n51) );
  AOI22X1 U49 ( .A(count_out[5]), .B(n57), .C(N12), .D(n21), .Y(n43) );
  AOI22X1 U50 ( .A(count_out[4]), .B(n57), .C(N11), .D(n21), .Y(n42) );
  AOI22X1 U51 ( .A(count_out[3]), .B(n57), .C(N10), .D(n21), .Y(n56) );
  AOI22X1 U52 ( .A(count_out[2]), .B(n57), .C(N9), .D(n21), .Y(n58) );
  AOI22X1 U53 ( .A(count_out[1]), .B(n57), .C(N8), .D(n21), .Y(n44) );
  OAI21X1 U54 ( .A(n59), .B(count_out[0]), .C(n60), .Y(\next_count[0] ) );
  AOI22X1 U55 ( .A(n61), .B(n22), .C(count_out[0]), .D(n57), .Y(n60) );
  NOR3X1 U56 ( .A(n62), .B(clear), .C(n61), .Y(n57) );
  NAND2X1 U57 ( .A(n62), .B(n22), .Y(n59) );
  NOR2X1 U58 ( .A(n23), .B(rollover_flag), .Y(n62) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_49 ( .A(count_out), .SUM({N16, 
        N15, N14, N13, N12, N11, N10, N9, N8, SYNOPSYS_UNCONNECTED__0}) );
  INVX2 U15 ( .A(n59), .Y(n21) );
  INVX2 U16 ( .A(n44), .Y(n1) );
  INVX2 U17 ( .A(n58), .Y(n2) );
  INVX2 U18 ( .A(n56), .Y(n3) );
  INVX2 U19 ( .A(n42), .Y(n4) );
  INVX2 U20 ( .A(n43), .Y(n5) );
  INVX2 U21 ( .A(n51), .Y(n6) );
  INVX2 U22 ( .A(n52), .Y(n7) );
  INVX2 U23 ( .A(n55), .Y(n8) );
  INVX2 U24 ( .A(n50), .Y(n20) );
  INVX2 U25 ( .A(clear), .Y(n22) );
  INVX2 U26 ( .A(count_enable), .Y(n23) );
endmodule


module counter ( clk, n_reset, cnt_up, clear, one_k_samples );
  input clk, n_reset, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 counter ( .clk(clk), .n_rst(n_reset), 
        .count_enable(cnt_up), .clear(clear), .rollover_val({1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        one_k_samples) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, \sub_add_17_b0/carry[15] , \sub_add_17_b0/carry[14] ,
         \sub_add_17_b0/carry[13] , \sub_add_17_b0/carry[12] ,
         \sub_add_17_b0/carry[11] , \sub_add_17_b0/carry[10] ,
         \sub_add_17_b0/carry[9] , \sub_add_17_b0/carry[8] ,
         \sub_add_17_b0/carry[7] , \sub_add_17_b0/carry[6] ,
         \sub_add_17_b0/carry[5] , \sub_add_17_b0/carry[4] ,
         \sub_add_17_b0/carry[3] , \sub_add_17_b0/carry[2] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  assign N2 = in[0];

  AOI22X1 U22 ( .A(n2), .B(N11), .C(in[9]), .D(n1), .Y(n22) );
  AOI22X1 U23 ( .A(N10), .B(in[16]), .C(in[8]), .D(n1), .Y(n23) );
  AOI22X1 U24 ( .A(N9), .B(in[16]), .C(in[7]), .D(n1), .Y(n24) );
  AOI22X1 U25 ( .A(N8), .B(in[16]), .C(in[6]), .D(n1), .Y(n25) );
  AOI22X1 U26 ( .A(N7), .B(in[16]), .C(in[5]), .D(n1), .Y(n26) );
  AOI22X1 U27 ( .A(N6), .B(n2), .C(in[4]), .D(n1), .Y(n27) );
  AOI22X1 U28 ( .A(N5), .B(in[16]), .C(in[3]), .D(n1), .Y(n28) );
  AOI22X1 U29 ( .A(N4), .B(n2), .C(in[2]), .D(n1), .Y(n29) );
  AOI22X1 U30 ( .A(N3), .B(n2), .C(in[1]), .D(n1), .Y(n30) );
  AOI22X1 U31 ( .A(N17), .B(n2), .C(in[15]), .D(n1), .Y(n31) );
  AOI22X1 U32 ( .A(N16), .B(n2), .C(in[14]), .D(n1), .Y(n32) );
  AOI22X1 U33 ( .A(N15), .B(n2), .C(in[13]), .D(n1), .Y(n33) );
  AOI22X1 U34 ( .A(N14), .B(n2), .C(in[12]), .D(n1), .Y(n34) );
  AOI22X1 U35 ( .A(N13), .B(n2), .C(in[11]), .D(n1), .Y(n35) );
  AOI22X1 U36 ( .A(N12), .B(n2), .C(in[10]), .D(n1), .Y(n36) );
  AOI22X1 U37 ( .A(N2), .B(n2), .C(N2), .D(n1), .Y(n37) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  XOR2X1 U4 ( .A(n18), .B(\sub_add_17_b0/carry[15] ), .Y(N17) );
  AND2X1 U5 ( .A(n17), .B(\sub_add_17_b0/carry[14] ), .Y(
        \sub_add_17_b0/carry[15] ) );
  XOR2X1 U6 ( .A(\sub_add_17_b0/carry[14] ), .B(n17), .Y(N16) );
  AND2X1 U7 ( .A(n16), .B(\sub_add_17_b0/carry[13] ), .Y(
        \sub_add_17_b0/carry[14] ) );
  XOR2X1 U8 ( .A(\sub_add_17_b0/carry[13] ), .B(n16), .Y(N15) );
  AND2X1 U9 ( .A(n15), .B(\sub_add_17_b0/carry[12] ), .Y(
        \sub_add_17_b0/carry[13] ) );
  XOR2X1 U10 ( .A(\sub_add_17_b0/carry[12] ), .B(n15), .Y(N14) );
  AND2X1 U11 ( .A(n14), .B(\sub_add_17_b0/carry[11] ), .Y(
        \sub_add_17_b0/carry[12] ) );
  XOR2X1 U12 ( .A(\sub_add_17_b0/carry[11] ), .B(n14), .Y(N13) );
  AND2X1 U13 ( .A(n13), .B(\sub_add_17_b0/carry[10] ), .Y(
        \sub_add_17_b0/carry[11] ) );
  XOR2X1 U14 ( .A(\sub_add_17_b0/carry[10] ), .B(n13), .Y(N12) );
  AND2X1 U15 ( .A(n12), .B(\sub_add_17_b0/carry[9] ), .Y(
        \sub_add_17_b0/carry[10] ) );
  XOR2X1 U16 ( .A(\sub_add_17_b0/carry[9] ), .B(n12), .Y(N11) );
  AND2X1 U17 ( .A(n11), .B(\sub_add_17_b0/carry[8] ), .Y(
        \sub_add_17_b0/carry[9] ) );
  XOR2X1 U18 ( .A(\sub_add_17_b0/carry[8] ), .B(n11), .Y(N10) );
  AND2X1 U19 ( .A(n10), .B(\sub_add_17_b0/carry[7] ), .Y(
        \sub_add_17_b0/carry[8] ) );
  XOR2X1 U20 ( .A(\sub_add_17_b0/carry[7] ), .B(n10), .Y(N9) );
  AND2X1 U21 ( .A(n9), .B(\sub_add_17_b0/carry[6] ), .Y(
        \sub_add_17_b0/carry[7] ) );
  XOR2X1 U38 ( .A(\sub_add_17_b0/carry[6] ), .B(n9), .Y(N8) );
  AND2X1 U39 ( .A(n8), .B(\sub_add_17_b0/carry[5] ), .Y(
        \sub_add_17_b0/carry[6] ) );
  XOR2X1 U40 ( .A(\sub_add_17_b0/carry[5] ), .B(n8), .Y(N7) );
  AND2X1 U41 ( .A(n7), .B(\sub_add_17_b0/carry[4] ), .Y(
        \sub_add_17_b0/carry[5] ) );
  XOR2X1 U42 ( .A(\sub_add_17_b0/carry[4] ), .B(n7), .Y(N6) );
  AND2X1 U43 ( .A(n6), .B(\sub_add_17_b0/carry[3] ), .Y(
        \sub_add_17_b0/carry[4] ) );
  XOR2X1 U44 ( .A(\sub_add_17_b0/carry[3] ), .B(n6), .Y(N5) );
  AND2X1 U45 ( .A(n5), .B(\sub_add_17_b0/carry[2] ), .Y(
        \sub_add_17_b0/carry[3] ) );
  XOR2X1 U46 ( .A(\sub_add_17_b0/carry[2] ), .B(n5), .Y(N4) );
  AND2X1 U47 ( .A(n4), .B(n3), .Y(\sub_add_17_b0/carry[2] ) );
  XOR2X1 U48 ( .A(n3), .B(n4), .Y(N3) );
  INVX2 U49 ( .A(N2), .Y(n3) );
  INVX2 U50 ( .A(in[1]), .Y(n4) );
  INVX2 U51 ( .A(in[2]), .Y(n5) );
  INVX2 U52 ( .A(in[3]), .Y(n6) );
  INVX2 U53 ( .A(in[4]), .Y(n7) );
  INVX2 U54 ( .A(in[5]), .Y(n8) );
  INVX2 U55 ( .A(in[6]), .Y(n9) );
  INVX2 U56 ( .A(in[7]), .Y(n10) );
  INVX2 U57 ( .A(in[8]), .Y(n11) );
  INVX2 U58 ( .A(in[9]), .Y(n12) );
  INVX2 U59 ( .A(in[10]), .Y(n13) );
  INVX2 U60 ( .A(in[11]), .Y(n14) );
  INVX2 U61 ( .A(in[12]), .Y(n15) );
  INVX2 U62 ( .A(in[13]), .Y(n16) );
  INVX2 U63 ( .A(in[14]), .Y(n17) );
  INVX2 U64 ( .A(in[15]), .Y(n18) );
  INVX2 U65 ( .A(n31), .Y(out[15]) );
  INVX2 U66 ( .A(n32), .Y(out[14]) );
  INVX2 U67 ( .A(n33), .Y(out[13]) );
  INVX2 U68 ( .A(n34), .Y(out[12]) );
  INVX2 U69 ( .A(n35), .Y(out[11]) );
  INVX2 U70 ( .A(n36), .Y(out[10]) );
  INVX2 U71 ( .A(n22), .Y(out[9]) );
  INVX2 U72 ( .A(n23), .Y(out[8]) );
  INVX2 U73 ( .A(n24), .Y(out[7]) );
  INVX2 U74 ( .A(n25), .Y(out[6]) );
  INVX2 U75 ( .A(n26), .Y(out[5]) );
  INVX2 U76 ( .A(n27), .Y(out[4]) );
  INVX2 U77 ( .A(n28), .Y(out[3]) );
  INVX2 U78 ( .A(n29), .Y(out[2]) );
  INVX2 U79 ( .A(n30), .Y(out[1]) );
  INVX2 U80 ( .A(n37), .Y(out[0]) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n103, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174;

  FAX1 U2 ( .A(n103), .B(B[16]), .C(n16), .YC(n15), .YS(DIFF[16]) );
  FAX1 U3 ( .A(A[15]), .B(n87), .C(n17), .YC(n16), .YS(DIFF[15]) );
  XOR2X1 U4 ( .A(n20), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n172), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n172), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  AOI21X1 U25 ( .A(n173), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n173), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n36), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n171), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n171), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n165), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n170), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n170), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n163), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n57), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n169), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n169), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n167), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n63), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(n99), .Y(n63) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n168), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n174), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U102 ( .A(A[0]), .B(n174), .Y(n72) );
  OR2X2 U123 ( .A(A[5]), .B(n97), .Y(n169) );
  INVX1 U124 ( .A(B[13]), .Y(n89) );
  INVX1 U125 ( .A(B[2]), .Y(n100) );
  INVX1 U126 ( .A(B[10]), .Y(n92) );
  INVX1 U127 ( .A(B[11]), .Y(n91) );
  INVX1 U128 ( .A(B[5]), .Y(n97) );
  INVX1 U129 ( .A(B[4]), .Y(n98) );
  INVX1 U130 ( .A(n52), .Y(n162) );
  INVX2 U131 ( .A(n162), .Y(n163) );
  INVX1 U132 ( .A(n44), .Y(n164) );
  INVX2 U133 ( .A(n164), .Y(n165) );
  INVX1 U134 ( .A(n60), .Y(n166) );
  INVX2 U135 ( .A(n166), .Y(n167) );
  INVX1 U136 ( .A(n66), .Y(n85) );
  INVX1 U137 ( .A(n63), .Y(n84) );
  INVX1 U138 ( .A(B[14]), .Y(n88) );
  INVX1 U139 ( .A(n70), .Y(n86) );
  INVX1 U140 ( .A(B[15]), .Y(n87) );
  NOR2X1 U141 ( .A(A[0]), .B(n174), .Y(n168) );
  INVX2 U142 ( .A(B[6]), .Y(n96) );
  INVX1 U143 ( .A(n50), .Y(n81) );
  INVX4 U144 ( .A(B[0]), .Y(n174) );
  XNOR2X1 U145 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  XOR2X1 U146 ( .A(n28), .B(n3), .Y(DIFF[12]) );
  OR2X2 U147 ( .A(A[7]), .B(n95), .Y(n170) );
  OR2X2 U148 ( .A(A[9]), .B(n93), .Y(n171) );
  OR2X2 U149 ( .A(A[11]), .B(n91), .Y(n173) );
  OR2X2 U150 ( .A(A[13]), .B(n89), .Y(n172) );
  INVX1 U151 ( .A(B[8]), .Y(n94) );
  INVX1 U152 ( .A(B[3]), .Y(n99) );
  INVX1 U153 ( .A(B[1]), .Y(n101) );
  INVX2 U154 ( .A(B[7]), .Y(n95) );
  INVX2 U155 ( .A(B[9]), .Y(n93) );
  INVX2 U156 ( .A(B[12]), .Y(n90) );
  INVX2 U157 ( .A(n58), .Y(n83) );
  INVX2 U158 ( .A(n42), .Y(n79) );
  INVX2 U159 ( .A(n34), .Y(n77) );
  INVX2 U160 ( .A(n26), .Y(n75) );
  INVX2 U161 ( .A(n18), .Y(n73) );
  INVX2 U162 ( .A(n69), .Y(n68) );
  INVX2 U163 ( .A(n56), .Y(n54) );
  INVX2 U164 ( .A(n48), .Y(n46) );
  INVX2 U165 ( .A(n40), .Y(n38) );
  INVX2 U166 ( .A(n32), .Y(n30) );
  INVX2 U167 ( .A(n24), .Y(n22) );
  INVX2 U168 ( .A(A[17]), .Y(n103) );
  INVX2 U169 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174;

  XNOR2X1 U5 ( .A(n23), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n171), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n171), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(B[14]), .Y(n22) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n24) );
  NAND2X1 U18 ( .A(A[13]), .B(B[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n164), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n31), .B(n169), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n169), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(B[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n174), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2X1 U32 ( .A(A[11]), .B(B[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n168), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n168), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(B[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n42), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n40) );
  NAND2X1 U46 ( .A(A[9]), .B(B[9]), .Y(n41) );
  AOI21X1 U48 ( .A(n170), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n170), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(B[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n154), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2X1 U60 ( .A(A[7]), .B(B[7]), .Y(n49) );
  AOI21X1 U62 ( .A(n166), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n166), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(B[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n58), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n56) );
  NAND2X1 U74 ( .A(A[5]), .B(B[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n63), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n167), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n167), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(B[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n163), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U88 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n71), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n165), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n165), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(B[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n14), .B(n75), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U102 ( .A(A[1]), .B(B[1]), .Y(n73) );
  NAND2X1 U107 ( .A(A[0]), .B(B[0]), .Y(n75) );
  OR2X1 U113 ( .A(A[2]), .B(B[2]), .Y(n165) );
  AND2X2 U114 ( .A(n75), .B(n172), .Y(SUM[0]) );
  INVX1 U115 ( .A(n50), .Y(n153) );
  INVX2 U116 ( .A(n153), .Y(n154) );
  OR2X2 U117 ( .A(A[4]), .B(B[4]), .Y(n167) );
  XOR2X1 U118 ( .A(A[15]), .B(B[15]), .Y(n155) );
  XOR2X1 U119 ( .A(n155), .B(n76), .Y(SUM[15]) );
  NAND2X1 U120 ( .A(A[15]), .B(B[15]), .Y(n156) );
  NAND2X1 U121 ( .A(A[15]), .B(n76), .Y(n157) );
  NAND2X1 U122 ( .A(B[15]), .B(n76), .Y(n158) );
  NAND3X1 U123 ( .A(n156), .B(n157), .C(n158), .Y(n17) );
  XOR2X1 U124 ( .A(n93), .B(n92), .Y(n159) );
  XOR2X1 U125 ( .A(n159), .B(n17), .Y(SUM[16]) );
  NAND2X1 U126 ( .A(n93), .B(n92), .Y(n160) );
  NAND2X1 U127 ( .A(n93), .B(n17), .Y(n161) );
  NAND2X1 U128 ( .A(n92), .B(n17), .Y(n162) );
  NAND3X1 U129 ( .A(n160), .B(n161), .C(n162), .Y(n16) );
  BUFX2 U130 ( .A(n66), .Y(n163) );
  BUFX2 U131 ( .A(n31), .Y(n164) );
  OR2X1 U132 ( .A(A[12]), .B(B[12]), .Y(n169) );
  INVX1 U133 ( .A(n64), .Y(n88) );
  OR2X1 U134 ( .A(A[10]), .B(B[10]), .Y(n168) );
  XOR2X1 U135 ( .A(n26), .B(n2), .Y(SUM[13]) );
  XNOR2X1 U136 ( .A(n47), .B(n7), .Y(SUM[8]) );
  XNOR2X1 U137 ( .A(n55), .B(n9), .Y(SUM[6]) );
  OR2X2 U138 ( .A(A[6]), .B(B[6]), .Y(n166) );
  OR2X2 U139 ( .A(A[8]), .B(B[8]), .Y(n170) );
  OR2X2 U140 ( .A(A[14]), .B(B[14]), .Y(n171) );
  OR2X1 U141 ( .A(A[0]), .B(B[0]), .Y(n172) );
  INVX1 U142 ( .A(n34), .Y(n173) );
  INVX2 U143 ( .A(n173), .Y(n174) );
  INVX2 U144 ( .A(A[17]), .Y(n93) );
  INVX2 U145 ( .A(B[17]), .Y(n92) );
  INVX2 U146 ( .A(n72), .Y(n90) );
  INVX2 U147 ( .A(n56), .Y(n86) );
  INVX2 U148 ( .A(n48), .Y(n84) );
  INVX2 U149 ( .A(n40), .Y(n82) );
  INVX2 U150 ( .A(n32), .Y(n80) );
  INVX2 U151 ( .A(n24), .Y(n78) );
  INVX2 U152 ( .A(n18), .Y(n76) );
  INVX2 U153 ( .A(n70), .Y(n68) );
  INVX2 U154 ( .A(n62), .Y(n60) );
  INVX2 U155 ( .A(n54), .Y(n52) );
  INVX2 U156 ( .A(n46), .Y(n44) );
  INVX2 U157 ( .A(n38), .Y(n36) );
  INVX2 U158 ( .A(n30), .Y(n28) );
  INVX2 U159 ( .A(n22), .Y(n20) );
  INVX2 U160 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n7, n13, n19, n22, n25, n31, n34, n37, n42, n46, n49, n51, n52,
         n53, n54, n57, n58, n59, n60, n65, n66, n67, n68, n69, n70, n72, n73,
         n74, n75, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n109, n111, n112, n113, n114, n115,
         n116, n120, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n133, n134, n135, n136, n140, n142, n144, n145, n146, n147, n148,
         n149, n151, n154, n155, n156, n159, n160, n161, n162, n163, n164,
         n165, n166, n169, n170, n171, n172, n173, n174, n177, n178, n179,
         n181, n182, n183, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n197, n198, n199, n200, n201, n202, n205, n206, n207,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n248, n249, n250, n251, n256, n257,
         n258, n259, n264, n265, n266, n267, n275, n279, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n545, n546, n548, n549, n551, n557, n560,
         n563, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682, n683, n684, n685, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708,
         n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, n719,
         n720, n721, n722, n723, n724, n725, n729, n730, n731, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n893, n894, n895, n897, n899,
         n900, n917, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063,
         n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073,
         n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103,
         n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113,
         n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123,
         n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133,
         n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143,
         n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153,
         n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163,
         n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  XOR2X1 U54 ( .A(n73), .B(n54), .Y(product[46]) );
  NAND2X1 U55 ( .A(n72), .B(n1021), .Y(n54) );
  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1256), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1125), .B(n1154), .Y(n74) );
  OAI21X1 U62 ( .A(n1164), .B(n1125), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1256), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1155), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1164), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1256), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1153), .Y(n96) );
  OAI21X1 U90 ( .A(n1163), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1157), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n130), .B(n106), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1133), .B(n1016), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1133), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1133), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1256), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1154), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1164), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1016), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1016), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1016), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  AOI21X1 U122 ( .A(n1256), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1153), .Y(n124) );
  OAI21X1 U124 ( .A(n1164), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n1157), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1256), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1157), .B(n1154), .Y(n135) );
  OAI21X1 U138 ( .A(n1163), .B(n1157), .C(n140), .Y(n136) );
  AOI21X1 U142 ( .A(n151), .B(n1128), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1128), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  AOI21X1 U150 ( .A(n1256), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1153), .Y(n146) );
  OAI21X1 U152 ( .A(n1164), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U160 ( .A(n330), .B(n339), .Y(n149) );
  AOI21X1 U162 ( .A(n155), .B(n1256), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n159), .B(n172), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n349), .B(n340), .Y(n161) );
  NAND2X1 U172 ( .A(n349), .B(n340), .Y(n162) );
  AOI21X1 U174 ( .A(n164), .B(n1256), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n996), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n166), .C(n169), .Y(n165) );
  NOR2X1 U181 ( .A(n361), .B(n350), .Y(n166) );
  NAND2X1 U182 ( .A(n361), .B(n350), .Y(n169) );
  AOI21X1 U184 ( .A(n171), .B(n1256), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1052), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1256), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n185), .B(n213), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n189), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1063), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n194), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1138), .B(n1015), .Y(n223) );
  AOI21X1 U258 ( .A(n1020), .B(n1015), .C(n1129), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1135), .B(n248), .C(n1139), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1141), .C(n1143), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1142), .C(n1144), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1145), .B(n1136), .C(n1137), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n585), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n601), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n310), .C(n315), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n587), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n619), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n605), .C(n621), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n637), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U330 ( .A(n622), .B(n606), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n353), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U334 ( .A(n355), .B(n346), .C(n344), .YC(n341), .YS(n342) );
  FAX1 U335 ( .A(n623), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n591), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n1229), .YC(n347), .YS(n348) );
  FAX1 U338 ( .A(n354), .B(n363), .C(n352), .YC(n349), .YS(n350) );
  FAX1 U339 ( .A(n356), .B(n367), .C(n365), .YC(n351), .YS(n352) );
  FAX1 U340 ( .A(n371), .B(n369), .C(n358), .YC(n353), .YS(n354) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n360), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U344 ( .A(n366), .B(n375), .C(n364), .YC(n361), .YS(n362) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U353 ( .A(n626), .B(n1176), .C(n397), .YC(n379), .YS(n380) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U360 ( .A(n413), .B(n1031), .C(n411), .YC(n393), .YS(n394) );
  FAX1 U361 ( .A(n659), .B(n611), .C(n643), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n627), .B(n675), .C(n595), .YC(n397), .YS(n398) );
  FAX1 U363 ( .A(n579), .B(n709), .C(n691), .YC(n399), .YS(n400) );
  FAX1 U364 ( .A(n406), .B(n404), .C(n417), .YC(n401), .YS(n402) );
  FAX1 U368 ( .A(n660), .B(n612), .C(n644), .YC(n409), .YS(n410) );
  FAX1 U369 ( .A(n628), .B(n676), .C(n596), .YC(n411), .YS(n412) );
  FAX1 U370 ( .A(n563), .B(n580), .C(n692), .YC(n413), .YS(n414) );
  FAX1 U375 ( .A(n661), .B(n645), .C(n613), .YC(n423), .YS(n424) );
  FAX1 U377 ( .A(n563), .B(n581), .C(n693), .YC(n427), .YS(n428) );
  FAX1 U380 ( .A(n1003), .B(n438), .C(n442), .YC(n433), .YS(n434) );
  FAX1 U381 ( .A(n1134), .B(n453), .C(n451), .YC(n435), .YS(n436) );
  FAX1 U382 ( .A(n662), .B(n630), .C(n646), .YC(n437), .YS(n438) );
  FAX1 U383 ( .A(n678), .B(n598), .C(n614), .YC(n439), .YS(n440) );
  FAX1 U388 ( .A(n663), .B(n456), .C(n467), .YC(n449), .YS(n450) );
  FAX1 U389 ( .A(n679), .B(n631), .C(n565), .YC(n451), .YS(n452) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n468), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U394 ( .A(n477), .B(n475), .C(n466), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n696), .B(n680), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n712), .B(n648), .C(n664), .YC(n465), .YS(n466) );
  FAX1 U397 ( .A(n600), .B(n632), .C(n616), .YC(n467), .YS(n468) );
  FAX1 U398 ( .A(n474), .B(n483), .C(n472), .YC(n469), .YS(n470) );
  FAX1 U400 ( .A(n998), .B(n1158), .C(n487), .YC(n473), .YS(n474) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U407 ( .A(n714), .B(n666), .C(n682), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n618), .B(n650), .C(n634), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U412 ( .A(n667), .B(n683), .C(n635), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n716), .B(n684), .C(n700), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n636), .B(n668), .C(n652), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n718), .B(n702), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n686), .C(n670), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n720), .C(n688), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n722), .C(n706), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n1083), .B(n1284), .Y(n573) );
  NOR2X1 U435 ( .A(n1083), .B(n1282), .Y(n295) );
  NOR2X1 U436 ( .A(n1082), .B(n1280), .Y(n574) );
  NOR2X1 U437 ( .A(n1083), .B(n729), .Y(n305) );
  NOR2X1 U438 ( .A(n1082), .B(n730), .Y(n575) );
  NOR2X1 U439 ( .A(n1083), .B(n731), .Y(n319) );
  NOR2X1 U440 ( .A(n1082), .B(n1272), .Y(n576) );
  NOR2X1 U441 ( .A(n1082), .B(n1271), .Y(n337) );
  NOR2X1 U442 ( .A(n1082), .B(n1269), .Y(n577) );
  NOR2X1 U444 ( .A(n1082), .B(n1265), .Y(n578) );
  NOR2X1 U445 ( .A(n1082), .B(n1263), .Y(n385) );
  NOR2X1 U446 ( .A(n1083), .B(n1261), .Y(n579) );
  NOR2X1 U447 ( .A(n1082), .B(n1259), .Y(n580) );
  NOR2X1 U448 ( .A(n1083), .B(n1257), .Y(n581) );
  AND2X1 U449 ( .A(n1288), .B(n1286), .Y(n582) );
  OAI22X1 U466 ( .A(n1083), .B(n1019), .C(n1090), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n1082), .B(n1254), .C(n1088), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1088), .B(n742), .C(n1254), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1088), .B(n743), .C(n1090), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1206), .B(n744), .C(n1254), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1088), .B(n745), .C(n1090), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1087), .B(n746), .C(n1254), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1087), .B(n747), .C(n1090), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1087), .B(n748), .C(n1254), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1206), .B(n749), .C(n1090), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1087), .B(n750), .C(n1254), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n1206), .B(n751), .C(n1090), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1019), .B(n752), .C(n1254), .D(n751), .Y(n595) );
  OAI22X1 U481 ( .A(n1087), .B(n753), .C(n1090), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n1087), .B(n754), .C(n1254), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1206), .B(n755), .C(n1090), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1254), .B(n755), .C(n1206), .D(n756), .Y(n599) );
  XNOR2X1 U487 ( .A(n877), .B(n1081), .Y(n741) );
  XNOR2X1 U488 ( .A(n1283), .B(n1286), .Y(n742) );
  XNOR2X1 U489 ( .A(n1281), .B(n1286), .Y(n743) );
  XNOR2X1 U490 ( .A(n1279), .B(n1081), .Y(n744) );
  XNOR2X1 U491 ( .A(n1277), .B(n1081), .Y(n745) );
  XNOR2X1 U492 ( .A(n1033), .B(n1286), .Y(n746) );
  XNOR2X1 U493 ( .A(n1273), .B(n1286), .Y(n747) );
  XNOR2X1 U494 ( .A(n1045), .B(n1286), .Y(n748) );
  XNOR2X1 U495 ( .A(n1270), .B(n1286), .Y(n749) );
  XNOR2X1 U496 ( .A(n1268), .B(n1081), .Y(n750) );
  XNOR2X1 U497 ( .A(n1266), .B(n1286), .Y(n751) );
  XNOR2X1 U498 ( .A(n1264), .B(n1286), .Y(n752) );
  XNOR2X1 U499 ( .A(n1262), .B(n1286), .Y(n753) );
  XNOR2X1 U500 ( .A(n1260), .B(n1286), .Y(n754) );
  XNOR2X1 U501 ( .A(n1258), .B(n1286), .Y(n755) );
  XNOR2X1 U502 ( .A(n1288), .B(n1286), .Y(n756) );
  OR2X1 U503 ( .A(n1288), .B(n1083), .Y(n757) );
  OAI22X1 U505 ( .A(n1305), .B(n1251), .C(n1248), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1305), .B(n1248), .C(n1252), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1252), .B(n759), .C(n1248), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1251), .B(n760), .C(n1248), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1252), .B(n761), .C(n1248), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n1251), .B(n762), .C(n1248), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1252), .B(n763), .C(n1248), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1251), .B(n764), .C(n1248), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1251), .B(n765), .C(n1248), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n1252), .B(n766), .C(n1248), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1251), .B(n767), .C(n1249), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1252), .B(n768), .C(n1248), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1251), .B(n769), .C(n1248), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1252), .B(n770), .C(n1248), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1251), .B(n771), .C(n1248), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1252), .B(n772), .C(n1248), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1248), .B(n772), .C(n1252), .D(n773), .Y(n617) );
  AND2X1 U524 ( .A(n1288), .B(n546), .Y(n618) );
  XNOR2X1 U526 ( .A(n877), .B(n1304), .Y(n758) );
  XNOR2X1 U527 ( .A(n1283), .B(n1304), .Y(n759) );
  XNOR2X1 U528 ( .A(n1281), .B(n1304), .Y(n760) );
  XNOR2X1 U529 ( .A(n1279), .B(n1304), .Y(n761) );
  XNOR2X1 U530 ( .A(n1277), .B(n1304), .Y(n762) );
  XNOR2X1 U531 ( .A(n1033), .B(n1304), .Y(n763) );
  XNOR2X1 U532 ( .A(n1273), .B(n1304), .Y(n764) );
  XNOR2X1 U533 ( .A(n1032), .B(n1304), .Y(n765) );
  XNOR2X1 U534 ( .A(n1270), .B(n1304), .Y(n766) );
  XNOR2X1 U535 ( .A(n1268), .B(n1304), .Y(n767) );
  XNOR2X1 U536 ( .A(n1266), .B(n1304), .Y(n768) );
  XNOR2X1 U537 ( .A(n1264), .B(n1304), .Y(n769) );
  XNOR2X1 U538 ( .A(n1262), .B(n1304), .Y(n770) );
  XNOR2X1 U539 ( .A(n1260), .B(n1304), .Y(n771) );
  XNOR2X1 U540 ( .A(n1258), .B(n1304), .Y(n772) );
  XNOR2X1 U541 ( .A(n1288), .B(n1304), .Y(n773) );
  OR2X1 U542 ( .A(n1288), .B(n1305), .Y(n774) );
  OAI22X1 U544 ( .A(n995), .B(n1036), .C(n1245), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n995), .B(n1246), .C(n1247), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1247), .B(n776), .C(n1246), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1036), .B(n777), .C(n1245), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1247), .B(n778), .C(n1246), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1036), .B(n779), .C(n1245), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1247), .B(n780), .C(n1246), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1036), .B(n781), .C(n1245), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1035), .B(n782), .C(n1246), .D(n781), .Y(n627) );
  OAI22X1 U555 ( .A(n1247), .B(n783), .C(n1245), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1036), .B(n784), .C(n1246), .D(n783), .Y(n629) );
  OAI22X1 U557 ( .A(n1247), .B(n785), .C(n1245), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1035), .B(n786), .C(n1246), .D(n785), .Y(n631) );
  OAI22X1 U559 ( .A(n1247), .B(n787), .C(n1245), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1036), .B(n788), .C(n1246), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1247), .B(n789), .C(n1245), .D(n788), .Y(n634) );
  OAI22X1 U562 ( .A(n1246), .B(n789), .C(n1247), .D(n790), .Y(n635) );
  AND2X1 U563 ( .A(n1288), .B(n549), .Y(n636) );
  XNOR2X1 U565 ( .A(n877), .B(n1302), .Y(n775) );
  XNOR2X1 U566 ( .A(n1283), .B(n1302), .Y(n776) );
  XNOR2X1 U567 ( .A(n1281), .B(n1302), .Y(n777) );
  XNOR2X1 U568 ( .A(n1279), .B(n1175), .Y(n778) );
  XNOR2X1 U569 ( .A(n1277), .B(n1175), .Y(n779) );
  XNOR2X1 U570 ( .A(n1033), .B(n1175), .Y(n780) );
  XNOR2X1 U571 ( .A(n1273), .B(n1175), .Y(n781) );
  XNOR2X1 U572 ( .A(n1032), .B(n1175), .Y(n782) );
  XNOR2X1 U573 ( .A(n1270), .B(n1302), .Y(n783) );
  XNOR2X1 U574 ( .A(n1268), .B(n1175), .Y(n784) );
  XNOR2X1 U575 ( .A(n1266), .B(n1175), .Y(n785) );
  XNOR2X1 U576 ( .A(n1264), .B(n1175), .Y(n786) );
  XNOR2X1 U577 ( .A(n1262), .B(n1175), .Y(n787) );
  XNOR2X1 U578 ( .A(n1260), .B(n1175), .Y(n788) );
  XNOR2X1 U579 ( .A(n1258), .B(n1175), .Y(n789) );
  XNOR2X1 U580 ( .A(n1288), .B(n1175), .Y(n790) );
  OR2X1 U581 ( .A(n1288), .B(n995), .Y(n791) );
  OAI22X1 U583 ( .A(n1301), .B(n1243), .C(n1122), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1301), .B(n1122), .C(n1242), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1242), .B(n793), .C(n1122), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1242), .B(n794), .C(n1122), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1242), .B(n795), .C(n1122), .D(n794), .Y(n641) );
  OAI22X1 U590 ( .A(n1242), .B(n796), .C(n1122), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1243), .B(n797), .C(n1122), .D(n796), .Y(n643) );
  OAI22X1 U592 ( .A(n1243), .B(n798), .C(n1122), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1243), .B(n799), .C(n1122), .D(n798), .Y(n645) );
  OAI22X1 U594 ( .A(n1243), .B(n800), .C(n1122), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n1243), .B(n801), .C(n1122), .D(n800), .Y(n647) );
  OAI22X1 U596 ( .A(n1243), .B(n802), .C(n1122), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1242), .B(n803), .C(n1122), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1243), .B(n804), .C(n1122), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1243), .B(n805), .C(n1122), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1242), .B(n806), .C(n1122), .D(n805), .Y(n652) );
  OAI22X1 U601 ( .A(n1122), .B(n806), .C(n1242), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1288), .B(n1121), .Y(n654) );
  XNOR2X1 U604 ( .A(n877), .B(n1123), .Y(n792) );
  XNOR2X1 U605 ( .A(n1283), .B(n1123), .Y(n793) );
  XNOR2X1 U606 ( .A(n1281), .B(n1123), .Y(n794) );
  XNOR2X1 U607 ( .A(n1279), .B(n1299), .Y(n795) );
  XNOR2X1 U608 ( .A(n1277), .B(n1299), .Y(n796) );
  XNOR2X1 U609 ( .A(n1033), .B(n1299), .Y(n797) );
  XNOR2X1 U610 ( .A(n1273), .B(n1299), .Y(n798) );
  XNOR2X1 U611 ( .A(n1045), .B(n1299), .Y(n799) );
  XNOR2X1 U612 ( .A(n1270), .B(n1299), .Y(n800) );
  XNOR2X1 U613 ( .A(n1268), .B(n1299), .Y(n801) );
  XNOR2X1 U614 ( .A(n1266), .B(n1299), .Y(n802) );
  XNOR2X1 U615 ( .A(n1264), .B(n1299), .Y(n803) );
  XNOR2X1 U616 ( .A(n1262), .B(n1299), .Y(n804) );
  XNOR2X1 U617 ( .A(n1260), .B(n1299), .Y(n805) );
  XNOR2X1 U618 ( .A(n1258), .B(n1299), .Y(n806) );
  XNOR2X1 U619 ( .A(n1288), .B(n1299), .Y(n807) );
  OR2X1 U620 ( .A(n997), .B(n1301), .Y(n808) );
  OAI22X1 U622 ( .A(n1298), .B(n1241), .C(n1239), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1298), .B(n1240), .C(n1196), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1241), .B(n810), .C(n1240), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1241), .B(n811), .C(n1239), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1241), .B(n812), .C(n1240), .D(n811), .Y(n659) );
  OAI22X1 U629 ( .A(n1241), .B(n813), .C(n1239), .D(n812), .Y(n660) );
  OAI22X1 U630 ( .A(n814), .B(n1241), .C(n1240), .D(n813), .Y(n661) );
  OAI22X1 U631 ( .A(n1241), .B(n815), .C(n1239), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1241), .B(n816), .C(n1240), .D(n815), .Y(n663) );
  OAI22X1 U633 ( .A(n1241), .B(n817), .C(n1239), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1241), .B(n818), .C(n1240), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n1241), .B(n819), .C(n1239), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1241), .B(n820), .C(n1240), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n1241), .B(n821), .C(n1239), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1241), .B(n822), .C(n1240), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1241), .B(n823), .C(n1239), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1240), .B(n823), .C(n1196), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1288), .B(n1238), .Y(n672) );
  XNOR2X1 U644 ( .A(n1283), .B(n1297), .Y(n810) );
  XNOR2X1 U645 ( .A(n1281), .B(n1297), .Y(n811) );
  XNOR2X1 U646 ( .A(n1279), .B(n1297), .Y(n812) );
  XNOR2X1 U647 ( .A(n1277), .B(n1297), .Y(n813) );
  XNOR2X1 U649 ( .A(n1273), .B(n1230), .Y(n815) );
  XNOR2X1 U650 ( .A(n1045), .B(n1297), .Y(n816) );
  XNOR2X1 U651 ( .A(n1270), .B(n1297), .Y(n817) );
  XNOR2X1 U652 ( .A(n1268), .B(n1297), .Y(n818) );
  XNOR2X1 U653 ( .A(n1266), .B(n1297), .Y(n819) );
  XNOR2X1 U654 ( .A(n1264), .B(n1297), .Y(n820) );
  XNOR2X1 U655 ( .A(n1262), .B(n1297), .Y(n821) );
  XNOR2X1 U656 ( .A(n1260), .B(n1297), .Y(n822) );
  XNOR2X1 U657 ( .A(n1084), .B(n1297), .Y(n823) );
  XNOR2X1 U658 ( .A(n997), .B(n1297), .Y(n824) );
  OR2X1 U659 ( .A(n1288), .B(n1298), .Y(n825) );
  OAI22X1 U661 ( .A(n1005), .B(n1010), .C(n1051), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1005), .B(n1236), .C(n1010), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1237), .B(n827), .C(n1051), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1237), .B(n828), .C(n1051), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1011), .B(n829), .C(n1051), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n1011), .B(n830), .C(n1051), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1009), .B(n831), .C(n1050), .D(n830), .Y(n679) );
  OAI22X1 U670 ( .A(n1237), .B(n832), .C(n1051), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1237), .B(n833), .C(n1051), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n1237), .B(n834), .C(n1051), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1010), .B(n835), .C(n1051), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1011), .B(n836), .C(n1236), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1237), .B(n837), .C(n1051), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1011), .B(n838), .C(n1051), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1237), .B(n839), .C(n1051), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1010), .B(n840), .C(n1236), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1051), .B(n840), .C(n1237), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1288), .B(n1049), .Y(n690) );
  XNOR2X1 U682 ( .A(n877), .B(n1000), .Y(n826) );
  XNOR2X1 U683 ( .A(n1283), .B(n1000), .Y(n827) );
  XNOR2X1 U684 ( .A(n1281), .B(n1001), .Y(n828) );
  XNOR2X1 U685 ( .A(n1279), .B(n1000), .Y(n829) );
  XNOR2X1 U686 ( .A(n1277), .B(n1000), .Y(n830) );
  XNOR2X1 U687 ( .A(n1275), .B(n1000), .Y(n831) );
  XNOR2X1 U688 ( .A(n1273), .B(n1001), .Y(n832) );
  XNOR2X1 U689 ( .A(n1045), .B(n1001), .Y(n833) );
  XNOR2X1 U690 ( .A(n1270), .B(n1001), .Y(n834) );
  XNOR2X1 U691 ( .A(n1268), .B(n1001), .Y(n835) );
  XNOR2X1 U692 ( .A(n1266), .B(n1001), .Y(n836) );
  XNOR2X1 U693 ( .A(n1264), .B(n1001), .Y(n837) );
  XNOR2X1 U694 ( .A(n1262), .B(n1001), .Y(n838) );
  XNOR2X1 U695 ( .A(n1260), .B(n1001), .Y(n839) );
  XNOR2X1 U696 ( .A(n1258), .B(n1001), .Y(n840) );
  XNOR2X1 U697 ( .A(n997), .B(n1001), .Y(n841) );
  OR2X1 U698 ( .A(n997), .B(n1005), .Y(n842) );
  OAI22X1 U700 ( .A(n1294), .B(n1234), .C(n1065), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1294), .B(n1233), .C(n1234), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n1234), .B(n844), .C(n1233), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1006), .B(n845), .C(n1233), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1234), .B(n846), .C(n1233), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1008), .B(n847), .C(n1065), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1006), .B(n848), .C(n1233), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n1234), .B(n849), .C(n1065), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1008), .B(n850), .C(n1065), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1008), .B(n851), .C(n1065), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1007), .B(n852), .C(n1065), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1234), .B(n853), .C(n1065), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1007), .B(n854), .C(n1065), .D(n853), .Y(n703) );
  OAI22X1 U715 ( .A(n1007), .B(n855), .C(n1065), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1007), .B(n856), .C(n1065), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1008), .B(n857), .C(n1065), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1065), .B(n857), .C(n1234), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1288), .B(n1064), .Y(n708) );
  XNOR2X1 U721 ( .A(n877), .B(n1293), .Y(n843) );
  XNOR2X1 U722 ( .A(n1283), .B(n1293), .Y(n844) );
  XNOR2X1 U724 ( .A(n1279), .B(n1292), .Y(n846) );
  XNOR2X1 U725 ( .A(n1277), .B(n1292), .Y(n847) );
  XNOR2X1 U726 ( .A(n1033), .B(n1292), .Y(n848) );
  XNOR2X1 U727 ( .A(n1273), .B(n1292), .Y(n849) );
  XNOR2X1 U728 ( .A(n1045), .B(n1292), .Y(n850) );
  XNOR2X1 U729 ( .A(n1270), .B(n1292), .Y(n851) );
  XNOR2X1 U730 ( .A(n1268), .B(n1292), .Y(n852) );
  XNOR2X1 U731 ( .A(n1266), .B(n1292), .Y(n853) );
  XNOR2X1 U732 ( .A(n1264), .B(n1292), .Y(n854) );
  XNOR2X1 U733 ( .A(n1262), .B(n1292), .Y(n855) );
  XNOR2X1 U734 ( .A(n1260), .B(n1292), .Y(n856) );
  XNOR2X1 U735 ( .A(n1084), .B(n1292), .Y(n857) );
  XNOR2X1 U736 ( .A(n1288), .B(n1292), .Y(n858) );
  OR2X1 U737 ( .A(n997), .B(n1294), .Y(n859) );
  OAI22X1 U739 ( .A(n1291), .B(n1232), .C(n1166), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n1166), .B(n1291), .C(n1232), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1232), .B(n861), .C(n1166), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1232), .B(n862), .C(n1166), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1232), .B(n863), .C(n1166), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1232), .B(n864), .C(n1166), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1232), .B(n865), .C(n1166), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1232), .B(n866), .C(n1166), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1232), .B(n867), .C(n1166), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1232), .B(n868), .C(n1166), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1232), .B(n869), .C(n1166), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1232), .B(n870), .C(n1166), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1232), .B(n871), .C(n1166), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1232), .B(n872), .C(n1166), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1232), .B(n873), .C(n1166), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1232), .B(n874), .C(n1166), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n1166), .B(n874), .C(n1232), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n877), .B(n1290), .Y(n860) );
  XNOR2X1 U759 ( .A(n1283), .B(n1290), .Y(n861) );
  XNOR2X1 U760 ( .A(n1281), .B(n1290), .Y(n862) );
  XNOR2X1 U761 ( .A(n1279), .B(n1290), .Y(n863) );
  XNOR2X1 U762 ( .A(n1277), .B(n1290), .Y(n864) );
  XNOR2X1 U763 ( .A(n1033), .B(n1290), .Y(n865) );
  XNOR2X1 U764 ( .A(n1273), .B(n1290), .Y(n866) );
  XNOR2X1 U765 ( .A(n1045), .B(n1290), .Y(n867) );
  XNOR2X1 U766 ( .A(n1270), .B(n1290), .Y(n868) );
  XNOR2X1 U767 ( .A(n1268), .B(n1290), .Y(n869) );
  XNOR2X1 U768 ( .A(n1266), .B(n1290), .Y(n870) );
  XNOR2X1 U769 ( .A(n1264), .B(n1290), .Y(n871) );
  XNOR2X1 U770 ( .A(n1262), .B(n1290), .Y(n872) );
  XNOR2X1 U771 ( .A(n1260), .B(n1290), .Y(n873) );
  XNOR2X1 U772 ( .A(n1084), .B(n1290), .Y(n874) );
  XNOR2X1 U773 ( .A(n997), .B(n1290), .Y(n875) );
  OR2X1 U774 ( .A(n997), .B(n1291), .Y(n876) );
  XOR2X1 U802 ( .A(n1081), .B(a[29]), .Y(n893) );
  XNOR2X1 U803 ( .A(n37), .B(a[29]), .Y(n46) );
  NAND2X1 U804 ( .A(n894), .B(n1249), .Y(n42) );
  XOR2X1 U805 ( .A(n37), .B(a[27]), .Y(n894) );
  XOR2X1 U808 ( .A(n1091), .B(n1079), .Y(n895) );
  XOR2X1 U814 ( .A(n19), .B(n1048), .Y(n897) );
  XNOR2X1 U815 ( .A(n13), .B(a[21]), .Y(n22) );
  XOR2X1 U820 ( .A(n1080), .B(a[17]), .Y(n899) );
  XOR2X1 U823 ( .A(n1), .B(a[15]), .Y(n900) );
  INVX2 U828 ( .A(n1302), .Y(n995) );
  INVX2 U829 ( .A(n1303), .Y(n1302) );
  INVX8 U830 ( .A(n1121), .Y(n1122) );
  INVX2 U831 ( .A(n283), .Y(n996) );
  BUFX4 U832 ( .A(n13), .Y(n1034) );
  BUFX4 U833 ( .A(n52), .Y(n1164) );
  BUFX2 U834 ( .A(n1287), .Y(n997) );
  BUFX4 U835 ( .A(n480), .Y(n998) );
  INVX8 U836 ( .A(n1295), .Y(n999) );
  INVX8 U837 ( .A(n999), .Y(n1000) );
  INVX8 U838 ( .A(n999), .Y(n1001) );
  BUFX4 U839 ( .A(n379), .Y(n1002) );
  INVX8 U840 ( .A(n1259), .Y(n1260) );
  INVX4 U841 ( .A(n1094), .Y(n1206) );
  INVX8 U842 ( .A(n1049), .Y(n1051) );
  BUFX4 U843 ( .A(n440), .Y(n1003) );
  INVX8 U844 ( .A(n1269), .Y(n1270) );
  INVX4 U845 ( .A(n885), .Y(n1269) );
  INVX8 U846 ( .A(n1282), .Y(n1283) );
  INVX4 U847 ( .A(n878), .Y(n1282) );
  INVX4 U848 ( .A(n1285), .Y(n1286) );
  INVX8 U849 ( .A(n1285), .Y(n1081) );
  INVX4 U850 ( .A(n19), .Y(n1298) );
  INVX2 U851 ( .A(n34), .Y(n1244) );
  INVX2 U852 ( .A(n42), .Y(n1250) );
  INVX2 U853 ( .A(n883), .Y(n1272) );
  INVX4 U854 ( .A(n1004), .Y(n1005) );
  INVX2 U855 ( .A(n1296), .Y(n1004) );
  INVX2 U856 ( .A(n1085), .Y(n1086) );
  INVX2 U857 ( .A(n888), .Y(n1263) );
  INVX2 U858 ( .A(n1049), .Y(n1050) );
  INVX2 U859 ( .A(n1236), .Y(n1049) );
  INVX4 U860 ( .A(n1267), .Y(n1268) );
  INVX2 U861 ( .A(n886), .Y(n1267) );
  INVX2 U862 ( .A(n880), .Y(n1278) );
  INVX2 U863 ( .A(n541), .Y(n1285) );
  INVX2 U864 ( .A(n1046), .Y(n1047) );
  INVX4 U865 ( .A(n1250), .Y(n1252) );
  INVX2 U866 ( .A(n392), .Y(n1093) );
  BUFX2 U867 ( .A(n399), .Y(n1176) );
  INVX2 U868 ( .A(n1126), .Y(n1157) );
  BUFX2 U869 ( .A(n489), .Y(n1158) );
  BUFX2 U870 ( .A(n459), .Y(n1159) );
  INVX4 U871 ( .A(n1081), .Y(n1082) );
  BUFX2 U872 ( .A(n1235), .Y(n1006) );
  BUFX2 U873 ( .A(n1235), .Y(n1007) );
  BUFX2 U874 ( .A(n1235), .Y(n1008) );
  INVX1 U875 ( .A(n1146), .Y(n1235) );
  INVX1 U876 ( .A(n182), .Y(n285) );
  BUFX2 U877 ( .A(n1177), .Y(n1009) );
  BUFX2 U878 ( .A(n1177), .Y(n1010) );
  BUFX2 U879 ( .A(n1177), .Y(n1011) );
  INVX1 U880 ( .A(n1147), .Y(n1177) );
  XNOR2X1 U881 ( .A(n19), .B(a[23]), .Y(n1012) );
  INVX2 U882 ( .A(n884), .Y(n1271) );
  AND2X2 U883 ( .A(n897), .B(n22), .Y(n1013) );
  AND2X2 U884 ( .A(n917), .B(n900), .Y(n1014) );
  OR2X2 U885 ( .A(n481), .B(n470), .Y(n1015) );
  INVX4 U886 ( .A(n1013), .Y(n1241) );
  OR2X2 U887 ( .A(n308), .B(n313), .Y(n1016) );
  INVX2 U888 ( .A(n22), .Y(n1238) );
  AND2X2 U889 ( .A(n169), .B(n283), .Y(n1017) );
  AND2X2 U890 ( .A(n162), .B(n282), .Y(n1018) );
  NAND2X1 U891 ( .A(n1254), .B(n893), .Y(n1019) );
  INVX2 U892 ( .A(n1151), .Y(n1236) );
  INVX2 U893 ( .A(n1253), .Y(n1090) );
  INVX2 U894 ( .A(n887), .Y(n1265) );
  AND2X2 U895 ( .A(n491), .B(n482), .Y(n1020) );
  INVX4 U896 ( .A(n1257), .Y(n1258) );
  INVX4 U897 ( .A(n1261), .Y(n1262) );
  INVX2 U898 ( .A(n917), .Y(n1165) );
  INVX2 U899 ( .A(a[15]), .Y(n917) );
  INVX2 U900 ( .A(n877), .Y(n1284) );
  OR2X2 U901 ( .A(n292), .B(n293), .Y(n1021) );
  XOR2X1 U902 ( .A(n629), .B(n677), .Y(n1022) );
  XOR2X1 U903 ( .A(n1022), .B(n597), .Y(n426) );
  XOR2X1 U904 ( .A(n439), .B(n424), .Y(n1023) );
  XOR2X1 U905 ( .A(n1023), .B(n426), .Y(n420) );
  NAND2X1 U906 ( .A(n629), .B(n677), .Y(n1024) );
  NAND2X1 U907 ( .A(n629), .B(n597), .Y(n1025) );
  NAND2X1 U908 ( .A(n677), .B(n597), .Y(n1026) );
  NAND3X1 U909 ( .A(n1024), .B(n1025), .C(n1026), .Y(n425) );
  NAND2X1 U910 ( .A(n439), .B(n424), .Y(n1027) );
  NAND2X1 U911 ( .A(n439), .B(n426), .Y(n1028) );
  NAND2X1 U912 ( .A(n424), .B(n426), .Y(n1029) );
  NAND3X1 U913 ( .A(n1027), .B(n1028), .C(n1029), .Y(n419) );
  XOR2X1 U914 ( .A(n1280), .B(n1293), .Y(n845) );
  INVX2 U915 ( .A(n1238), .Y(n1240) );
  INVX2 U916 ( .A(n400), .Y(n1030) );
  INVX4 U917 ( .A(n1030), .Y(n1031) );
  INVX8 U918 ( .A(n1291), .Y(n1290) );
  INVX2 U919 ( .A(n1271), .Y(n1032) );
  INVX4 U920 ( .A(n1274), .Y(n1033) );
  INVX2 U921 ( .A(n1274), .Y(n1275) );
  INVX2 U922 ( .A(n882), .Y(n1274) );
  INVX1 U923 ( .A(n1033), .Y(n731) );
  INVX2 U924 ( .A(n1012), .Y(n1121) );
  NAND2X1 U925 ( .A(n895), .B(n1246), .Y(n1035) );
  NAND2X1 U926 ( .A(n895), .B(n1246), .Y(n1036) );
  INVX1 U927 ( .A(n1245), .Y(n549) );
  INVX4 U928 ( .A(n563), .Y(n709) );
  XOR2X1 U929 ( .A(n1275), .B(n1298), .Y(n814) );
  XOR2X1 U930 ( .A(n385), .B(n578), .Y(n1037) );
  XOR2X1 U931 ( .A(n1037), .B(n673), .Y(n372) );
  XOR2X1 U932 ( .A(n625), .B(n593), .Y(n1038) );
  XOR2X1 U933 ( .A(n1038), .B(n372), .Y(n368) );
  NAND2X1 U934 ( .A(n385), .B(n578), .Y(n1039) );
  NAND2X1 U935 ( .A(n385), .B(n673), .Y(n1040) );
  NAND2X1 U936 ( .A(n578), .B(n673), .Y(n1041) );
  NAND3X1 U937 ( .A(n1039), .B(n1040), .C(n1041), .Y(n371) );
  NAND2X1 U938 ( .A(n625), .B(n593), .Y(n1042) );
  NAND2X1 U939 ( .A(n625), .B(n372), .Y(n1043) );
  NAND2X1 U940 ( .A(n593), .B(n372), .Y(n1044) );
  NAND3X1 U941 ( .A(n1042), .B(n1043), .C(n1044), .Y(n367) );
  INVX4 U942 ( .A(n1271), .Y(n1045) );
  INVX2 U943 ( .A(n405), .Y(n1098) );
  INVX1 U944 ( .A(n100), .Y(n98) );
  INVX4 U945 ( .A(n37), .Y(n1305) );
  INVX2 U946 ( .A(n461), .Y(n1046) );
  BUFX2 U947 ( .A(a[21]), .Y(n1048) );
  INVX1 U948 ( .A(n128), .Y(n126) );
  AND2X2 U949 ( .A(n1081), .B(n1268), .Y(n359) );
  INVX2 U950 ( .A(n1081), .Y(n1083) );
  INVX2 U951 ( .A(n13), .Y(n1296) );
  INVX2 U952 ( .A(n889), .Y(n1261) );
  INVX1 U953 ( .A(n1255), .Y(n1052) );
  XOR2X1 U954 ( .A(n465), .B(n454), .Y(n1053) );
  XOR2X1 U955 ( .A(n1053), .B(n452), .Y(n448) );
  NAND2X1 U956 ( .A(n465), .B(n454), .Y(n1054) );
  NAND2X1 U957 ( .A(n465), .B(n452), .Y(n1055) );
  NAND2X1 U958 ( .A(n454), .B(n452), .Y(n1056) );
  NAND3X1 U959 ( .A(n1054), .B(n1055), .C(n1056), .Y(n447) );
  XOR2X1 U960 ( .A(n449), .B(n436), .Y(n1057) );
  XOR2X1 U961 ( .A(n1057), .B(n447), .Y(n432) );
  NAND2X1 U962 ( .A(n449), .B(n436), .Y(n1058) );
  NAND2X1 U963 ( .A(n449), .B(n447), .Y(n1059) );
  NAND2X1 U964 ( .A(n436), .B(n447), .Y(n1060) );
  NAND3X1 U965 ( .A(n1059), .B(n1058), .C(n1060), .Y(n431) );
  BUFX2 U966 ( .A(n408), .Y(n1061) );
  BUFX2 U967 ( .A(n414), .Y(n1062) );
  INVX2 U968 ( .A(n287), .Y(n1063) );
  INVX2 U969 ( .A(n1233), .Y(n1064) );
  INVX2 U970 ( .A(n1064), .Y(n1065) );
  XNOR2X1 U971 ( .A(n154), .B(n1066), .Y(product[39]) );
  AND2X2 U972 ( .A(n149), .B(n1104), .Y(n1066) );
  XNOR2X1 U973 ( .A(n179), .B(n1067), .Y(product[36]) );
  AND2X2 U974 ( .A(n178), .B(n284), .Y(n1067) );
  XNOR2X1 U975 ( .A(n95), .B(n1068), .Y(product[44]) );
  AND2X2 U976 ( .A(n94), .B(n91), .Y(n1068) );
  XOR2X1 U977 ( .A(n594), .B(n674), .Y(n1069) );
  XOR2X1 U978 ( .A(n386), .B(n1069), .Y(n384) );
  NAND2X1 U979 ( .A(n386), .B(n594), .Y(n1070) );
  NAND2X1 U980 ( .A(n386), .B(n674), .Y(n1071) );
  NAND2X1 U981 ( .A(n594), .B(n674), .Y(n1072) );
  NAND3X1 U982 ( .A(n1071), .B(n1070), .C(n1072), .Y(n383) );
  INVX1 U983 ( .A(n385), .Y(n386) );
  XNOR2X1 U984 ( .A(n390), .B(n1073), .Y(n388) );
  XOR2X1 U985 ( .A(n403), .B(n1093), .Y(n1073) );
  INVX2 U986 ( .A(n891), .Y(n1257) );
  XOR2X1 U987 ( .A(n445), .B(n434), .Y(n1074) );
  XOR2X1 U988 ( .A(n432), .B(n1074), .Y(n430) );
  NAND2X1 U989 ( .A(n432), .B(n445), .Y(n1075) );
  NAND2X1 U990 ( .A(n432), .B(n434), .Y(n1076) );
  NAND2X1 U991 ( .A(n445), .B(n434), .Y(n1077) );
  NAND3X1 U992 ( .A(n1076), .B(n1075), .C(n1077), .Y(n429) );
  BUFX2 U993 ( .A(n599), .Y(n1078) );
  INVX4 U994 ( .A(n1146), .Y(n1234) );
  BUFX2 U995 ( .A(a[25]), .Y(n1079) );
  INVX8 U996 ( .A(n1298), .Y(n1297) );
  INVX2 U997 ( .A(n1294), .Y(n1080) );
  INVX2 U998 ( .A(n1294), .Y(n1293) );
  INVX2 U999 ( .A(n31), .Y(n1174) );
  BUFX4 U1000 ( .A(n31), .Y(n1091) );
  BUFX2 U1001 ( .A(n1258), .Y(n1084) );
  INVX2 U1002 ( .A(n433), .Y(n1085) );
  INVX2 U1003 ( .A(n890), .Y(n1259) );
  INVX4 U1004 ( .A(n1089), .Y(n1087) );
  INVX4 U1005 ( .A(n881), .Y(n1276) );
  INVX2 U1006 ( .A(n1149), .Y(n1249) );
  INVX1 U1007 ( .A(n222), .Y(n221) );
  AND2X2 U1008 ( .A(n1288), .B(n1253), .Y(n600) );
  INVX1 U1009 ( .A(n1089), .Y(n1088) );
  AND2X2 U1010 ( .A(n1254), .B(n893), .Y(n1089) );
  INVX8 U1011 ( .A(n1005), .Y(n1295) );
  XNOR2X1 U1012 ( .A(n163), .B(n1018), .Y(product[38]) );
  BUFX2 U1013 ( .A(n427), .Y(n1092) );
  XNOR2X1 U1014 ( .A(n25), .B(a[25]), .Y(n34) );
  INVX4 U1015 ( .A(n25), .Y(n1301) );
  AND2X2 U1016 ( .A(n1254), .B(n893), .Y(n1094) );
  NAND2X1 U1017 ( .A(n390), .B(n403), .Y(n1095) );
  NAND2X1 U1018 ( .A(n390), .B(n392), .Y(n1096) );
  NAND2X1 U1019 ( .A(n403), .B(n392), .Y(n1097) );
  NAND3X1 U1020 ( .A(n1096), .B(n1095), .C(n1097), .Y(n387) );
  XNOR2X1 U1021 ( .A(n170), .B(n1017), .Y(product[37]) );
  BUFX4 U1022 ( .A(n394), .Y(n1156) );
  XNOR2X1 U1023 ( .A(n1202), .B(n1098), .Y(n390) );
  NAND3X1 U1024 ( .A(n1189), .B(n1190), .C(n1191), .Y(n1099) );
  XOR2X1 U1025 ( .A(n336), .B(n345), .Y(n1100) );
  XOR2X1 U1026 ( .A(n334), .B(n1100), .Y(n332) );
  NAND2X1 U1027 ( .A(n334), .B(n336), .Y(n1101) );
  NAND2X1 U1028 ( .A(n334), .B(n345), .Y(n1102) );
  NAND2X1 U1029 ( .A(n336), .B(n345), .Y(n1103) );
  NAND3X1 U1030 ( .A(n1102), .B(n1101), .C(n1103), .Y(n331) );
  OR2X2 U1031 ( .A(n330), .B(n339), .Y(n1104) );
  INVX1 U1032 ( .A(n1104), .Y(n148) );
  XOR2X1 U1033 ( .A(n698), .B(n499), .Y(n1105) );
  XOR2X1 U1034 ( .A(n1105), .B(n497), .Y(n486) );
  NAND2X1 U1035 ( .A(n698), .B(n499), .Y(n1106) );
  NAND2X1 U1036 ( .A(n698), .B(n497), .Y(n1107) );
  NAND2X1 U1037 ( .A(n499), .B(n497), .Y(n1108) );
  NAND3X1 U1038 ( .A(n1106), .B(n1107), .C(n1108), .Y(n485) );
  XOR2X1 U1039 ( .A(n476), .B(n478), .Y(n1109) );
  XOR2X1 U1040 ( .A(n1109), .B(n485), .Y(n472) );
  NAND2X1 U1041 ( .A(n476), .B(n478), .Y(n1110) );
  NAND2X1 U1042 ( .A(n476), .B(n485), .Y(n1111) );
  NAND2X1 U1043 ( .A(n478), .B(n485), .Y(n1112) );
  NAND3X1 U1044 ( .A(n1110), .B(n1111), .C(n1112), .Y(n471) );
  XOR2X1 U1045 ( .A(n647), .B(n695), .Y(n1113) );
  XOR2X1 U1046 ( .A(n1113), .B(n1078), .Y(n454) );
  NAND2X1 U1047 ( .A(n599), .B(n647), .Y(n1114) );
  NAND2X1 U1048 ( .A(n599), .B(n695), .Y(n1115) );
  NAND2X1 U1049 ( .A(n647), .B(n695), .Y(n1116) );
  NAND3X1 U1050 ( .A(n1116), .B(n1114), .C(n1115), .Y(n453) );
  INVX4 U1051 ( .A(n1152), .Y(n1243) );
  XOR2X1 U1052 ( .A(n414), .B(n427), .Y(n1117) );
  XOR2X1 U1053 ( .A(n1117), .B(n425), .Y(n408) );
  NAND2X1 U1054 ( .A(n425), .B(n1062), .Y(n1118) );
  NAND2X1 U1055 ( .A(n425), .B(n1092), .Y(n1119) );
  NAND2X1 U1056 ( .A(n1062), .B(n1092), .Y(n1120) );
  NAND3X1 U1057 ( .A(n1119), .B(n1118), .C(n1120), .Y(n407) );
  INVX1 U1058 ( .A(n1289), .Y(n1287) );
  INVX8 U1059 ( .A(n1289), .Y(n1288) );
  INVX4 U1060 ( .A(n49), .Y(n1289) );
  INVX8 U1061 ( .A(n1305), .Y(n1304) );
  BUFX2 U1062 ( .A(n1300), .Y(n1123) );
  INVX2 U1063 ( .A(n1301), .Y(n1300) );
  AND2X1 U1064 ( .A(n708), .B(n724), .Y(n1137) );
  OR2X2 U1065 ( .A(n1157), .B(n80), .Y(n1125) );
  INVX4 U1066 ( .A(n1150), .Y(n1233) );
  OR2X2 U1067 ( .A(n322), .B(n329), .Y(n1128) );
  AND2X1 U1068 ( .A(n572), .B(n725), .Y(n1145) );
  INVX1 U1069 ( .A(n93), .Y(n91) );
  INVX1 U1070 ( .A(n94), .Y(n92) );
  AND2X2 U1071 ( .A(n1124), .B(n1012), .Y(n1152) );
  XOR2X1 U1072 ( .A(n1300), .B(a[23]), .Y(n1124) );
  OR2X2 U1073 ( .A(n302), .B(n307), .Y(n1133) );
  INVX1 U1074 ( .A(n84), .Y(n275) );
  INVX1 U1075 ( .A(n1277), .Y(n730) );
  AND2X2 U1076 ( .A(n1128), .B(n1104), .Y(n1126) );
  XOR2X1 U1077 ( .A(n1127), .B(n418), .Y(n416) );
  XOR2X1 U1078 ( .A(n420), .B(n1160), .Y(n1127) );
  XOR2X1 U1079 ( .A(n134), .B(n59), .Y(product[41]) );
  AND2X2 U1080 ( .A(n481), .B(n470), .Y(n1129) );
  XNOR2X1 U1081 ( .A(n1130), .B(n641), .Y(n370) );
  XNOR2X1 U1082 ( .A(n609), .B(n657), .Y(n1130) );
  XNOR2X1 U1083 ( .A(n1131), .B(n1047), .Y(n446) );
  XNOR2X1 U1084 ( .A(n463), .B(n450), .Y(n1131) );
  XNOR2X1 U1085 ( .A(n1132), .B(n1086), .Y(n418) );
  XNOR2X1 U1086 ( .A(n435), .B(n422), .Y(n1132) );
  AND2X2 U1087 ( .A(n615), .B(n711), .Y(n1134) );
  OR2X1 U1088 ( .A(n523), .B(n518), .Y(n1135) );
  OR2X1 U1089 ( .A(n708), .B(n724), .Y(n1136) );
  OR2X1 U1090 ( .A(n491), .B(n482), .Y(n1138) );
  AND2X2 U1091 ( .A(n523), .B(n518), .Y(n1139) );
  XNOR2X1 U1092 ( .A(n1140), .B(n441), .Y(n422) );
  XNOR2X1 U1093 ( .A(n428), .B(n437), .Y(n1140) );
  OR2X1 U1094 ( .A(n533), .B(n530), .Y(n1141) );
  OR2X1 U1095 ( .A(n539), .B(n538), .Y(n1142) );
  AND2X2 U1096 ( .A(n533), .B(n530), .Y(n1143) );
  AND2X2 U1097 ( .A(n539), .B(n538), .Y(n1144) );
  XNOR2X1 U1098 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1099 ( .A(n551), .Y(n637) );
  INVX2 U1100 ( .A(n545), .Y(n601) );
  INVX4 U1101 ( .A(n1294), .Y(n1292) );
  INVX2 U1102 ( .A(n548), .Y(n619) );
  INVX2 U1103 ( .A(n1147), .Y(n1237) );
  INVX4 U1104 ( .A(n1161), .Y(n563) );
  INVX4 U1105 ( .A(n1250), .Y(n1251) );
  INVX2 U1106 ( .A(n1152), .Y(n1242) );
  AND2X2 U1107 ( .A(n1233), .B(n899), .Y(n1146) );
  NOR2X1 U1108 ( .A(n1148), .B(n1151), .Y(n1147) );
  XNOR2X1 U1109 ( .A(n1034), .B(a[19]), .Y(n1148) );
  INVX4 U1110 ( .A(n879), .Y(n1280) );
  XOR2X1 U1111 ( .A(n31), .B(a[27]), .Y(n1149) );
  XOR2X1 U1112 ( .A(n1), .B(a[17]), .Y(n1150) );
  XNOR2X1 U1113 ( .A(n1294), .B(a[19]), .Y(n1151) );
  BUFX2 U1114 ( .A(n53), .Y(n1153) );
  BUFX2 U1115 ( .A(n53), .Y(n1154) );
  BUFX2 U1116 ( .A(n53), .Y(n1155) );
  INVX1 U1117 ( .A(n1298), .Y(n1230) );
  INVX4 U1118 ( .A(n1301), .Y(n1299) );
  INVX2 U1119 ( .A(n1), .Y(n1291) );
  INVX2 U1120 ( .A(n1244), .Y(n1245) );
  INVX1 U1121 ( .A(n213), .Y(n212) );
  INVX1 U1122 ( .A(n210), .Y(n289) );
  INVX1 U1123 ( .A(n200), .Y(n202) );
  INVX1 U1124 ( .A(n199), .Y(n201) );
  BUFX4 U1125 ( .A(n431), .Y(n1160) );
  AOI22X1 U1126 ( .A(n1165), .B(n1162), .C(n1014), .D(n1162), .Y(n1161) );
  INVX1 U1127 ( .A(n1291), .Y(n1162) );
  INVX2 U1128 ( .A(n1165), .Y(n1166) );
  BUFX2 U1129 ( .A(n52), .Y(n1163) );
  XOR2X1 U1130 ( .A(n1284), .B(n1297), .Y(n809) );
  XOR2X1 U1131 ( .A(n448), .B(n1159), .Y(n1167) );
  XOR2X1 U1132 ( .A(n1167), .B(n446), .Y(n444) );
  NAND2X1 U1133 ( .A(n463), .B(n450), .Y(n1168) );
  NAND2X1 U1134 ( .A(n463), .B(n1047), .Y(n1169) );
  NAND2X1 U1135 ( .A(n450), .B(n1047), .Y(n1170) );
  NAND3X1 U1136 ( .A(n1168), .B(n1169), .C(n1170), .Y(n445) );
  NAND2X1 U1137 ( .A(n448), .B(n1159), .Y(n1171) );
  NAND2X1 U1138 ( .A(n448), .B(n446), .Y(n1172) );
  NAND2X1 U1139 ( .A(n1159), .B(n446), .Y(n1173) );
  NAND3X1 U1140 ( .A(n1171), .B(n1172), .C(n1173), .Y(n443) );
  XOR2X1 U1141 ( .A(n615), .B(n711), .Y(n456) );
  INVX4 U1142 ( .A(n1174), .Y(n1175) );
  INVX1 U1143 ( .A(n189), .Y(n286) );
  AND2X2 U1144 ( .A(n895), .B(n1246), .Y(n1178) );
  NAND2X1 U1145 ( .A(n435), .B(n422), .Y(n1179) );
  NAND2X1 U1146 ( .A(n435), .B(n1086), .Y(n1180) );
  NAND2X1 U1147 ( .A(n422), .B(n1086), .Y(n1181) );
  NAND3X1 U1148 ( .A(n1179), .B(n1180), .C(n1181), .Y(n417) );
  NAND2X1 U1149 ( .A(n420), .B(n1160), .Y(n1182) );
  NAND2X1 U1150 ( .A(n420), .B(n418), .Y(n1183) );
  NAND2X1 U1151 ( .A(n1160), .B(n418), .Y(n1184) );
  NAND3X1 U1152 ( .A(n1182), .B(n1183), .C(n1184), .Y(n415) );
  XOR2X1 U1153 ( .A(n582), .B(n710), .Y(n1185) );
  XOR2X1 U1154 ( .A(n1185), .B(n694), .Y(n442) );
  NAND2X1 U1155 ( .A(n582), .B(n710), .Y(n1186) );
  NAND2X1 U1156 ( .A(n582), .B(n694), .Y(n1187) );
  NAND2X1 U1157 ( .A(n710), .B(n694), .Y(n1188) );
  NAND3X1 U1158 ( .A(n1186), .B(n1187), .C(n1188), .Y(n441) );
  NAND2X1 U1159 ( .A(n428), .B(n437), .Y(n1189) );
  NAND2X1 U1160 ( .A(n428), .B(n441), .Y(n1190) );
  NAND2X1 U1161 ( .A(n437), .B(n441), .Y(n1191) );
  NAND3X1 U1162 ( .A(n1189), .B(n1190), .C(n1191), .Y(n421) );
  XOR2X1 U1163 ( .A(n408), .B(n421), .Y(n1192) );
  XOR2X1 U1164 ( .A(n419), .B(n1192), .Y(n404) );
  NAND2X1 U1165 ( .A(n419), .B(n1061), .Y(n1193) );
  NAND2X1 U1166 ( .A(n419), .B(n1099), .Y(n1194) );
  NAND2X1 U1167 ( .A(n1061), .B(n1099), .Y(n1195) );
  NAND3X1 U1168 ( .A(n1194), .B(n1193), .C(n1195), .Y(n403) );
  INVX2 U1169 ( .A(n1091), .Y(n1303) );
  INVX1 U1170 ( .A(n1013), .Y(n1196) );
  INVX4 U1171 ( .A(n1178), .Y(n1247) );
  XNOR2X1 U1172 ( .A(n1197), .B(n377), .Y(n364) );
  XNOR2X1 U1173 ( .A(n368), .B(n1002), .Y(n1197) );
  XOR2X1 U1174 ( .A(n423), .B(n410), .Y(n1198) );
  XOR2X1 U1175 ( .A(n1198), .B(n412), .Y(n406) );
  NAND2X1 U1176 ( .A(n423), .B(n410), .Y(n1199) );
  NAND2X1 U1177 ( .A(n423), .B(n412), .Y(n1200) );
  NAND2X1 U1178 ( .A(n410), .B(n412), .Y(n1201) );
  NAND3X1 U1179 ( .A(n1199), .B(n1200), .C(n1201), .Y(n405) );
  XOR2X1 U1180 ( .A(n407), .B(n1156), .Y(n1202) );
  NAND2X1 U1181 ( .A(n407), .B(n1156), .Y(n1203) );
  NAND2X1 U1182 ( .A(n407), .B(n405), .Y(n1204) );
  NAND2X1 U1183 ( .A(n1156), .B(n405), .Y(n1205) );
  NAND3X1 U1184 ( .A(n1203), .B(n1204), .C(n1205), .Y(n389) );
  INVX4 U1185 ( .A(n51), .Y(n1255) );
  INVX2 U1186 ( .A(n557), .Y(n673) );
  INVX1 U1187 ( .A(n216), .Y(n290) );
  INVX2 U1188 ( .A(n1149), .Y(n1248) );
  INVX1 U1189 ( .A(n183), .Y(n181) );
  XOR2X1 U1190 ( .A(n395), .B(n384), .Y(n1207) );
  XOR2X1 U1191 ( .A(n1207), .B(n382), .Y(n378) );
  NAND2X1 U1192 ( .A(n395), .B(n384), .Y(n1208) );
  NAND2X1 U1193 ( .A(n395), .B(n382), .Y(n1209) );
  NAND2X1 U1194 ( .A(n384), .B(n382), .Y(n1210) );
  NAND3X1 U1195 ( .A(n1208), .B(n1209), .C(n1210), .Y(n377) );
  NAND2X1 U1196 ( .A(n368), .B(n1002), .Y(n1211) );
  NAND2X1 U1197 ( .A(n368), .B(n377), .Y(n1212) );
  NAND2X1 U1198 ( .A(n1002), .B(n377), .Y(n1213) );
  NAND3X1 U1199 ( .A(n1211), .B(n1212), .C(n1213), .Y(n363) );
  XOR2X1 U1200 ( .A(n409), .B(n396), .Y(n1214) );
  XOR2X1 U1201 ( .A(n1214), .B(n398), .Y(n392) );
  NAND2X1 U1202 ( .A(n409), .B(n396), .Y(n1215) );
  NAND2X1 U1203 ( .A(n409), .B(n398), .Y(n1216) );
  NAND2X1 U1204 ( .A(n396), .B(n398), .Y(n1217) );
  NAND3X1 U1205 ( .A(n1215), .B(n1216), .C(n1217), .Y(n391) );
  XOR2X1 U1206 ( .A(n393), .B(n380), .Y(n1218) );
  XOR2X1 U1207 ( .A(n1218), .B(n391), .Y(n376) );
  NAND2X1 U1208 ( .A(n393), .B(n380), .Y(n1219) );
  NAND2X1 U1209 ( .A(n393), .B(n391), .Y(n1220) );
  NAND2X1 U1210 ( .A(n380), .B(n391), .Y(n1221) );
  NAND3X1 U1211 ( .A(n1219), .B(n1220), .C(n1221), .Y(n375) );
  XOR2X1 U1212 ( .A(n383), .B(n381), .Y(n1222) );
  XOR2X1 U1213 ( .A(n1222), .B(n370), .Y(n366) );
  NAND2X1 U1214 ( .A(n609), .B(n657), .Y(n1223) );
  NAND2X1 U1215 ( .A(n609), .B(n641), .Y(n1224) );
  NAND2X1 U1216 ( .A(n657), .B(n641), .Y(n1225) );
  NAND3X1 U1217 ( .A(n1223), .B(n1224), .C(n1225), .Y(n369) );
  NAND2X1 U1218 ( .A(n383), .B(n381), .Y(n1226) );
  NAND2X1 U1219 ( .A(n383), .B(n370), .Y(n1227) );
  NAND2X1 U1220 ( .A(n381), .B(n370), .Y(n1228) );
  NAND3X1 U1221 ( .A(n1226), .B(n1227), .C(n1228), .Y(n365) );
  AOI22X1 U1222 ( .A(n1238), .B(n1230), .C(n1013), .D(n1297), .Y(n1229) );
  INVX1 U1223 ( .A(n194), .Y(n287) );
  XNOR2X1 U1224 ( .A(n86), .B(n1231), .Y(product[45]) );
  AND2X2 U1225 ( .A(n85), .B(n275), .Y(n1231) );
  INVX4 U1226 ( .A(n1014), .Y(n1232) );
  INVX2 U1227 ( .A(n1238), .Y(n1239) );
  INVX4 U1228 ( .A(n46), .Y(n1253) );
  INVX1 U1229 ( .A(n172), .Y(n174) );
  INVX1 U1230 ( .A(n171), .Y(n173) );
  INVX1 U1231 ( .A(n205), .Y(n288) );
  INVX1 U1232 ( .A(n177), .Y(n284) );
  INVX2 U1233 ( .A(n560), .Y(n691) );
  INVX1 U1234 ( .A(n166), .Y(n283) );
  INVX1 U1235 ( .A(n161), .Y(n282) );
  INVX1 U1236 ( .A(n1163), .Y(n156) );
  INVX8 U1237 ( .A(n1244), .Y(n1246) );
  INVX8 U1238 ( .A(n1253), .Y(n1254) );
  INVX8 U1239 ( .A(n1255), .Y(n1256) );
  INVX8 U1240 ( .A(n1263), .Y(n1264) );
  INVX8 U1241 ( .A(n1265), .Y(n1266) );
  INVX8 U1242 ( .A(n1272), .Y(n1273) );
  INVX8 U1243 ( .A(n1276), .Y(n1277) );
  INVX8 U1244 ( .A(n1278), .Y(n1279) );
  INVX8 U1245 ( .A(n1280), .Y(n1281) );
  INVX8 U1246 ( .A(n7), .Y(n1294) );
  INVX2 U1247 ( .A(n101), .Y(n99) );
  INVX2 U1248 ( .A(n79), .Y(n77) );
  INVX2 U1249 ( .A(n1279), .Y(n729) );
  OAI22X1 U1250 ( .A(n1233), .B(n1294), .C(n1234), .D(n1294), .Y(n560) );
  OAI22X1 U1251 ( .A(n1050), .B(n1005), .C(n1237), .D(n1005), .Y(n557) );
  OAI22X1 U1252 ( .A(n1122), .B(n1301), .C(n1243), .D(n1301), .Y(n551) );
  OAI22X1 U1253 ( .A(n1245), .B(n1303), .C(n1035), .D(n995), .Y(n548) );
  INVX2 U1254 ( .A(n1249), .Y(n546) );
  OAI22X1 U1255 ( .A(n1248), .B(n1305), .C(n1251), .D(n1305), .Y(n545) );
  OAI22X1 U1256 ( .A(n1090), .B(n1082), .C(n1088), .D(n1083), .Y(n542) );
  INVX2 U1257 ( .A(n359), .Y(n360) );
  INVX2 U1258 ( .A(n337), .Y(n338) );
  INVX2 U1259 ( .A(n319), .Y(n320) );
  INVX2 U1260 ( .A(n305), .Y(n306) );
  INVX2 U1261 ( .A(n295), .Y(n296) );
  INVX2 U1262 ( .A(n130), .Y(n279) );
  INVX2 U1263 ( .A(n211), .Y(n209) );
  INVX2 U1264 ( .A(n1155), .Y(n155) );
  INVX2 U1265 ( .A(n149), .Y(n151) );
  INVX2 U1266 ( .A(n144), .Y(n142) );
  INVX2 U1267 ( .A(n129), .Y(n127) );
  INVX2 U1268 ( .A(n122), .Y(n120) );
  INVX2 U1269 ( .A(n111), .Y(n109) );
  INVX2 U1270 ( .A(n105), .Y(n103) );
  INVX2 U1271 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n3, src1_data[14], 
        n29, src1_data[12], n25, n14, n6, n9, src1_data[7], n10, 
        src1_data[5:4], n15, n11, src1_data[1], n4}), .B({src2_data[16], 
        src2_data[16:15], n13, src2_data[13], n17, src2_data[11:10], n8, 
        src2_data[8], n22, n21, src2_data[5:1], n23}), .CI(1'b0), .DIFF(
        large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n3, src1_data[14], 
        n29, src1_data[12], n25, n14, n6, n9, src1_data[7], n10, 
        src1_data[5:4], n15, n11, src1_data[1], n4}), .B({src2_data[16], 
        src2_data[16:15], n13, src2_data[13], n17, src2_data[11:10], n8, 
        src2_data[8], n22, n21, src2_data[5:4], n1, src2_data[2:1], n23}), 
        .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:14], n29, src1_data[12], n25, 
        src1_data[10:0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .b({src2_data[15:1], n23}), 
        .product({N26, full_mult[45:30], SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29}) );
  INVX4 U3 ( .A(n26), .Y(n25) );
  INVX2 U4 ( .A(src1_data[11]), .Y(n26) );
  INVX4 U6 ( .A(n24), .Y(n23) );
  INVX2 U7 ( .A(src2_data[0]), .Y(n24) );
  BUFX2 U9 ( .A(src2_data[3]), .Y(n1) );
  INVX1 U10 ( .A(src1_data[15]), .Y(n2) );
  INVX2 U11 ( .A(n2), .Y(n3) );
  BUFX2 U12 ( .A(src1_data[0]), .Y(n4) );
  INVX1 U13 ( .A(src1_data[9]), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n6) );
  INVX1 U15 ( .A(src2_data[9]), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n8) );
  BUFX2 U17 ( .A(src1_data[8]), .Y(n9) );
  BUFX2 U18 ( .A(src1_data[6]), .Y(n10) );
  BUFX2 U19 ( .A(src1_data[2]), .Y(n11) );
  INVX1 U20 ( .A(src2_data[14]), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n13) );
  BUFX2 U22 ( .A(src1_data[10]), .Y(n14) );
  BUFX2 U23 ( .A(src1_data[3]), .Y(n15) );
  INVX1 U24 ( .A(src2_data[12]), .Y(n16) );
  INVX2 U25 ( .A(n16), .Y(n17) );
  INVX2 U26 ( .A(n71), .Y(n66) );
  AND2X2 U27 ( .A(n35), .B(n34), .Y(n18) );
  AND2X2 U28 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n19) );
  AND2X2 U29 ( .A(alu_op[1]), .B(n34), .Y(n20) );
  BUFX2 U30 ( .A(src2_data[6]), .Y(n21) );
  BUFX2 U31 ( .A(src2_data[7]), .Y(n22) );
  INVX4 U32 ( .A(src1_data[13]), .Y(n30) );
  INVX8 U33 ( .A(n30), .Y(n29) );
  INVX2 U34 ( .A(large_sum[16]), .Y(n70) );
  XOR2X1 U35 ( .A(n70), .B(large_sum[17]), .Y(n33) );
  INVX2 U36 ( .A(alu_op[1]), .Y(n35) );
  NAND2X1 U37 ( .A(alu_op[0]), .B(n35), .Y(n71) );
  INVX2 U38 ( .A(alu_op[0]), .Y(n34) );
  XOR2X1 U39 ( .A(large_dif[16]), .B(large_dif[17]), .Y(n31) );
  AOI22X1 U40 ( .A(N26), .B(n19), .C(n20), .D(n31), .Y(n32) );
  OAI21X1 U41 ( .A(n33), .B(n71), .C(n32), .Y(overflow) );
  AOI22X1 U42 ( .A(n4), .B(n18), .C(full_mult[30]), .D(n19), .Y(n37) );
  AOI22X1 U43 ( .A(large_dif[0]), .B(n20), .C(large_sum[0]), .D(n66), .Y(n36)
         );
  NAND2X1 U44 ( .A(n37), .B(n36), .Y(result[0]) );
  AOI22X1 U45 ( .A(src1_data[1]), .B(n18), .C(full_mult[31]), .D(n19), .Y(n39)
         );
  AOI22X1 U46 ( .A(large_dif[1]), .B(n20), .C(large_sum[1]), .D(n66), .Y(n38)
         );
  NAND2X1 U47 ( .A(n39), .B(n38), .Y(result[1]) );
  AOI22X1 U48 ( .A(n11), .B(n18), .C(full_mult[32]), .D(n19), .Y(n41) );
  AOI22X1 U49 ( .A(large_dif[2]), .B(n20), .C(large_sum[2]), .D(n66), .Y(n40)
         );
  NAND2X1 U50 ( .A(n41), .B(n40), .Y(result[2]) );
  AOI22X1 U51 ( .A(n15), .B(n18), .C(full_mult[33]), .D(n19), .Y(n43) );
  AOI22X1 U52 ( .A(large_dif[3]), .B(n20), .C(large_sum[3]), .D(n66), .Y(n42)
         );
  NAND2X1 U53 ( .A(n43), .B(n42), .Y(result[3]) );
  AOI22X1 U54 ( .A(src1_data[4]), .B(n18), .C(full_mult[34]), .D(n19), .Y(n45)
         );
  AOI22X1 U55 ( .A(large_dif[4]), .B(n20), .C(large_sum[4]), .D(n66), .Y(n44)
         );
  NAND2X1 U56 ( .A(n45), .B(n44), .Y(result[4]) );
  AOI22X1 U57 ( .A(src1_data[5]), .B(n18), .C(full_mult[35]), .D(n19), .Y(n47)
         );
  AOI22X1 U58 ( .A(large_dif[5]), .B(n20), .C(large_sum[5]), .D(n66), .Y(n46)
         );
  NAND2X1 U59 ( .A(n47), .B(n46), .Y(result[5]) );
  AOI22X1 U60 ( .A(n10), .B(n18), .C(full_mult[36]), .D(n19), .Y(n49) );
  AOI22X1 U61 ( .A(large_dif[6]), .B(n20), .C(large_sum[6]), .D(n66), .Y(n48)
         );
  NAND2X1 U62 ( .A(n49), .B(n48), .Y(result[6]) );
  AOI22X1 U63 ( .A(src1_data[7]), .B(n18), .C(full_mult[37]), .D(n19), .Y(n51)
         );
  AOI22X1 U64 ( .A(large_dif[7]), .B(n20), .C(large_sum[7]), .D(n66), .Y(n50)
         );
  NAND2X1 U65 ( .A(n50), .B(n51), .Y(result[7]) );
  AOI22X1 U66 ( .A(n9), .B(n18), .C(full_mult[38]), .D(n19), .Y(n53) );
  AOI22X1 U67 ( .A(large_dif[8]), .B(n20), .C(large_sum[8]), .D(n66), .Y(n52)
         );
  NAND2X1 U68 ( .A(n52), .B(n53), .Y(result[8]) );
  AOI22X1 U69 ( .A(n6), .B(n18), .C(full_mult[39]), .D(n19), .Y(n55) );
  AOI22X1 U70 ( .A(large_dif[9]), .B(n20), .C(large_sum[9]), .D(n66), .Y(n54)
         );
  NAND2X1 U71 ( .A(n55), .B(n54), .Y(result[9]) );
  AOI22X1 U72 ( .A(n14), .B(n18), .C(full_mult[40]), .D(n19), .Y(n57) );
  AOI22X1 U73 ( .A(large_dif[10]), .B(n20), .C(large_sum[10]), .D(n66), .Y(n56) );
  NAND2X1 U74 ( .A(n56), .B(n57), .Y(result[10]) );
  AOI22X1 U75 ( .A(n25), .B(n18), .C(full_mult[41]), .D(n19), .Y(n59) );
  AOI22X1 U76 ( .A(large_dif[11]), .B(n20), .C(large_sum[11]), .D(n66), .Y(n58) );
  NAND2X1 U77 ( .A(n59), .B(n58), .Y(result[11]) );
  AOI22X1 U78 ( .A(src1_data[12]), .B(n18), .C(full_mult[42]), .D(n19), .Y(n61) );
  AOI22X1 U79 ( .A(large_dif[12]), .B(n20), .C(large_sum[12]), .D(n66), .Y(n60) );
  NAND2X1 U80 ( .A(n60), .B(n61), .Y(result[12]) );
  AOI22X1 U81 ( .A(n29), .B(n18), .C(full_mult[43]), .D(n19), .Y(n63) );
  AOI22X1 U82 ( .A(large_dif[13]), .B(n20), .C(large_sum[13]), .D(n66), .Y(n62) );
  NAND2X1 U83 ( .A(n62), .B(n63), .Y(result[13]) );
  AOI22X1 U84 ( .A(src1_data[14]), .B(n18), .C(full_mult[44]), .D(n19), .Y(n65) );
  AOI22X1 U85 ( .A(large_dif[14]), .B(n20), .C(large_sum[14]), .D(n66), .Y(n64) );
  NAND2X1 U86 ( .A(n64), .B(n65), .Y(result[14]) );
  AOI22X1 U87 ( .A(n3), .B(n18), .C(full_mult[45]), .D(n19), .Y(n68) );
  AOI22X1 U88 ( .A(large_dif[15]), .B(n20), .C(large_sum[15]), .D(n66), .Y(n67) );
  NAND2X1 U89 ( .A(n67), .B(n68), .Y(result[15]) );
  AOI22X1 U90 ( .A(src1_data[16]), .B(n18), .C(large_dif[16]), .D(n20), .Y(n69) );
  OAI21X1 U91 ( .A(n71), .B(n70), .C(n69), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(write_enable), .Y(n1) );
  INVX2 U4 ( .A(n4), .Y(n3) );
  INVX2 U5 ( .A(n_reset), .Y(n4) );
  INVX1 U6 ( .A(n16), .Y(n36) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n18), .Y(n32) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n708), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n707), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n709), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n708), .Y(n10) );
  NOR2X1 U29 ( .A(n706), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n707), .B(n709), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n705), 
        .write_enable(write_enables[0]), .new_value({n697, n694, n691, n688, 
        n685, n682, n679, n676, n673, n671, n669, n666, n663, n660, n657, n654, 
        n651}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n698), 
        .write_enable(write_enables[1]), .new_value({n696, n693, n690, n687, 
        n684, n681, n678, n675, n673, n671, n668, n665, n662, n659, n656, n653, 
        n651}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n698), 
        .write_enable(write_enables[2]), .new_value({n697, n694, n691, n688, 
        n685, n682, n679, n676, n673, n671, n669, n666, n663, n660, n657, n654, 
        w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n699), 
        .write_enable(write_enables[3]), .new_value({n696, n693, n690, n687, 
        n684, n681, n678, n675, n673, n671, n668, n665, n662, n659, n656, n653, 
        n651}), .current_value({\regs_matrix[3][16] , \regs_matrix[3][15] , 
        \regs_matrix[3][14] , \regs_matrix[3][13] , \regs_matrix[3][12] , 
        \regs_matrix[3][11] , \regs_matrix[3][10] , \regs_matrix[3][9] , 
        \regs_matrix[3][8] , \regs_matrix[3][7] , \regs_matrix[3][6] , 
        \regs_matrix[3][5] , \regs_matrix[3][4] , \regs_matrix[3][3] , 
        \regs_matrix[3][2] , \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n699), 
        .write_enable(write_enables[4]), .new_value({n697, n694, n691, n688, 
        n685, n682, n679, n676, n673, n671, n669, n666, n663, n660, n657, n654, 
        w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n700), 
        .write_enable(write_enables[5]), .new_value({n696, n693, n690, n687, 
        n685, n681, n678, n675, n673, n671, n668, n665, n662, n659, n656, n653, 
        n651}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n700), 
        .write_enable(write_enables[6]), .new_value({n697, n694, n691, n688, 
        n684, n682, n679, n676, n673, n671, n669, n666, n663, n660, n657, n654, 
        w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n701), 
        .write_enable(write_enables[7]), .new_value({n696, n693, n690, n687, 
        n684, n681, n678, n675, n673, n671, n668, n665, n662, n659, n656, n653, 
        n651}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n701), 
        .write_enable(write_enables[8]), .new_value({n697, n694, n691, n688, 
        n684, n682, n679, n676, n673, n671, n669, n666, n663, n660, n657, n654, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n702), 
        .write_enable(write_enables[9]), .new_value({n696, n693, n690, n687, 
        n685, n681, n678, n675, n673, n671, n668, n665, n662, n659, n656, n653, 
        n651}), .current_value({\regs_matrix[9][16] , \regs_matrix[9][15] , 
        \regs_matrix[9][14] , \regs_matrix[9][13] , \regs_matrix[9][12] , 
        \regs_matrix[9][11] , \regs_matrix[9][10] , \regs_matrix[9][9] , 
        \regs_matrix[9][8] , \regs_matrix[9][7] , \regs_matrix[9][6] , 
        \regs_matrix[9][5] , \regs_matrix[9][4] , \regs_matrix[9][3] , 
        \regs_matrix[9][2] , \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n702), 
        .write_enable(write_enables[10]), .new_value({n697, n694, n691, n688, 
        n685, n682, n679, n676, n673, n671, n669, n666, n663, n660, n657, n654, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n703), 
        .write_enable(write_enables[11]), .new_value({n696, n693, n690, n687, 
        n685, n681, n678, n675, n673, n671, n668, n665, n662, n659, n656, n653, 
        n651}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n703), 
        .write_enable(write_enables[12]), .new_value({n697, n694, n691, n687, 
        n684, n682, n679, n676, n673, n671, n669, n666, n663, n660, n657, n654, 
        w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n704), 
        .write_enable(write_enables[13]), .new_value({n696, n693, n690, n687, 
        n684, n681, n678, n675, n673, n671, n668, n665, n662, n659, n656, n653, 
        n651}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n704), 
        .write_enable(write_enables[14]), .new_value({n697, n694, n691, n688, 
        n684, n682, n679, n676, n673, n671, n669, n666, n663, n660, n657, n654, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n705), 
        .write_enable(write_enables[15]), .new_value({n696, n693, n690, n687, 
        n685, n681, n678, n675, n673, n671, n668, n665, n662, n659, n656, n653, 
        n651}), .current_value({\regs_matrix[15][16] , \regs_matrix[15][15] , 
        \regs_matrix[15][14] , \regs_matrix[15][13] , \regs_matrix[15][12] , 
        \regs_matrix[15][11] , \regs_matrix[15][10] , \regs_matrix[15][9] , 
        \regs_matrix[15][8] , \regs_matrix[15][7] , \regs_matrix[15][6] , 
        \regs_matrix[15][5] , \regs_matrix[15][4] , \regs_matrix[15][3] , 
        \regs_matrix[15][2] , \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  INVX2 U2 ( .A(n324), .Y(n1) );
  INVX4 U3 ( .A(N11), .Y(n324) );
  INVX4 U4 ( .A(n280), .Y(r1_data[14]) );
  INVX4 U5 ( .A(n110), .Y(r1_data[4]) );
  BUFX4 U31 ( .A(n615), .Y(n618) );
  INVX4 U32 ( .A(n618), .Y(n619) );
  INVX4 U33 ( .A(n51), .Y(n348) );
  INVX8 U34 ( .A(n624), .Y(n625) );
  INVX4 U35 ( .A(n649), .Y(n647) );
  INVX4 U36 ( .A(n642), .Y(n649) );
  INVX2 U37 ( .A(n649), .Y(n648) );
  INVX2 U38 ( .A(n380), .Y(n635) );
  INVX2 U39 ( .A(n45), .Y(n340) );
  INVX4 U40 ( .A(n351), .Y(n354) );
  BUFX2 U41 ( .A(n26), .Y(n351) );
  INVX4 U42 ( .A(n345), .Y(n346) );
  INVX2 U43 ( .A(n40), .Y(n329) );
  INVX2 U44 ( .A(n41), .Y(n333) );
  BUFX2 U45 ( .A(n622), .Y(n624) );
  INVX2 U46 ( .A(n76), .Y(r1_data[2]) );
  INVX2 U47 ( .A(n93), .Y(r1_data[3]) );
  INVX4 U48 ( .A(n352), .Y(n353) );
  INVX2 U49 ( .A(n329), .Y(n332) );
  INVX2 U50 ( .A(n195), .Y(r1_data[9]) );
  INVX2 U51 ( .A(n348), .Y(n22) );
  INVX4 U52 ( .A(n329), .Y(n331) );
  INVX2 U53 ( .A(n178), .Y(r1_data[8]) );
  INVX2 U54 ( .A(n246), .Y(r1_data[12]) );
  INVX2 U55 ( .A(n161), .Y(r1_data[7]) );
  AND2X2 U56 ( .A(N11), .B(N10), .Y(n358) );
  AND2X1 U57 ( .A(N16), .B(N14), .Y(n4) );
  AND2X2 U58 ( .A(n3), .B(n611), .Y(n2) );
  AND2X2 U59 ( .A(N15), .B(N14), .Y(n3) );
  INVX4 U60 ( .A(n340), .Y(n341) );
  INVX2 U61 ( .A(n377), .Y(n630) );
  INVX2 U62 ( .A(n42), .Y(n337) );
  INVX4 U63 ( .A(n623), .Y(n626) );
  INVX4 U64 ( .A(n18), .Y(n347) );
  INVX2 U65 ( .A(n333), .Y(n335) );
  INVX2 U66 ( .A(n354), .Y(n17) );
  MUX2X1 U67 ( .B(n530), .A(n529), .S(n646), .Y(r2_data[11]) );
  MUX2X1 U68 ( .B(n558), .A(n557), .S(n646), .Y(r2_data[13]) );
  BUFX2 U69 ( .A(n615), .Y(n616) );
  INVX2 U70 ( .A(n144), .Y(r1_data[6]) );
  INVX4 U71 ( .A(n333), .Y(n336) );
  MUX2X1 U72 ( .B(n516), .A(n515), .S(n646), .Y(r2_data[10]) );
  NAND2X1 U73 ( .A(n610), .B(n4), .Y(n381) );
  INVX8 U74 ( .A(n47), .Y(n14) );
  INVX8 U75 ( .A(n14), .Y(n15) );
  INVX8 U76 ( .A(n14), .Y(n16) );
  MUX2X1 U77 ( .B(n586), .A(n585), .S(n646), .Y(r2_data[15]) );
  INVX4 U78 ( .A(n630), .Y(n632) );
  INVX4 U79 ( .A(n683), .Y(n684) );
  INVX4 U80 ( .A(n683), .Y(n685) );
  INVX2 U81 ( .A(n212), .Y(r1_data[10]) );
  INVX2 U82 ( .A(n297), .Y(r1_data[15]) );
  INVX2 U83 ( .A(n33), .Y(r1_data[0]) );
  INVX4 U84 ( .A(n635), .Y(n24) );
  INVX8 U85 ( .A(n2), .Y(n634) );
  BUFX4 U86 ( .A(n615), .Y(n617) );
  INVX2 U87 ( .A(n350), .Y(n355) );
  INVX2 U88 ( .A(n50), .Y(n18) );
  INVX1 U89 ( .A(n342), .Y(n19) );
  INVX2 U90 ( .A(n19), .Y(n20) );
  INVX4 U91 ( .A(n340), .Y(n342) );
  INVX8 U92 ( .A(n337), .Y(n339) );
  INVX8 U93 ( .A(n627), .Y(n628) );
  INVX8 U94 ( .A(n638), .Y(n639) );
  INVX1 U95 ( .A(n343), .Y(n344) );
  INVX4 U96 ( .A(n677), .Y(n679) );
  INVX4 U97 ( .A(n677), .Y(n678) );
  INVX2 U98 ( .A(n337), .Y(n338) );
  INVX1 U99 ( .A(n15), .Y(n343) );
  INVX2 U100 ( .A(n329), .Y(n330) );
  INVX2 U101 ( .A(N12), .Y(n357) );
  INVX4 U102 ( .A(n333), .Y(n334) );
  INVX2 U103 ( .A(n635), .Y(n23) );
  INVX2 U104 ( .A(n348), .Y(n21) );
  INVX4 U105 ( .A(N16), .Y(n611) );
  INVX2 U106 ( .A(n348), .Y(n25) );
  BUFX4 U107 ( .A(n26), .Y(n352) );
  INVX2 U108 ( .A(w_data[16]), .Y(n695) );
  NOR2X1 U109 ( .A(n293), .B(n294), .Y(n281) );
  INVX2 U110 ( .A(w_data[4]), .Y(n661) );
  INVX2 U111 ( .A(w_data[3]), .Y(n658) );
  INVX2 U112 ( .A(w_data[2]), .Y(n655) );
  INVX2 U113 ( .A(w_data[5]), .Y(n664) );
  INVX2 U114 ( .A(w_data[1]), .Y(n652) );
  INVX2 U115 ( .A(n635), .Y(n637) );
  INVX2 U116 ( .A(n635), .Y(n636) );
  INVX2 U117 ( .A(n630), .Y(n631) );
  BUFX2 U118 ( .A(n622), .Y(n623) );
  BUFX2 U119 ( .A(n26), .Y(n350) );
  INVX2 U120 ( .A(n646), .Y(n645) );
  INVX2 U121 ( .A(N17), .Y(n646) );
  INVX2 U122 ( .A(n348), .Y(n349) );
  AND2X2 U123 ( .A(n358), .B(n325), .Y(n26) );
  INVX2 U124 ( .A(n695), .Y(n697) );
  INVX2 U125 ( .A(n695), .Y(n696) );
  INVX4 U126 ( .A(n686), .Y(n687) );
  INVX4 U127 ( .A(n680), .Y(n682) );
  INVX4 U128 ( .A(n692), .Y(n694) );
  INVX4 U129 ( .A(n667), .Y(n668) );
  INVX4 U130 ( .A(n674), .Y(n675) );
  INVX4 U131 ( .A(n667), .Y(n669) );
  INVX4 U132 ( .A(n674), .Y(n676) );
  INVX4 U133 ( .A(n680), .Y(n681) );
  INVX4 U134 ( .A(n692), .Y(n693) );
  INVX4 U135 ( .A(n686), .Y(n688) );
  INVX2 U136 ( .A(n661), .Y(n663) );
  INVX2 U137 ( .A(n661), .Y(n662) );
  INVX2 U138 ( .A(n658), .Y(n660) );
  INVX2 U139 ( .A(n655), .Y(n657) );
  INVX2 U140 ( .A(n658), .Y(n659) );
  INVX2 U141 ( .A(n655), .Y(n656) );
  INVX2 U142 ( .A(n664), .Y(n666) );
  INVX2 U143 ( .A(n664), .Y(n665) );
  INVX2 U144 ( .A(n652), .Y(n654) );
  INVX2 U145 ( .A(n652), .Y(n653) );
  INVX2 U146 ( .A(n650), .Y(n651) );
  INVX2 U147 ( .A(w_data[0]), .Y(n650) );
  BUFX2 U148 ( .A(n_reset), .Y(n698) );
  BUFX2 U149 ( .A(n_reset), .Y(n699) );
  BUFX2 U150 ( .A(n_reset), .Y(n700) );
  BUFX2 U151 ( .A(n_reset), .Y(n701) );
  BUFX2 U152 ( .A(n_reset), .Y(n702) );
  BUFX2 U153 ( .A(n_reset), .Y(n703) );
  BUFX2 U154 ( .A(n_reset), .Y(n704) );
  BUFX2 U155 ( .A(n_reset), .Y(n705) );
  AOI22X1 U156 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(n31) );
  INVX2 U157 ( .A(N13), .Y(n32) );
  INVX2 U158 ( .A(n31), .Y(r1_data[16]) );
  AOI22X1 U159 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n33) );
  NOR2X1 U160 ( .A(n38), .B(n39), .Y(n37) );
  OAI22X1 U161 ( .A(\regs_matrix[6][0] ), .B(n332), .C(outreg_data[0]), .D(
        n336), .Y(n39) );
  OAI21X1 U162 ( .A(\regs_matrix[4][0] ), .B(n339), .C(n32), .Y(n38) );
  NOR2X1 U163 ( .A(n43), .B(n44), .Y(n36) );
  OAI21X1 U164 ( .A(\regs_matrix[7][0] ), .B(n341), .C(n46), .Y(n44) );
  AOI22X1 U165 ( .A(n16), .B(n48), .C(n17), .D(n49), .Y(n46) );
  INVX2 U166 ( .A(\regs_matrix[3][0] ), .Y(n49) );
  INVX2 U167 ( .A(\regs_matrix[1][0] ), .Y(n48) );
  OAI22X1 U168 ( .A(\regs_matrix[2][0] ), .B(n346), .C(\regs_matrix[5][0] ), 
        .D(n22), .Y(n43) );
  NOR2X1 U169 ( .A(n52), .B(n53), .Y(n35) );
  OAI22X1 U170 ( .A(\regs_matrix[14][0] ), .B(n330), .C(\regs_matrix[8][0] ), 
        .D(n335), .Y(n53) );
  OAI21X1 U171 ( .A(\regs_matrix[12][0] ), .B(n338), .C(N13), .Y(n52) );
  NOR2X1 U172 ( .A(n54), .B(n55), .Y(n34) );
  OAI21X1 U173 ( .A(\regs_matrix[15][0] ), .B(n20), .C(n56), .Y(n55) );
  AOI22X1 U174 ( .A(n361), .B(n57), .C(n350), .D(n58), .Y(n56) );
  INVX2 U175 ( .A(\regs_matrix[11][0] ), .Y(n58) );
  INVX2 U176 ( .A(\regs_matrix[9][0] ), .Y(n57) );
  OAI22X1 U177 ( .A(\regs_matrix[10][0] ), .B(n346), .C(\regs_matrix[13][0] ), 
        .D(n25), .Y(n54) );
  AOI22X1 U178 ( .A(n60), .B(n61), .C(n62), .D(n63), .Y(n59) );
  NOR2X1 U179 ( .A(n64), .B(n65), .Y(n63) );
  OAI22X1 U180 ( .A(outreg_data[1]), .B(n336), .C(\regs_matrix[2][1] ), .D(
        n347), .Y(n65) );
  OAI22X1 U181 ( .A(\regs_matrix[4][1] ), .B(n339), .C(\regs_matrix[6][1] ), 
        .D(n332), .Y(n64) );
  NOR2X1 U182 ( .A(n66), .B(n67), .Y(n62) );
  OAI21X1 U183 ( .A(\regs_matrix[3][1] ), .B(n354), .C(n68), .Y(n67) );
  AOI21X1 U184 ( .A(n15), .B(n69), .C(N13), .Y(n68) );
  INVX2 U185 ( .A(\regs_matrix[1][1] ), .Y(n69) );
  OAI22X1 U186 ( .A(\regs_matrix[5][1] ), .B(n22), .C(\regs_matrix[7][1] ), 
        .D(n342), .Y(n66) );
  NOR2X1 U187 ( .A(n70), .B(n71), .Y(n61) );
  OAI22X1 U188 ( .A(\regs_matrix[8][1] ), .B(n335), .C(\regs_matrix[10][1] ), 
        .D(n347), .Y(n71) );
  OAI22X1 U189 ( .A(\regs_matrix[12][1] ), .B(n338), .C(\regs_matrix[14][1] ), 
        .D(n330), .Y(n70) );
  NOR2X1 U190 ( .A(n72), .B(n73), .Y(n60) );
  OAI21X1 U191 ( .A(\regs_matrix[11][1] ), .B(n355), .C(n74), .Y(n73) );
  AOI21X1 U192 ( .A(n344), .B(n75), .C(n32), .Y(n74) );
  INVX2 U193 ( .A(\regs_matrix[9][1] ), .Y(n75) );
  OAI22X1 U194 ( .A(\regs_matrix[13][1] ), .B(n25), .C(\regs_matrix[15][1] ), 
        .D(n20), .Y(n72) );
  AOI22X1 U195 ( .A(n77), .B(n78), .C(n79), .D(n80), .Y(n76) );
  NOR2X1 U196 ( .A(n81), .B(n82), .Y(n80) );
  OAI22X1 U197 ( .A(outreg_data[2]), .B(n334), .C(\regs_matrix[2][2] ), .D(
        n347), .Y(n82) );
  OAI22X1 U198 ( .A(\regs_matrix[4][2] ), .B(n339), .C(\regs_matrix[6][2] ), 
        .D(n331), .Y(n81) );
  NOR2X1 U199 ( .A(n83), .B(n84), .Y(n79) );
  OAI21X1 U200 ( .A(\regs_matrix[3][2] ), .B(n354), .C(n85), .Y(n84) );
  AOI21X1 U201 ( .A(n15), .B(n86), .C(N13), .Y(n85) );
  INVX2 U202 ( .A(\regs_matrix[1][2] ), .Y(n86) );
  OAI22X1 U203 ( .A(\regs_matrix[5][2] ), .B(n22), .C(\regs_matrix[7][2] ), 
        .D(n342), .Y(n83) );
  NOR2X1 U204 ( .A(n87), .B(n88), .Y(n78) );
  OAI22X1 U205 ( .A(\regs_matrix[8][2] ), .B(n335), .C(\regs_matrix[10][2] ), 
        .D(n356), .Y(n88) );
  OAI22X1 U206 ( .A(\regs_matrix[12][2] ), .B(n338), .C(\regs_matrix[14][2] ), 
        .D(n330), .Y(n87) );
  NOR2X1 U207 ( .A(n89), .B(n90), .Y(n77) );
  OAI21X1 U208 ( .A(\regs_matrix[11][2] ), .B(n355), .C(n91), .Y(n90) );
  AOI21X1 U209 ( .A(n361), .B(n92), .C(n32), .Y(n91) );
  INVX2 U210 ( .A(\regs_matrix[9][2] ), .Y(n92) );
  OAI22X1 U211 ( .A(\regs_matrix[13][2] ), .B(n25), .C(\regs_matrix[15][2] ), 
        .D(n20), .Y(n89) );
  AOI22X1 U212 ( .A(n94), .B(n95), .C(n96), .D(n97), .Y(n93) );
  NOR2X1 U213 ( .A(n98), .B(n99), .Y(n97) );
  OAI22X1 U214 ( .A(outreg_data[3]), .B(n336), .C(\regs_matrix[2][3] ), .D(
        n347), .Y(n99) );
  OAI22X1 U215 ( .A(\regs_matrix[4][3] ), .B(n339), .C(\regs_matrix[6][3] ), 
        .D(n331), .Y(n98) );
  NOR2X1 U216 ( .A(n100), .B(n101), .Y(n96) );
  OAI21X1 U217 ( .A(\regs_matrix[3][3] ), .B(n353), .C(n102), .Y(n101) );
  AOI21X1 U218 ( .A(n16), .B(n103), .C(N13), .Y(n102) );
  INVX2 U219 ( .A(\regs_matrix[1][3] ), .Y(n103) );
  OAI22X1 U220 ( .A(\regs_matrix[5][3] ), .B(n21), .C(\regs_matrix[7][3] ), 
        .D(n342), .Y(n100) );
  NOR2X1 U221 ( .A(n104), .B(n105), .Y(n95) );
  OAI22X1 U222 ( .A(\regs_matrix[8][3] ), .B(n335), .C(\regs_matrix[10][3] ), 
        .D(n356), .Y(n105) );
  OAI22X1 U223 ( .A(\regs_matrix[12][3] ), .B(n338), .C(\regs_matrix[14][3] ), 
        .D(n330), .Y(n104) );
  NOR2X1 U224 ( .A(n106), .B(n107), .Y(n94) );
  OAI21X1 U225 ( .A(\regs_matrix[11][3] ), .B(n355), .C(n108), .Y(n107) );
  AOI21X1 U226 ( .A(n344), .B(n109), .C(n32), .Y(n108) );
  INVX2 U227 ( .A(\regs_matrix[9][3] ), .Y(n109) );
  OAI22X1 U228 ( .A(\regs_matrix[13][3] ), .B(n25), .C(\regs_matrix[15][3] ), 
        .D(n20), .Y(n106) );
  AOI22X1 U229 ( .A(n111), .B(n112), .C(n113), .D(n114), .Y(n110) );
  NOR2X1 U230 ( .A(n115), .B(n116), .Y(n114) );
  OAI22X1 U231 ( .A(outreg_data[4]), .B(n334), .C(\regs_matrix[2][4] ), .D(
        n347), .Y(n116) );
  OAI22X1 U232 ( .A(\regs_matrix[4][4] ), .B(n339), .C(\regs_matrix[6][4] ), 
        .D(n331), .Y(n115) );
  NOR2X1 U233 ( .A(n117), .B(n118), .Y(n113) );
  OAI21X1 U234 ( .A(\regs_matrix[3][4] ), .B(n353), .C(n119), .Y(n118) );
  AOI21X1 U235 ( .A(n16), .B(n120), .C(N13), .Y(n119) );
  INVX2 U236 ( .A(\regs_matrix[1][4] ), .Y(n120) );
  OAI22X1 U237 ( .A(\regs_matrix[5][4] ), .B(n349), .C(\regs_matrix[7][4] ), 
        .D(n341), .Y(n117) );
  NOR2X1 U238 ( .A(n121), .B(n122), .Y(n112) );
  OAI22X1 U239 ( .A(\regs_matrix[8][4] ), .B(n335), .C(\regs_matrix[10][4] ), 
        .D(n356), .Y(n122) );
  OAI22X1 U240 ( .A(\regs_matrix[12][4] ), .B(n338), .C(\regs_matrix[14][4] ), 
        .D(n330), .Y(n121) );
  NOR2X1 U241 ( .A(n123), .B(n124), .Y(n111) );
  OAI21X1 U242 ( .A(\regs_matrix[11][4] ), .B(n355), .C(n125), .Y(n124) );
  AOI21X1 U243 ( .A(n361), .B(n126), .C(n32), .Y(n125) );
  INVX2 U244 ( .A(\regs_matrix[9][4] ), .Y(n126) );
  OAI22X1 U245 ( .A(\regs_matrix[13][4] ), .B(n25), .C(\regs_matrix[15][4] ), 
        .D(n20), .Y(n123) );
  AOI22X1 U246 ( .A(n128), .B(n129), .C(n130), .D(n131), .Y(n127) );
  NOR2X1 U247 ( .A(n133), .B(n132), .Y(n131) );
  OAI22X1 U248 ( .A(outreg_data[5]), .B(n336), .C(\regs_matrix[2][5] ), .D(
        n347), .Y(n133) );
  OAI22X1 U249 ( .A(\regs_matrix[4][5] ), .B(n339), .C(\regs_matrix[6][5] ), 
        .D(n332), .Y(n132) );
  NOR2X1 U250 ( .A(n134), .B(n135), .Y(n130) );
  OAI21X1 U251 ( .A(\regs_matrix[3][5] ), .B(n353), .C(n136), .Y(n135) );
  AOI21X1 U252 ( .A(n15), .B(n137), .C(N13), .Y(n136) );
  INVX2 U253 ( .A(\regs_matrix[1][5] ), .Y(n137) );
  OAI22X1 U254 ( .A(\regs_matrix[5][5] ), .B(n22), .C(\regs_matrix[7][5] ), 
        .D(n342), .Y(n134) );
  NOR2X1 U255 ( .A(n138), .B(n139), .Y(n129) );
  OAI22X1 U256 ( .A(\regs_matrix[8][5] ), .B(n335), .C(\regs_matrix[10][5] ), 
        .D(n356), .Y(n139) );
  OAI22X1 U257 ( .A(\regs_matrix[12][5] ), .B(n338), .C(\regs_matrix[14][5] ), 
        .D(n330), .Y(n138) );
  NOR2X1 U258 ( .A(n140), .B(n141), .Y(n128) );
  OAI21X1 U259 ( .A(\regs_matrix[11][5] ), .B(n355), .C(n142), .Y(n141) );
  AOI21X1 U260 ( .A(n344), .B(n143), .C(n32), .Y(n142) );
  INVX2 U261 ( .A(\regs_matrix[9][5] ), .Y(n143) );
  OAI22X1 U262 ( .A(\regs_matrix[13][5] ), .B(n25), .C(\regs_matrix[15][5] ), 
        .D(n20), .Y(n140) );
  AOI22X1 U263 ( .A(n145), .B(n146), .C(n147), .D(n148), .Y(n144) );
  NOR2X1 U264 ( .A(n149), .B(n150), .Y(n148) );
  OAI22X1 U265 ( .A(outreg_data[6]), .B(n334), .C(\regs_matrix[2][6] ), .D(
        n347), .Y(n150) );
  OAI22X1 U266 ( .A(\regs_matrix[4][6] ), .B(n339), .C(\regs_matrix[6][6] ), 
        .D(n332), .Y(n149) );
  NOR2X1 U267 ( .A(n151), .B(n152), .Y(n147) );
  OAI21X1 U268 ( .A(\regs_matrix[3][6] ), .B(n353), .C(n153), .Y(n152) );
  AOI21X1 U269 ( .A(n15), .B(n154), .C(N13), .Y(n153) );
  INVX2 U270 ( .A(\regs_matrix[1][6] ), .Y(n154) );
  OAI22X1 U271 ( .A(\regs_matrix[5][6] ), .B(n349), .C(\regs_matrix[7][6] ), 
        .D(n342), .Y(n151) );
  NOR2X1 U272 ( .A(n155), .B(n156), .Y(n146) );
  OAI22X1 U273 ( .A(\regs_matrix[8][6] ), .B(n335), .C(\regs_matrix[10][6] ), 
        .D(n356), .Y(n156) );
  OAI22X1 U274 ( .A(\regs_matrix[12][6] ), .B(n338), .C(\regs_matrix[14][6] ), 
        .D(n330), .Y(n155) );
  NOR2X1 U275 ( .A(n157), .B(n158), .Y(n145) );
  OAI21X1 U276 ( .A(\regs_matrix[11][6] ), .B(n355), .C(n159), .Y(n158) );
  AOI21X1 U277 ( .A(n361), .B(n160), .C(n32), .Y(n159) );
  INVX2 U278 ( .A(\regs_matrix[9][6] ), .Y(n160) );
  OAI22X1 U279 ( .A(\regs_matrix[13][6] ), .B(n25), .C(\regs_matrix[15][6] ), 
        .D(n20), .Y(n157) );
  AOI22X1 U280 ( .A(n162), .B(n163), .C(n164), .D(n165), .Y(n161) );
  NOR2X1 U281 ( .A(n166), .B(n167), .Y(n165) );
  OAI22X1 U282 ( .A(outreg_data[7]), .B(n334), .C(\regs_matrix[2][7] ), .D(
        n347), .Y(n167) );
  OAI22X1 U283 ( .A(\regs_matrix[4][7] ), .B(n339), .C(\regs_matrix[6][7] ), 
        .D(n332), .Y(n166) );
  NOR2X1 U284 ( .A(n168), .B(n169), .Y(n164) );
  OAI21X1 U285 ( .A(\regs_matrix[3][7] ), .B(n353), .C(n170), .Y(n169) );
  AOI21X1 U286 ( .A(n16), .B(n171), .C(N13), .Y(n170) );
  INVX2 U287 ( .A(\regs_matrix[1][7] ), .Y(n171) );
  OAI22X1 U288 ( .A(\regs_matrix[5][7] ), .B(n349), .C(\regs_matrix[7][7] ), 
        .D(n342), .Y(n168) );
  NOR2X1 U289 ( .A(n172), .B(n173), .Y(n163) );
  OAI22X1 U290 ( .A(\regs_matrix[8][7] ), .B(n335), .C(\regs_matrix[10][7] ), 
        .D(n356), .Y(n173) );
  OAI22X1 U291 ( .A(\regs_matrix[12][7] ), .B(n338), .C(\regs_matrix[14][7] ), 
        .D(n330), .Y(n172) );
  NOR2X1 U292 ( .A(n174), .B(n175), .Y(n162) );
  OAI21X1 U293 ( .A(\regs_matrix[11][7] ), .B(n355), .C(n176), .Y(n175) );
  AOI21X1 U294 ( .A(n344), .B(n177), .C(n32), .Y(n176) );
  INVX2 U295 ( .A(\regs_matrix[9][7] ), .Y(n177) );
  OAI22X1 U296 ( .A(\regs_matrix[13][7] ), .B(n25), .C(\regs_matrix[15][7] ), 
        .D(n20), .Y(n174) );
  AOI22X1 U297 ( .A(n179), .B(n180), .C(n181), .D(n182), .Y(n178) );
  NOR2X1 U298 ( .A(n183), .B(n184), .Y(n182) );
  OAI22X1 U299 ( .A(outreg_data[8]), .B(n334), .C(\regs_matrix[2][8] ), .D(
        n346), .Y(n184) );
  OAI22X1 U300 ( .A(\regs_matrix[4][8] ), .B(n339), .C(\regs_matrix[6][8] ), 
        .D(n331), .Y(n183) );
  NOR2X1 U301 ( .A(n185), .B(n186), .Y(n181) );
  OAI21X1 U302 ( .A(\regs_matrix[3][8] ), .B(n354), .C(n187), .Y(n186) );
  AOI21X1 U303 ( .A(n360), .B(n188), .C(N13), .Y(n187) );
  INVX2 U304 ( .A(\regs_matrix[1][8] ), .Y(n188) );
  OAI22X1 U305 ( .A(\regs_matrix[5][8] ), .B(n21), .C(\regs_matrix[7][8] ), 
        .D(n341), .Y(n185) );
  NOR2X1 U306 ( .A(n189), .B(n190), .Y(n180) );
  OAI22X1 U307 ( .A(\regs_matrix[8][8] ), .B(n335), .C(\regs_matrix[10][8] ), 
        .D(n356), .Y(n190) );
  OAI22X1 U308 ( .A(\regs_matrix[12][8] ), .B(n338), .C(\regs_matrix[14][8] ), 
        .D(n330), .Y(n189) );
  NOR2X1 U309 ( .A(n191), .B(n192), .Y(n179) );
  OAI21X1 U310 ( .A(\regs_matrix[11][8] ), .B(n355), .C(n193), .Y(n192) );
  AOI21X1 U311 ( .A(n361), .B(n194), .C(n32), .Y(n193) );
  INVX2 U312 ( .A(\regs_matrix[9][8] ), .Y(n194) );
  OAI22X1 U313 ( .A(\regs_matrix[13][8] ), .B(n25), .C(\regs_matrix[15][8] ), 
        .D(n20), .Y(n191) );
  AOI22X1 U314 ( .A(n196), .B(n197), .C(n198), .D(n199), .Y(n195) );
  NOR2X1 U315 ( .A(n200), .B(n201), .Y(n199) );
  OAI22X1 U316 ( .A(outreg_data[9]), .B(n334), .C(\regs_matrix[2][9] ), .D(
        n346), .Y(n201) );
  OAI22X1 U317 ( .A(\regs_matrix[4][9] ), .B(n339), .C(\regs_matrix[6][9] ), 
        .D(n332), .Y(n200) );
  NOR2X1 U318 ( .A(n202), .B(n203), .Y(n198) );
  OAI21X1 U319 ( .A(\regs_matrix[3][9] ), .B(n354), .C(n204), .Y(n203) );
  AOI21X1 U320 ( .A(n16), .B(n205), .C(N13), .Y(n204) );
  INVX2 U321 ( .A(\regs_matrix[1][9] ), .Y(n205) );
  OAI22X1 U322 ( .A(\regs_matrix[5][9] ), .B(n349), .C(\regs_matrix[7][9] ), 
        .D(n341), .Y(n202) );
  NOR2X1 U323 ( .A(n206), .B(n207), .Y(n197) );
  OAI22X1 U324 ( .A(\regs_matrix[8][9] ), .B(n335), .C(\regs_matrix[10][9] ), 
        .D(n356), .Y(n207) );
  OAI22X1 U325 ( .A(\regs_matrix[12][9] ), .B(n338), .C(\regs_matrix[14][9] ), 
        .D(n330), .Y(n206) );
  NOR2X1 U326 ( .A(n208), .B(n209), .Y(n196) );
  OAI21X1 U327 ( .A(\regs_matrix[11][9] ), .B(n355), .C(n210), .Y(n209) );
  AOI21X1 U328 ( .A(n344), .B(n211), .C(n32), .Y(n210) );
  INVX2 U329 ( .A(\regs_matrix[9][9] ), .Y(n211) );
  OAI22X1 U330 ( .A(\regs_matrix[13][9] ), .B(n25), .C(\regs_matrix[15][9] ), 
        .D(n20), .Y(n208) );
  AOI22X1 U331 ( .A(n213), .B(n214), .C(n215), .D(n216), .Y(n212) );
  NOR2X1 U332 ( .A(n218), .B(n217), .Y(n216) );
  OAI22X1 U333 ( .A(outreg_data[10]), .B(n334), .C(\regs_matrix[2][10] ), .D(
        n346), .Y(n218) );
  OAI22X1 U334 ( .A(\regs_matrix[4][10] ), .B(n339), .C(\regs_matrix[6][10] ), 
        .D(n331), .Y(n217) );
  NOR2X1 U335 ( .A(n219), .B(n220), .Y(n215) );
  OAI21X1 U336 ( .A(\regs_matrix[3][10] ), .B(n354), .C(n221), .Y(n220) );
  AOI21X1 U337 ( .A(n16), .B(n222), .C(N13), .Y(n221) );
  INVX2 U338 ( .A(\regs_matrix[1][10] ), .Y(n222) );
  OAI22X1 U339 ( .A(\regs_matrix[5][10] ), .B(n349), .C(\regs_matrix[7][10] ), 
        .D(n341), .Y(n219) );
  NOR2X1 U340 ( .A(n223), .B(n224), .Y(n214) );
  OAI22X1 U341 ( .A(\regs_matrix[8][10] ), .B(n335), .C(\regs_matrix[10][10] ), 
        .D(n356), .Y(n224) );
  OAI22X1 U342 ( .A(\regs_matrix[12][10] ), .B(n338), .C(\regs_matrix[14][10] ), .D(n330), .Y(n223) );
  NOR2X1 U343 ( .A(n225), .B(n226), .Y(n213) );
  OAI21X1 U344 ( .A(\regs_matrix[11][10] ), .B(n355), .C(n227), .Y(n226) );
  AOI21X1 U345 ( .A(n361), .B(n228), .C(n32), .Y(n227) );
  INVX2 U346 ( .A(\regs_matrix[9][10] ), .Y(n228) );
  OAI22X1 U347 ( .A(\regs_matrix[13][10] ), .B(n25), .C(\regs_matrix[15][10] ), 
        .D(n20), .Y(n225) );
  INVX2 U348 ( .A(n229), .Y(r1_data[11]) );
  AOI22X1 U349 ( .A(n230), .B(n231), .C(n232), .D(n233), .Y(n229) );
  NOR2X1 U350 ( .A(n235), .B(n234), .Y(n233) );
  OAI22X1 U351 ( .A(n336), .B(outreg_data[11]), .C(\regs_matrix[2][11] ), .D(
        n347), .Y(n235) );
  OAI22X1 U352 ( .A(\regs_matrix[4][11] ), .B(n339), .C(\regs_matrix[6][11] ), 
        .D(n331), .Y(n234) );
  NOR2X1 U353 ( .A(n236), .B(n237), .Y(n232) );
  OAI21X1 U354 ( .A(\regs_matrix[3][11] ), .B(n353), .C(n238), .Y(n237) );
  AOI21X1 U355 ( .A(n15), .B(n239), .C(N13), .Y(n238) );
  INVX2 U356 ( .A(\regs_matrix[1][11] ), .Y(n239) );
  OAI22X1 U357 ( .A(\regs_matrix[5][11] ), .B(n21), .C(\regs_matrix[7][11] ), 
        .D(n342), .Y(n236) );
  NOR2X1 U358 ( .A(n240), .B(n241), .Y(n231) );
  OAI22X1 U359 ( .A(\regs_matrix[8][11] ), .B(n335), .C(\regs_matrix[10][11] ), 
        .D(n356), .Y(n241) );
  OAI22X1 U360 ( .A(\regs_matrix[12][11] ), .B(n338), .C(\regs_matrix[14][11] ), .D(n330), .Y(n240) );
  NOR2X1 U361 ( .A(n242), .B(n243), .Y(n230) );
  OAI21X1 U362 ( .A(\regs_matrix[11][11] ), .B(n355), .C(n244), .Y(n243) );
  AOI21X1 U363 ( .A(n344), .B(n245), .C(n32), .Y(n244) );
  INVX2 U364 ( .A(\regs_matrix[9][11] ), .Y(n245) );
  OAI22X1 U365 ( .A(\regs_matrix[13][11] ), .B(n25), .C(\regs_matrix[15][11] ), 
        .D(n20), .Y(n242) );
  AOI22X1 U366 ( .A(n247), .B(n248), .C(n249), .D(n250), .Y(n246) );
  NOR2X1 U367 ( .A(n251), .B(n252), .Y(n250) );
  OAI22X1 U368 ( .A(outreg_data[12]), .B(n334), .C(\regs_matrix[2][12] ), .D(
        n346), .Y(n252) );
  OAI22X1 U369 ( .A(\regs_matrix[4][12] ), .B(n339), .C(\regs_matrix[6][12] ), 
        .D(n331), .Y(n251) );
  NOR2X1 U370 ( .A(n253), .B(n254), .Y(n249) );
  OAI21X1 U371 ( .A(\regs_matrix[3][12] ), .B(n353), .C(n255), .Y(n254) );
  AOI21X1 U372 ( .A(n16), .B(n256), .C(N13), .Y(n255) );
  INVX2 U373 ( .A(\regs_matrix[1][12] ), .Y(n256) );
  OAI22X1 U374 ( .A(\regs_matrix[5][12] ), .B(n21), .C(\regs_matrix[7][12] ), 
        .D(n341), .Y(n253) );
  NOR2X1 U375 ( .A(n257), .B(n258), .Y(n248) );
  OAI22X1 U376 ( .A(\regs_matrix[8][12] ), .B(n335), .C(\regs_matrix[10][12] ), 
        .D(n356), .Y(n258) );
  OAI22X1 U377 ( .A(\regs_matrix[12][12] ), .B(n338), .C(\regs_matrix[14][12] ), .D(n330), .Y(n257) );
  NOR2X1 U378 ( .A(n259), .B(n260), .Y(n247) );
  OAI21X1 U379 ( .A(\regs_matrix[11][12] ), .B(n355), .C(n261), .Y(n260) );
  AOI21X1 U380 ( .A(n361), .B(n262), .C(n32), .Y(n261) );
  INVX2 U381 ( .A(\regs_matrix[9][12] ), .Y(n262) );
  OAI22X1 U382 ( .A(\regs_matrix[13][12] ), .B(n25), .C(\regs_matrix[15][12] ), 
        .D(n20), .Y(n259) );
  INVX2 U383 ( .A(n263), .Y(r1_data[13]) );
  AOI22X1 U384 ( .A(n264), .B(n265), .C(n266), .D(n267), .Y(n263) );
  NOR2X1 U385 ( .A(n268), .B(n269), .Y(n267) );
  OAI22X1 U386 ( .A(outreg_data[13]), .B(n336), .C(\regs_matrix[2][13] ), .D(
        n346), .Y(n269) );
  OAI22X1 U387 ( .A(\regs_matrix[4][13] ), .B(n339), .C(\regs_matrix[6][13] ), 
        .D(n331), .Y(n268) );
  NOR2X1 U388 ( .A(n270), .B(n271), .Y(n266) );
  OAI21X1 U389 ( .A(\regs_matrix[3][13] ), .B(n353), .C(n272), .Y(n271) );
  AOI21X1 U390 ( .A(n16), .B(n273), .C(N13), .Y(n272) );
  INVX2 U391 ( .A(\regs_matrix[1][13] ), .Y(n273) );
  OAI22X1 U392 ( .A(\regs_matrix[5][13] ), .B(n22), .C(\regs_matrix[7][13] ), 
        .D(n341), .Y(n270) );
  NOR2X1 U393 ( .A(n274), .B(n275), .Y(n265) );
  OAI22X1 U394 ( .A(\regs_matrix[8][13] ), .B(n335), .C(\regs_matrix[10][13] ), 
        .D(n346), .Y(n275) );
  OAI22X1 U395 ( .A(\regs_matrix[12][13] ), .B(n338), .C(\regs_matrix[14][13] ), .D(n330), .Y(n274) );
  NOR2X1 U396 ( .A(n276), .B(n277), .Y(n264) );
  OAI21X1 U397 ( .A(\regs_matrix[11][13] ), .B(n355), .C(n278), .Y(n277) );
  AOI21X1 U398 ( .A(n344), .B(n279), .C(n32), .Y(n278) );
  INVX2 U399 ( .A(\regs_matrix[9][13] ), .Y(n279) );
  OAI22X1 U400 ( .A(\regs_matrix[13][13] ), .B(n25), .C(\regs_matrix[15][13] ), 
        .D(n20), .Y(n276) );
  AOI22X1 U401 ( .A(n281), .B(n282), .C(n283), .D(n284), .Y(n280) );
  NOR2X1 U402 ( .A(n285), .B(n286), .Y(n284) );
  OAI22X1 U403 ( .A(outreg_data[14]), .B(n334), .C(\regs_matrix[2][14] ), .D(
        n346), .Y(n286) );
  OAI22X1 U404 ( .A(\regs_matrix[4][14] ), .B(n339), .C(\regs_matrix[6][14] ), 
        .D(n331), .Y(n285) );
  NOR2X1 U405 ( .A(n287), .B(n288), .Y(n283) );
  OAI21X1 U406 ( .A(\regs_matrix[3][14] ), .B(n353), .C(n289), .Y(n288) );
  AOI21X1 U407 ( .A(n16), .B(n290), .C(N13), .Y(n289) );
  INVX2 U408 ( .A(\regs_matrix[1][14] ), .Y(n290) );
  OAI22X1 U409 ( .A(\regs_matrix[5][14] ), .B(n21), .C(\regs_matrix[7][14] ), 
        .D(n341), .Y(n287) );
  NOR2X1 U410 ( .A(n291), .B(n292), .Y(n282) );
  OAI22X1 U411 ( .A(\regs_matrix[8][14] ), .B(n335), .C(\regs_matrix[10][14] ), 
        .D(n347), .Y(n292) );
  OAI22X1 U412 ( .A(\regs_matrix[12][14] ), .B(n338), .C(\regs_matrix[14][14] ), .D(n330), .Y(n291) );
  OAI21X1 U413 ( .A(\regs_matrix[11][14] ), .B(n355), .C(n295), .Y(n294) );
  AOI21X1 U414 ( .A(n361), .B(n296), .C(n32), .Y(n295) );
  INVX2 U415 ( .A(\regs_matrix[9][14] ), .Y(n296) );
  OAI22X1 U416 ( .A(\regs_matrix[13][14] ), .B(n25), .C(\regs_matrix[15][14] ), 
        .D(n20), .Y(n293) );
  AOI22X1 U417 ( .A(n298), .B(n299), .C(n300), .D(n301), .Y(n297) );
  NOR2X1 U418 ( .A(n302), .B(n303), .Y(n301) );
  OAI22X1 U419 ( .A(outreg_data[15]), .B(n334), .C(\regs_matrix[2][15] ), .D(
        n346), .Y(n303) );
  OAI22X1 U420 ( .A(\regs_matrix[4][15] ), .B(n339), .C(\regs_matrix[6][15] ), 
        .D(n331), .Y(n302) );
  NOR2X1 U421 ( .A(n304), .B(n305), .Y(n300) );
  OAI21X1 U422 ( .A(\regs_matrix[3][15] ), .B(n354), .C(n306), .Y(n305) );
  AOI21X1 U423 ( .A(n16), .B(n307), .C(N13), .Y(n306) );
  INVX2 U424 ( .A(\regs_matrix[1][15] ), .Y(n307) );
  OAI22X1 U425 ( .A(\regs_matrix[5][15] ), .B(n349), .C(\regs_matrix[7][15] ), 
        .D(n341), .Y(n304) );
  NOR2X1 U426 ( .A(n308), .B(n309), .Y(n299) );
  OAI22X1 U427 ( .A(\regs_matrix[8][15] ), .B(n335), .C(\regs_matrix[10][15] ), 
        .D(n356), .Y(n309) );
  OAI22X1 U428 ( .A(\regs_matrix[12][15] ), .B(n338), .C(\regs_matrix[14][15] ), .D(n330), .Y(n308) );
  NOR2X1 U429 ( .A(n310), .B(n311), .Y(n298) );
  OAI21X1 U430 ( .A(\regs_matrix[11][15] ), .B(n355), .C(n312), .Y(n311) );
  AOI21X1 U431 ( .A(n344), .B(n313), .C(n32), .Y(n312) );
  INVX2 U432 ( .A(\regs_matrix[9][15] ), .Y(n313) );
  OAI22X1 U433 ( .A(\regs_matrix[13][15] ), .B(n25), .C(\regs_matrix[15][15] ), 
        .D(n20), .Y(n310) );
  NOR2X1 U434 ( .A(n315), .B(n316), .Y(n27) );
  OAI21X1 U435 ( .A(outreg_data[16]), .B(n334), .C(n317), .Y(n316) );
  AOI21X1 U436 ( .A(n345), .B(n318), .C(N13), .Y(n317) );
  INVX2 U437 ( .A(\regs_matrix[2][16] ), .Y(n318) );
  OAI22X1 U438 ( .A(\regs_matrix[4][16] ), .B(n339), .C(\regs_matrix[6][16] ), 
        .D(n331), .Y(n315) );
  NOR2X1 U439 ( .A(n319), .B(n320), .Y(n28) );
  OAI22X1 U440 ( .A(\regs_matrix[3][16] ), .B(n355), .C(\regs_matrix[1][16] ), 
        .D(n362), .Y(n320) );
  OAI22X1 U441 ( .A(\regs_matrix[5][16] ), .B(n22), .C(\regs_matrix[7][16] ), 
        .D(n20), .Y(n319) );
  NOR3X1 U442 ( .A(n321), .B(n322), .C(n323), .Y(n29) );
  OAI22X1 U443 ( .A(\regs_matrix[10][16] ), .B(n347), .C(\regs_matrix[8][16] ), 
        .D(n335), .Y(n323) );
  NAND3X1 U444 ( .A(n324), .B(n357), .C(n326), .Y(n41) );
  NAND3X1 U445 ( .A(n1), .B(n357), .C(n326), .Y(n50) );
  NOR2X1 U446 ( .A(\regs_matrix[12][16] ), .B(n338), .Y(n322) );
  NAND3X1 U447 ( .A(N12), .B(n324), .C(n326), .Y(n42) );
  OAI22X1 U448 ( .A(\regs_matrix[9][16] ), .B(n362), .C(\regs_matrix[14][16] ), 
        .D(n330), .Y(n321) );
  NAND3X1 U449 ( .A(N12), .B(N11), .C(n326), .Y(n40) );
  INVX2 U450 ( .A(N10), .Y(n326) );
  NAND3X1 U451 ( .A(N10), .B(n325), .C(n324), .Y(n314) );
  NOR2X1 U452 ( .A(n327), .B(n328), .Y(n30) );
  OAI21X1 U453 ( .A(\regs_matrix[11][16] ), .B(n355), .C(N13), .Y(n328) );
  OAI22X1 U454 ( .A(\regs_matrix[15][16] ), .B(n20), .C(\regs_matrix[13][16] ), 
        .D(n25), .Y(n327) );
  NAND3X1 U455 ( .A(n324), .B(N10), .C(N12), .Y(n51) );
  NAND2X1 U456 ( .A(N12), .B(n358), .Y(n45) );
  INVX4 U457 ( .A(n314), .Y(n47) );
  INVX2 U458 ( .A(n50), .Y(n345) );
  INVX1 U459 ( .A(n359), .Y(n356) );
  INVX2 U460 ( .A(N12), .Y(n325) );
  INVX1 U461 ( .A(n346), .Y(n359) );
  INVX2 U462 ( .A(n343), .Y(n360) );
  INVX4 U463 ( .A(n59), .Y(r1_data[1]) );
  INVX4 U464 ( .A(n127), .Y(r1_data[5]) );
  INVX1 U465 ( .A(n343), .Y(n361) );
  INVX2 U466 ( .A(n361), .Y(n362) );
  AOI22X1 U467 ( .A(n366), .B(n365), .C(n364), .D(n363), .Y(n367) );
  INVX2 U468 ( .A(n367), .Y(r2_data[16]) );
  MUX2X1 U469 ( .B(n368), .A(n369), .S(n645), .Y(r2_data[0]) );
  NAND2X1 U470 ( .A(n370), .B(n371), .Y(n369) );
  NOR2X1 U471 ( .A(n372), .B(n373), .Y(n371) );
  OAI22X1 U472 ( .A(\regs_matrix[8][0] ), .B(n619), .C(\regs_matrix[10][0] ), 
        .D(n625), .Y(n373) );
  OAI22X1 U473 ( .A(\regs_matrix[12][0] ), .B(n629), .C(\regs_matrix[14][0] ), 
        .D(n632), .Y(n372) );
  NOR2X1 U474 ( .A(n378), .B(n379), .Y(n370) );
  OAI22X1 U475 ( .A(\regs_matrix[11][0] ), .B(n633), .C(\regs_matrix[9][0] ), 
        .D(n24), .Y(n379) );
  OAI22X1 U476 ( .A(\regs_matrix[13][0] ), .B(n639), .C(\regs_matrix[15][0] ), 
        .D(n643), .Y(n378) );
  NAND2X1 U477 ( .A(n383), .B(n384), .Y(n368) );
  NOR2X1 U478 ( .A(n385), .B(n386), .Y(n384) );
  OAI22X1 U479 ( .A(outreg_data[0]), .B(n619), .C(\regs_matrix[2][0] ), .D(
        n625), .Y(n386) );
  OAI22X1 U480 ( .A(\regs_matrix[4][0] ), .B(n629), .C(\regs_matrix[6][0] ), 
        .D(n632), .Y(n385) );
  NOR2X1 U481 ( .A(n387), .B(n388), .Y(n383) );
  OAI22X1 U482 ( .A(\regs_matrix[3][0] ), .B(n633), .C(\regs_matrix[1][0] ), 
        .D(n24), .Y(n388) );
  OAI22X1 U483 ( .A(\regs_matrix[5][0] ), .B(n640), .C(\regs_matrix[7][0] ), 
        .D(n643), .Y(n387) );
  MUX2X1 U484 ( .B(n389), .A(n390), .S(N17), .Y(r2_data[1]) );
  NAND2X1 U485 ( .A(n391), .B(n392), .Y(n390) );
  NOR2X1 U486 ( .A(n393), .B(n394), .Y(n392) );
  OAI22X1 U487 ( .A(\regs_matrix[8][1] ), .B(n619), .C(\regs_matrix[10][1] ), 
        .D(n625), .Y(n394) );
  OAI22X1 U488 ( .A(\regs_matrix[12][1] ), .B(n629), .C(\regs_matrix[14][1] ), 
        .D(n632), .Y(n393) );
  NOR2X1 U489 ( .A(n395), .B(n396), .Y(n391) );
  OAI22X1 U490 ( .A(\regs_matrix[11][1] ), .B(n633), .C(\regs_matrix[9][1] ), 
        .D(n637), .Y(n396) );
  OAI22X1 U491 ( .A(\regs_matrix[13][1] ), .B(n640), .C(\regs_matrix[15][1] ), 
        .D(n644), .Y(n395) );
  NAND2X1 U492 ( .A(n397), .B(n398), .Y(n389) );
  NOR2X1 U493 ( .A(n399), .B(n400), .Y(n398) );
  OAI22X1 U494 ( .A(outreg_data[1]), .B(n619), .C(\regs_matrix[2][1] ), .D(
        n625), .Y(n400) );
  OAI22X1 U495 ( .A(\regs_matrix[4][1] ), .B(n628), .C(\regs_matrix[6][1] ), 
        .D(n632), .Y(n399) );
  NOR2X1 U496 ( .A(n402), .B(n401), .Y(n397) );
  OAI22X1 U497 ( .A(\regs_matrix[3][1] ), .B(n633), .C(\regs_matrix[1][1] ), 
        .D(n23), .Y(n402) );
  OAI22X1 U498 ( .A(\regs_matrix[5][1] ), .B(n639), .C(\regs_matrix[7][1] ), 
        .D(n647), .Y(n401) );
  MUX2X1 U499 ( .B(n403), .A(n404), .S(n645), .Y(r2_data[2]) );
  NAND2X1 U500 ( .A(n405), .B(n406), .Y(n404) );
  NOR2X1 U501 ( .A(n407), .B(n408), .Y(n406) );
  OAI22X1 U502 ( .A(\regs_matrix[8][2] ), .B(n619), .C(\regs_matrix[10][2] ), 
        .D(n625), .Y(n408) );
  OAI22X1 U503 ( .A(\regs_matrix[12][2] ), .B(n629), .C(\regs_matrix[14][2] ), 
        .D(n631), .Y(n407) );
  NOR2X1 U504 ( .A(n409), .B(n410), .Y(n405) );
  OAI22X1 U505 ( .A(\regs_matrix[11][2] ), .B(n633), .C(\regs_matrix[9][2] ), 
        .D(n636), .Y(n410) );
  OAI22X1 U506 ( .A(\regs_matrix[13][2] ), .B(n640), .C(\regs_matrix[15][2] ), 
        .D(n643), .Y(n409) );
  NAND2X1 U507 ( .A(n411), .B(n412), .Y(n403) );
  NOR2X1 U508 ( .A(n413), .B(n414), .Y(n412) );
  OAI22X1 U509 ( .A(outreg_data[2]), .B(n619), .C(\regs_matrix[2][2] ), .D(
        n625), .Y(n414) );
  OAI22X1 U510 ( .A(\regs_matrix[4][2] ), .B(n628), .C(\regs_matrix[6][2] ), 
        .D(n632), .Y(n413) );
  NOR2X1 U511 ( .A(n415), .B(n416), .Y(n411) );
  OAI22X1 U512 ( .A(\regs_matrix[3][2] ), .B(n633), .C(\regs_matrix[1][2] ), 
        .D(n637), .Y(n416) );
  OAI22X1 U513 ( .A(\regs_matrix[5][2] ), .B(n639), .C(\regs_matrix[7][2] ), 
        .D(n643), .Y(n415) );
  MUX2X1 U514 ( .B(n417), .A(n418), .S(n645), .Y(r2_data[3]) );
  NAND2X1 U515 ( .A(n419), .B(n420), .Y(n418) );
  NOR2X1 U516 ( .A(n421), .B(n422), .Y(n420) );
  OAI22X1 U517 ( .A(\regs_matrix[8][3] ), .B(n619), .C(\regs_matrix[10][3] ), 
        .D(n625), .Y(n422) );
  OAI22X1 U518 ( .A(\regs_matrix[12][3] ), .B(n629), .C(\regs_matrix[14][3] ), 
        .D(n632), .Y(n421) );
  NOR2X1 U519 ( .A(n423), .B(n424), .Y(n419) );
  OAI22X1 U520 ( .A(\regs_matrix[11][3] ), .B(n633), .C(\regs_matrix[9][3] ), 
        .D(n24), .Y(n424) );
  OAI22X1 U521 ( .A(\regs_matrix[13][3] ), .B(n639), .C(\regs_matrix[15][3] ), 
        .D(n644), .Y(n423) );
  NAND2X1 U522 ( .A(n425), .B(n426), .Y(n417) );
  NOR2X1 U523 ( .A(n427), .B(n428), .Y(n426) );
  OAI22X1 U524 ( .A(outreg_data[3]), .B(n619), .C(\regs_matrix[2][3] ), .D(
        n625), .Y(n428) );
  OAI22X1 U525 ( .A(\regs_matrix[4][3] ), .B(n629), .C(\regs_matrix[6][3] ), 
        .D(n632), .Y(n427) );
  NOR2X1 U526 ( .A(n429), .B(n430), .Y(n425) );
  OAI22X1 U527 ( .A(\regs_matrix[3][3] ), .B(n633), .C(\regs_matrix[1][3] ), 
        .D(n24), .Y(n430) );
  OAI22X1 U528 ( .A(\regs_matrix[5][3] ), .B(n640), .C(\regs_matrix[7][3] ), 
        .D(n644), .Y(n429) );
  MUX2X1 U529 ( .B(n431), .A(n432), .S(n645), .Y(r2_data[4]) );
  NAND2X1 U530 ( .A(n434), .B(n433), .Y(n432) );
  NOR2X1 U531 ( .A(n435), .B(n436), .Y(n434) );
  OAI22X1 U532 ( .A(\regs_matrix[8][4] ), .B(n620), .C(\regs_matrix[10][4] ), 
        .D(n626), .Y(n436) );
  OAI22X1 U533 ( .A(\regs_matrix[12][4] ), .B(n628), .C(\regs_matrix[14][4] ), 
        .D(n632), .Y(n435) );
  NOR2X1 U534 ( .A(n437), .B(n438), .Y(n433) );
  OAI22X1 U535 ( .A(\regs_matrix[11][4] ), .B(n634), .C(\regs_matrix[9][4] ), 
        .D(n636), .Y(n438) );
  OAI22X1 U536 ( .A(\regs_matrix[13][4] ), .B(n639), .C(\regs_matrix[15][4] ), 
        .D(n644), .Y(n437) );
  NAND2X1 U537 ( .A(n440), .B(n439), .Y(n431) );
  NOR2X1 U538 ( .A(n441), .B(n442), .Y(n440) );
  OAI22X1 U539 ( .A(outreg_data[4]), .B(n620), .C(\regs_matrix[2][4] ), .D(
        n626), .Y(n442) );
  OAI22X1 U540 ( .A(\regs_matrix[4][4] ), .B(n628), .C(\regs_matrix[6][4] ), 
        .D(n632), .Y(n441) );
  NOR2X1 U541 ( .A(n443), .B(n444), .Y(n439) );
  OAI22X1 U542 ( .A(\regs_matrix[3][4] ), .B(n634), .C(\regs_matrix[1][4] ), 
        .D(n24), .Y(n444) );
  OAI22X1 U543 ( .A(\regs_matrix[5][4] ), .B(n639), .C(\regs_matrix[7][4] ), 
        .D(n644), .Y(n443) );
  MUX2X1 U544 ( .B(n445), .A(n446), .S(n645), .Y(r2_data[5]) );
  NAND2X1 U545 ( .A(n447), .B(n448), .Y(n446) );
  NOR2X1 U546 ( .A(n449), .B(n450), .Y(n448) );
  OAI22X1 U547 ( .A(\regs_matrix[8][5] ), .B(n620), .C(\regs_matrix[10][5] ), 
        .D(n626), .Y(n450) );
  OAI22X1 U548 ( .A(\regs_matrix[12][5] ), .B(n628), .C(\regs_matrix[14][5] ), 
        .D(n632), .Y(n449) );
  NOR2X1 U549 ( .A(n451), .B(n452), .Y(n447) );
  OAI22X1 U550 ( .A(\regs_matrix[11][5] ), .B(n634), .C(\regs_matrix[9][5] ), 
        .D(n24), .Y(n452) );
  OAI22X1 U551 ( .A(\regs_matrix[13][5] ), .B(n639), .C(\regs_matrix[15][5] ), 
        .D(n644), .Y(n451) );
  NAND2X1 U552 ( .A(n453), .B(n454), .Y(n445) );
  NOR2X1 U553 ( .A(n455), .B(n456), .Y(n454) );
  OAI22X1 U554 ( .A(outreg_data[5]), .B(n620), .C(\regs_matrix[2][5] ), .D(
        n626), .Y(n456) );
  OAI22X1 U555 ( .A(\regs_matrix[4][5] ), .B(n628), .C(\regs_matrix[6][5] ), 
        .D(n632), .Y(n455) );
  NOR2X1 U556 ( .A(n457), .B(n458), .Y(n453) );
  OAI22X1 U557 ( .A(\regs_matrix[3][5] ), .B(n634), .C(\regs_matrix[1][5] ), 
        .D(n637), .Y(n458) );
  OAI22X1 U558 ( .A(\regs_matrix[5][5] ), .B(n639), .C(\regs_matrix[7][5] ), 
        .D(n644), .Y(n457) );
  MUX2X1 U559 ( .B(n459), .A(n460), .S(n645), .Y(r2_data[6]) );
  NAND2X1 U560 ( .A(n461), .B(n462), .Y(n460) );
  NOR2X1 U561 ( .A(n463), .B(n464), .Y(n462) );
  OAI22X1 U562 ( .A(\regs_matrix[8][6] ), .B(n620), .C(\regs_matrix[10][6] ), 
        .D(n626), .Y(n464) );
  OAI22X1 U563 ( .A(\regs_matrix[12][6] ), .B(n628), .C(\regs_matrix[14][6] ), 
        .D(n632), .Y(n463) );
  NOR2X1 U564 ( .A(n465), .B(n466), .Y(n461) );
  OAI22X1 U565 ( .A(\regs_matrix[11][6] ), .B(n634), .C(\regs_matrix[9][6] ), 
        .D(n636), .Y(n466) );
  OAI22X1 U566 ( .A(\regs_matrix[13][6] ), .B(n639), .C(\regs_matrix[15][6] ), 
        .D(n644), .Y(n465) );
  NAND2X1 U567 ( .A(n467), .B(n468), .Y(n459) );
  NOR2X1 U568 ( .A(n469), .B(n470), .Y(n468) );
  OAI22X1 U569 ( .A(outreg_data[6]), .B(n620), .C(\regs_matrix[2][6] ), .D(
        n626), .Y(n470) );
  OAI22X1 U570 ( .A(\regs_matrix[4][6] ), .B(n628), .C(\regs_matrix[6][6] ), 
        .D(n632), .Y(n469) );
  NOR2X1 U571 ( .A(n471), .B(n472), .Y(n467) );
  OAI22X1 U572 ( .A(\regs_matrix[3][6] ), .B(n634), .C(\regs_matrix[1][6] ), 
        .D(n637), .Y(n472) );
  OAI22X1 U573 ( .A(\regs_matrix[5][6] ), .B(n639), .C(\regs_matrix[7][6] ), 
        .D(n644), .Y(n471) );
  MUX2X1 U574 ( .B(n473), .A(n474), .S(N17), .Y(r2_data[7]) );
  NAND2X1 U575 ( .A(n475), .B(n476), .Y(n474) );
  NOR2X1 U576 ( .A(n477), .B(n478), .Y(n476) );
  OAI22X1 U577 ( .A(\regs_matrix[8][7] ), .B(n620), .C(\regs_matrix[10][7] ), 
        .D(n626), .Y(n478) );
  OAI22X1 U578 ( .A(\regs_matrix[12][7] ), .B(n628), .C(\regs_matrix[14][7] ), 
        .D(n632), .Y(n477) );
  NOR2X1 U579 ( .A(n479), .B(n480), .Y(n475) );
  OAI22X1 U580 ( .A(\regs_matrix[11][7] ), .B(n634), .C(\regs_matrix[9][7] ), 
        .D(n636), .Y(n480) );
  OAI22X1 U581 ( .A(\regs_matrix[13][7] ), .B(n639), .C(\regs_matrix[15][7] ), 
        .D(n647), .Y(n479) );
  NAND2X1 U582 ( .A(n481), .B(n482), .Y(n473) );
  NOR2X1 U583 ( .A(n483), .B(n484), .Y(n482) );
  OAI22X1 U584 ( .A(outreg_data[7]), .B(n620), .C(\regs_matrix[2][7] ), .D(
        n626), .Y(n484) );
  OAI22X1 U585 ( .A(\regs_matrix[4][7] ), .B(n628), .C(\regs_matrix[6][7] ), 
        .D(n632), .Y(n483) );
  NOR2X1 U586 ( .A(n485), .B(n486), .Y(n481) );
  OAI22X1 U587 ( .A(\regs_matrix[3][7] ), .B(n634), .C(\regs_matrix[1][7] ), 
        .D(n637), .Y(n486) );
  OAI22X1 U588 ( .A(\regs_matrix[5][7] ), .B(n639), .C(\regs_matrix[7][7] ), 
        .D(n644), .Y(n485) );
  MUX2X1 U589 ( .B(n487), .A(n488), .S(n645), .Y(r2_data[8]) );
  NAND2X1 U590 ( .A(n489), .B(n490), .Y(n488) );
  NOR2X1 U591 ( .A(n491), .B(n492), .Y(n490) );
  OAI22X1 U592 ( .A(\regs_matrix[8][8] ), .B(n620), .C(\regs_matrix[10][8] ), 
        .D(n626), .Y(n492) );
  OAI22X1 U593 ( .A(\regs_matrix[12][8] ), .B(n628), .C(\regs_matrix[14][8] ), 
        .D(n632), .Y(n491) );
  NOR2X1 U594 ( .A(n493), .B(n494), .Y(n489) );
  OAI22X1 U595 ( .A(\regs_matrix[11][8] ), .B(n634), .C(\regs_matrix[9][8] ), 
        .D(n636), .Y(n494) );
  OAI22X1 U596 ( .A(\regs_matrix[13][8] ), .B(n639), .C(\regs_matrix[15][8] ), 
        .D(n648), .Y(n493) );
  NAND2X1 U597 ( .A(n495), .B(n496), .Y(n487) );
  NOR2X1 U598 ( .A(n497), .B(n498), .Y(n496) );
  OAI22X1 U599 ( .A(outreg_data[8]), .B(n620), .C(\regs_matrix[2][8] ), .D(
        n626), .Y(n498) );
  OAI22X1 U600 ( .A(\regs_matrix[4][8] ), .B(n628), .C(\regs_matrix[6][8] ), 
        .D(n632), .Y(n497) );
  NOR2X1 U601 ( .A(n499), .B(n500), .Y(n495) );
  OAI22X1 U602 ( .A(\regs_matrix[3][8] ), .B(n634), .C(\regs_matrix[1][8] ), 
        .D(n637), .Y(n500) );
  OAI22X1 U603 ( .A(\regs_matrix[5][8] ), .B(n639), .C(\regs_matrix[7][8] ), 
        .D(n643), .Y(n499) );
  MUX2X1 U604 ( .B(n501), .A(n502), .S(N17), .Y(r2_data[9]) );
  NAND2X1 U605 ( .A(n503), .B(n504), .Y(n502) );
  NOR2X1 U606 ( .A(n505), .B(n506), .Y(n504) );
  OAI22X1 U607 ( .A(\regs_matrix[8][9] ), .B(n620), .C(\regs_matrix[10][9] ), 
        .D(n626), .Y(n506) );
  OAI22X1 U608 ( .A(\regs_matrix[12][9] ), .B(n628), .C(\regs_matrix[14][9] ), 
        .D(n632), .Y(n505) );
  NOR2X1 U609 ( .A(n507), .B(n508), .Y(n503) );
  OAI22X1 U610 ( .A(\regs_matrix[11][9] ), .B(n634), .C(\regs_matrix[9][9] ), 
        .D(n24), .Y(n508) );
  OAI22X1 U611 ( .A(\regs_matrix[13][9] ), .B(n639), .C(\regs_matrix[15][9] ), 
        .D(n647), .Y(n507) );
  NAND2X1 U612 ( .A(n509), .B(n510), .Y(n501) );
  NOR2X1 U613 ( .A(n511), .B(n512), .Y(n510) );
  OAI22X1 U614 ( .A(outreg_data[9]), .B(n620), .C(\regs_matrix[2][9] ), .D(
        n626), .Y(n512) );
  OAI22X1 U615 ( .A(\regs_matrix[4][9] ), .B(n628), .C(\regs_matrix[6][9] ), 
        .D(n632), .Y(n511) );
  NOR2X1 U616 ( .A(n513), .B(n514), .Y(n509) );
  OAI22X1 U617 ( .A(\regs_matrix[3][9] ), .B(n634), .C(\regs_matrix[1][9] ), 
        .D(n23), .Y(n514) );
  OAI22X1 U618 ( .A(\regs_matrix[5][9] ), .B(n639), .C(\regs_matrix[7][9] ), 
        .D(n643), .Y(n513) );
  NAND2X1 U619 ( .A(n517), .B(n518), .Y(n516) );
  NOR2X1 U620 ( .A(n519), .B(n520), .Y(n518) );
  OAI22X1 U621 ( .A(\regs_matrix[8][10] ), .B(n621), .C(\regs_matrix[10][10] ), 
        .D(n625), .Y(n520) );
  OAI22X1 U622 ( .A(\regs_matrix[12][10] ), .B(n628), .C(\regs_matrix[14][10] ), .D(n632), .Y(n519) );
  NOR2X1 U623 ( .A(n521), .B(n522), .Y(n517) );
  OAI22X1 U624 ( .A(\regs_matrix[11][10] ), .B(n634), .C(\regs_matrix[9][10] ), 
        .D(n636), .Y(n522) );
  OAI22X1 U625 ( .A(\regs_matrix[13][10] ), .B(n639), .C(\regs_matrix[15][10] ), .D(n644), .Y(n521) );
  NAND2X1 U626 ( .A(n523), .B(n524), .Y(n515) );
  NOR2X1 U627 ( .A(n525), .B(n526), .Y(n524) );
  OAI22X1 U628 ( .A(outreg_data[10]), .B(n621), .C(\regs_matrix[2][10] ), .D(
        n625), .Y(n526) );
  OAI22X1 U629 ( .A(\regs_matrix[4][10] ), .B(n629), .C(\regs_matrix[6][10] ), 
        .D(n632), .Y(n525) );
  NOR2X1 U630 ( .A(n527), .B(n528), .Y(n523) );
  OAI22X1 U631 ( .A(\regs_matrix[3][10] ), .B(n634), .C(\regs_matrix[1][10] ), 
        .D(n23), .Y(n528) );
  OAI22X1 U632 ( .A(\regs_matrix[5][10] ), .B(n640), .C(\regs_matrix[7][10] ), 
        .D(n643), .Y(n527) );
  NAND2X1 U633 ( .A(n531), .B(n532), .Y(n530) );
  NOR2X1 U634 ( .A(n533), .B(n534), .Y(n532) );
  OAI22X1 U635 ( .A(\regs_matrix[8][11] ), .B(n621), .C(\regs_matrix[10][11] ), 
        .D(n626), .Y(n534) );
  OAI22X1 U636 ( .A(\regs_matrix[12][11] ), .B(n629), .C(\regs_matrix[14][11] ), .D(n632), .Y(n533) );
  NOR2X1 U637 ( .A(n535), .B(n536), .Y(n531) );
  OAI22X1 U638 ( .A(\regs_matrix[11][11] ), .B(n634), .C(\regs_matrix[9][11] ), 
        .D(n23), .Y(n536) );
  OAI22X1 U639 ( .A(\regs_matrix[13][11] ), .B(n640), .C(\regs_matrix[15][11] ), .D(n644), .Y(n535) );
  NAND2X1 U640 ( .A(n537), .B(n538), .Y(n529) );
  NOR2X1 U641 ( .A(n539), .B(n540), .Y(n538) );
  OAI22X1 U642 ( .A(outreg_data[11]), .B(n621), .C(\regs_matrix[2][11] ), .D(
        n625), .Y(n540) );
  OAI22X1 U643 ( .A(\regs_matrix[4][11] ), .B(n629), .C(\regs_matrix[6][11] ), 
        .D(n631), .Y(n539) );
  NOR2X1 U644 ( .A(n541), .B(n542), .Y(n537) );
  OAI22X1 U645 ( .A(\regs_matrix[3][11] ), .B(n633), .C(\regs_matrix[1][11] ), 
        .D(n24), .Y(n542) );
  OAI22X1 U646 ( .A(\regs_matrix[5][11] ), .B(n640), .C(\regs_matrix[7][11] ), 
        .D(n643), .Y(n541) );
  MUX2X1 U647 ( .B(n543), .A(n544), .S(n645), .Y(r2_data[12]) );
  NAND2X1 U648 ( .A(n545), .B(n546), .Y(n544) );
  NOR2X1 U649 ( .A(n547), .B(n548), .Y(n546) );
  OAI22X1 U650 ( .A(\regs_matrix[8][12] ), .B(n621), .C(\regs_matrix[10][12] ), 
        .D(n625), .Y(n548) );
  OAI22X1 U651 ( .A(\regs_matrix[12][12] ), .B(n629), .C(\regs_matrix[14][12] ), .D(n631), .Y(n547) );
  NOR2X1 U652 ( .A(n549), .B(n550), .Y(n545) );
  OAI22X1 U653 ( .A(\regs_matrix[11][12] ), .B(n634), .C(\regs_matrix[9][12] ), 
        .D(n636), .Y(n550) );
  OAI22X1 U654 ( .A(\regs_matrix[13][12] ), .B(n640), .C(\regs_matrix[15][12] ), .D(n647), .Y(n549) );
  NAND2X1 U655 ( .A(n551), .B(n552), .Y(n543) );
  NOR2X1 U656 ( .A(n553), .B(n554), .Y(n552) );
  OAI22X1 U657 ( .A(outreg_data[12]), .B(n621), .C(\regs_matrix[2][12] ), .D(
        n626), .Y(n554) );
  OAI22X1 U658 ( .A(\regs_matrix[4][12] ), .B(n629), .C(\regs_matrix[6][12] ), 
        .D(n631), .Y(n553) );
  NOR2X1 U659 ( .A(n555), .B(n556), .Y(n551) );
  OAI22X1 U660 ( .A(\regs_matrix[3][12] ), .B(n634), .C(\regs_matrix[1][12] ), 
        .D(n637), .Y(n556) );
  OAI22X1 U661 ( .A(\regs_matrix[5][12] ), .B(n640), .C(\regs_matrix[7][12] ), 
        .D(n643), .Y(n555) );
  NAND2X1 U662 ( .A(n559), .B(n560), .Y(n558) );
  NOR2X1 U663 ( .A(n561), .B(n562), .Y(n560) );
  OAI22X1 U664 ( .A(\regs_matrix[8][13] ), .B(n621), .C(\regs_matrix[10][13] ), 
        .D(n625), .Y(n562) );
  OAI22X1 U665 ( .A(\regs_matrix[12][13] ), .B(n629), .C(\regs_matrix[14][13] ), .D(n631), .Y(n561) );
  NOR2X1 U666 ( .A(n563), .B(n564), .Y(n559) );
  OAI22X1 U667 ( .A(\regs_matrix[11][13] ), .B(n634), .C(\regs_matrix[9][13] ), 
        .D(n24), .Y(n564) );
  OAI22X1 U668 ( .A(\regs_matrix[13][13] ), .B(n640), .C(\regs_matrix[15][13] ), .D(n642), .Y(n563) );
  NAND2X1 U669 ( .A(n565), .B(n566), .Y(n557) );
  NOR2X1 U670 ( .A(n567), .B(n568), .Y(n566) );
  OAI22X1 U671 ( .A(outreg_data[13]), .B(n621), .C(\regs_matrix[2][13] ), .D(
        n625), .Y(n568) );
  OAI22X1 U672 ( .A(\regs_matrix[4][13] ), .B(n629), .C(\regs_matrix[6][13] ), 
        .D(n631), .Y(n567) );
  NOR2X1 U673 ( .A(n569), .B(n570), .Y(n565) );
  OAI22X1 U674 ( .A(\regs_matrix[3][13] ), .B(n633), .C(\regs_matrix[1][13] ), 
        .D(n23), .Y(n570) );
  OAI22X1 U675 ( .A(\regs_matrix[5][13] ), .B(n640), .C(\regs_matrix[7][13] ), 
        .D(n643), .Y(n569) );
  MUX2X1 U676 ( .B(n571), .A(n572), .S(n645), .Y(r2_data[14]) );
  NAND2X1 U677 ( .A(n573), .B(n574), .Y(n572) );
  NOR2X1 U678 ( .A(n575), .B(n576), .Y(n574) );
  OAI22X1 U679 ( .A(\regs_matrix[8][14] ), .B(n621), .C(\regs_matrix[10][14] ), 
        .D(n625), .Y(n576) );
  OAI22X1 U680 ( .A(\regs_matrix[12][14] ), .B(n629), .C(\regs_matrix[14][14] ), .D(n631), .Y(n575) );
  NOR2X1 U681 ( .A(n577), .B(n578), .Y(n573) );
  OAI22X1 U682 ( .A(\regs_matrix[11][14] ), .B(n633), .C(\regs_matrix[9][14] ), 
        .D(n24), .Y(n578) );
  OAI22X1 U683 ( .A(\regs_matrix[13][14] ), .B(n640), .C(\regs_matrix[15][14] ), .D(n647), .Y(n577) );
  NAND2X1 U684 ( .A(n579), .B(n580), .Y(n571) );
  NOR2X1 U685 ( .A(n581), .B(n582), .Y(n580) );
  OAI22X1 U686 ( .A(outreg_data[14]), .B(n621), .C(\regs_matrix[2][14] ), .D(
        n626), .Y(n582) );
  OAI22X1 U687 ( .A(\regs_matrix[4][14] ), .B(n629), .C(\regs_matrix[6][14] ), 
        .D(n631), .Y(n581) );
  NOR2X1 U688 ( .A(n583), .B(n584), .Y(n579) );
  OAI22X1 U689 ( .A(\regs_matrix[3][14] ), .B(n634), .C(\regs_matrix[1][14] ), 
        .D(n23), .Y(n584) );
  OAI22X1 U690 ( .A(\regs_matrix[5][14] ), .B(n640), .C(\regs_matrix[7][14] ), 
        .D(n647), .Y(n583) );
  NAND2X1 U691 ( .A(n587), .B(n588), .Y(n586) );
  NOR2X1 U692 ( .A(n589), .B(n590), .Y(n588) );
  OAI22X1 U693 ( .A(\regs_matrix[8][15] ), .B(n621), .C(\regs_matrix[10][15] ), 
        .D(n625), .Y(n590) );
  OAI22X1 U694 ( .A(\regs_matrix[12][15] ), .B(n629), .C(\regs_matrix[14][15] ), .D(n631), .Y(n589) );
  NOR2X1 U695 ( .A(n591), .B(n592), .Y(n587) );
  OAI22X1 U696 ( .A(\regs_matrix[11][15] ), .B(n634), .C(\regs_matrix[9][15] ), 
        .D(n24), .Y(n592) );
  OAI22X1 U697 ( .A(\regs_matrix[13][15] ), .B(n640), .C(\regs_matrix[15][15] ), .D(n648), .Y(n591) );
  NAND2X1 U698 ( .A(n593), .B(n594), .Y(n585) );
  NOR2X1 U699 ( .A(n595), .B(n596), .Y(n594) );
  OAI22X1 U700 ( .A(outreg_data[15]), .B(n621), .C(\regs_matrix[2][15] ), .D(
        n625), .Y(n596) );
  OAI22X1 U701 ( .A(\regs_matrix[4][15] ), .B(n629), .C(\regs_matrix[6][15] ), 
        .D(n631), .Y(n595) );
  NOR2X1 U702 ( .A(n597), .B(n598), .Y(n593) );
  OAI22X1 U703 ( .A(\regs_matrix[3][15] ), .B(n634), .C(\regs_matrix[1][15] ), 
        .D(n24), .Y(n598) );
  OAI22X1 U704 ( .A(\regs_matrix[5][15] ), .B(n640), .C(\regs_matrix[7][15] ), 
        .D(n643), .Y(n597) );
  NOR2X1 U705 ( .A(n599), .B(n600), .Y(n363) );
  OAI21X1 U706 ( .A(\regs_matrix[6][16] ), .B(n631), .C(n601), .Y(n600) );
  AOI22X1 U707 ( .A(n624), .B(n318), .C(n618), .D(n602), .Y(n601) );
  INVX2 U708 ( .A(outreg_data[16]), .Y(n602) );
  OAI21X1 U709 ( .A(\regs_matrix[4][16] ), .B(n629), .C(n646), .Y(n599) );
  NOR2X1 U710 ( .A(n603), .B(n604), .Y(n364) );
  OAI22X1 U711 ( .A(\regs_matrix[3][16] ), .B(n634), .C(\regs_matrix[1][16] ), 
        .D(n23), .Y(n604) );
  OAI22X1 U712 ( .A(\regs_matrix[5][16] ), .B(n640), .C(\regs_matrix[7][16] ), 
        .D(n643), .Y(n603) );
  NOR2X1 U713 ( .A(n605), .B(n606), .Y(n365) );
  OAI21X1 U714 ( .A(\regs_matrix[12][16] ), .B(n629), .C(n607), .Y(n606) );
  AOI22X1 U715 ( .A(n624), .B(n608), .C(n618), .D(n609), .Y(n607) );
  INVX2 U716 ( .A(\regs_matrix[8][16] ), .Y(n609) );
  NAND3X1 U717 ( .A(n612), .B(n611), .C(n610), .Y(n374) );
  INVX2 U718 ( .A(\regs_matrix[10][16] ), .Y(n608) );
  NAND3X1 U719 ( .A(n612), .B(N15), .C(n611), .Y(n375) );
  NAND3X1 U720 ( .A(N16), .B(n610), .C(n612), .Y(n376) );
  OAI22X1 U721 ( .A(\regs_matrix[9][16] ), .B(n24), .C(\regs_matrix[14][16] ), 
        .D(n632), .Y(n605) );
  NAND3X1 U722 ( .A(N16), .B(N15), .C(n612), .Y(n377) );
  INVX2 U723 ( .A(N14), .Y(n612) );
  NAND3X1 U724 ( .A(N14), .B(n611), .C(n610), .Y(n380) );
  NOR2X1 U725 ( .A(n613), .B(n614), .Y(n366) );
  OAI21X1 U726 ( .A(\regs_matrix[11][16] ), .B(n634), .C(n645), .Y(n614) );
  OAI22X1 U727 ( .A(\regs_matrix[15][16] ), .B(n642), .C(\regs_matrix[13][16] ), .D(n640), .Y(n613) );
  INVX2 U728 ( .A(N15), .Y(n610) );
  NAND2X1 U729 ( .A(n3), .B(N16), .Y(n382) );
  INVX8 U730 ( .A(n617), .Y(n620) );
  INVX8 U731 ( .A(n616), .Y(n621) );
  INVX8 U732 ( .A(n627), .Y(n629) );
  INVX8 U733 ( .A(n638), .Y(n640) );
  INVX2 U734 ( .A(n374), .Y(n615) );
  INVX4 U735 ( .A(n641), .Y(n643) );
  INVX4 U736 ( .A(n641), .Y(n644) );
  INVX4 U737 ( .A(n641), .Y(n642) );
  INVX4 U738 ( .A(n382), .Y(n641) );
  INVX4 U739 ( .A(n381), .Y(n638) );
  INVX4 U740 ( .A(n376), .Y(n627) );
  INVX4 U741 ( .A(n2), .Y(n633) );
  INVX2 U742 ( .A(n375), .Y(n622) );
  INVX4 U743 ( .A(w_data[7]), .Y(n670) );
  INVX4 U744 ( .A(w_data[6]), .Y(n667) );
  INVX4 U745 ( .A(w_data[9]), .Y(n674) );
  INVX4 U746 ( .A(w_data[8]), .Y(n672) );
  INVX4 U747 ( .A(w_data[14]), .Y(n689) );
  INVX4 U748 ( .A(w_data[12]), .Y(n683) );
  INVX4 U749 ( .A(w_data[10]), .Y(n677) );
  INVX4 U750 ( .A(w_data[11]), .Y(n680) );
  INVX4 U751 ( .A(w_data[13]), .Y(n686) );
  INVX4 U752 ( .A(w_data[15]), .Y(n692) );
  INVX8 U753 ( .A(n670), .Y(n671) );
  INVX8 U754 ( .A(n672), .Y(n673) );
  INVX8 U755 ( .A(n689), .Y(n690) );
  INVX8 U756 ( .A(n689), .Y(n691) );
  INVX2 U757 ( .A(w_en), .Y(n706) );
  INVX2 U758 ( .A(w_sel[1]), .Y(n707) );
  INVX2 U759 ( .A(w_sel[3]), .Y(n708) );
  INVX2 U760 ( .A(w_sel[2]), .Y(n709) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data({src2_data[16], n4, 
        src2_data[14:0]}), .alu_op(alu_op), .result(alu_result), .overflow(
        overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX2 U2 ( .A(src2_data[15]), .Y(n3) );
  INVX8 U3 ( .A(n3), .Y(n4) );
  AND2X2 U4 ( .A(n38), .B(n5), .Y(n1) );
  AND2X2 U5 ( .A(w_data_sel[0]), .B(n38), .Y(n2) );
  INVX2 U6 ( .A(w_data_sel[1]), .Y(n38) );
  AND2X2 U7 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U8 ( .A(alu_result[15]), .Y(n7) );
  INVX2 U9 ( .A(w_data_sel[0]), .Y(n5) );
  AOI22X1 U10 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n6)
         );
  OAI21X1 U11 ( .A(n38), .B(n7), .C(n6), .Y(dest_data[15]) );
  INVX2 U12 ( .A(alu_result[14]), .Y(n9) );
  AOI22X1 U13 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n8)
         );
  OAI21X1 U14 ( .A(n38), .B(n9), .C(n8), .Y(dest_data[14]) );
  INVX2 U15 ( .A(alu_result[13]), .Y(n11) );
  AOI22X1 U16 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n10)
         );
  OAI21X1 U17 ( .A(n38), .B(n11), .C(n10), .Y(dest_data[13]) );
  INVX2 U18 ( .A(alu_result[12]), .Y(n13) );
  AOI22X1 U19 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n12)
         );
  OAI21X1 U20 ( .A(n38), .B(n13), .C(n12), .Y(dest_data[12]) );
  INVX2 U21 ( .A(alu_result[11]), .Y(n15) );
  AOI22X1 U22 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n14)
         );
  OAI21X1 U23 ( .A(n38), .B(n15), .C(n14), .Y(dest_data[11]) );
  INVX2 U24 ( .A(alu_result[10]), .Y(n17) );
  AOI22X1 U25 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n16)
         );
  OAI21X1 U26 ( .A(n38), .B(n17), .C(n16), .Y(dest_data[10]) );
  INVX2 U27 ( .A(alu_result[9]), .Y(n19) );
  AOI22X1 U28 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n18) );
  OAI21X1 U29 ( .A(n38), .B(n19), .C(n18), .Y(dest_data[9]) );
  INVX2 U30 ( .A(alu_result[8]), .Y(n21) );
  AOI22X1 U31 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n20) );
  OAI21X1 U32 ( .A(n38), .B(n21), .C(n20), .Y(dest_data[8]) );
  INVX2 U33 ( .A(alu_result[7]), .Y(n23) );
  AOI22X1 U34 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n22) );
  OAI21X1 U35 ( .A(n38), .B(n23), .C(n22), .Y(dest_data[7]) );
  INVX2 U36 ( .A(alu_result[6]), .Y(n25) );
  AOI22X1 U37 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n24) );
  OAI21X1 U38 ( .A(n38), .B(n25), .C(n24), .Y(dest_data[6]) );
  INVX2 U39 ( .A(alu_result[5]), .Y(n27) );
  AOI22X1 U40 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n26) );
  OAI21X1 U41 ( .A(n38), .B(n27), .C(n26), .Y(dest_data[5]) );
  INVX2 U42 ( .A(alu_result[4]), .Y(n29) );
  AOI22X1 U43 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n28) );
  OAI21X1 U44 ( .A(n38), .B(n29), .C(n28), .Y(dest_data[4]) );
  INVX2 U45 ( .A(alu_result[3]), .Y(n31) );
  AOI22X1 U46 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n30) );
  OAI21X1 U47 ( .A(n38), .B(n31), .C(n30), .Y(dest_data[3]) );
  INVX2 U48 ( .A(alu_result[2]), .Y(n33) );
  AOI22X1 U49 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n32) );
  OAI21X1 U50 ( .A(n38), .B(n33), .C(n32), .Y(dest_data[2]) );
  INVX2 U51 ( .A(alu_result[1]), .Y(n35) );
  AOI22X1 U52 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n34) );
  OAI21X1 U53 ( .A(n38), .B(n35), .C(n34), .Y(dest_data[1]) );
  INVX2 U54 ( .A(alu_result[0]), .Y(n37) );
  AOI22X1 U55 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n36) );
  OAI21X1 U56 ( .A(n38), .B(n37), .C(n36), .Y(dest_data[0]) );
endmodule


module controller ( clk, n_reset, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_reset, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   next_modwait, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144;
  wire   [4:0] current_state;
  wire   [4:0] next_state;
  assign src1[3] = 1'b0;
  assign clear = 1'b0;

  DFFSR \current_state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_reset), 
        .S(1'b1), .Q(current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_reset), 
        .S(1'b1), .Q(current_state[1]) );
  DFFSR \current_state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_reset), 
        .S(1'b1), .Q(current_state[2]) );
  DFFSR \current_state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_reset), 
        .S(1'b1), .Q(current_state[4]) );
  DFFSR \current_state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_reset), 
        .S(1'b1), .Q(current_state[3]) );
  DFFSR current_modwait_reg ( .D(next_modwait), .CLK(clk), .R(n_reset), .S(
        1'b1), .Q(modwait) );
  AND2X2 U9 ( .A(n31), .B(n32), .Y(n23) );
  BUFX2 U10 ( .A(current_state[0]), .Y(n35) );
  AND2X1 U11 ( .A(n129), .B(n11), .Y(n9) );
  INVX2 U12 ( .A(current_state[1]), .Y(n45) );
  INVX2 U13 ( .A(n51), .Y(n50) );
  AND2X2 U14 ( .A(n131), .B(n124), .Y(n7) );
  AND2X2 U15 ( .A(n60), .B(n42), .Y(n8) );
  BUFX2 U16 ( .A(n31), .Y(n10) );
  BUFX2 U17 ( .A(n77), .Y(n11) );
  INVX1 U18 ( .A(n53), .Y(n12) );
  INVX1 U19 ( .A(n53), .Y(n115) );
  BUFX2 U20 ( .A(n134), .Y(n13) );
  BUFX2 U21 ( .A(n127), .Y(n14) );
  NAND2X1 U22 ( .A(n7), .B(n15), .Y(src2[1]) );
  AND2X1 U23 ( .A(n123), .B(n128), .Y(n15) );
  INVX1 U24 ( .A(n56), .Y(n16) );
  INVX1 U25 ( .A(n16), .Y(n17) );
  INVX2 U26 ( .A(n48), .Y(n59) );
  AND2X2 U27 ( .A(current_state[2]), .B(n62), .Y(n42) );
  AND2X1 U28 ( .A(n83), .B(n60), .Y(n18) );
  AND2X2 U29 ( .A(n17), .B(n45), .Y(n31) );
  NAND2X1 U30 ( .A(n59), .B(n18), .Y(n127) );
  INVX1 U31 ( .A(current_state[0]), .Y(n60) );
  INVX2 U32 ( .A(n41), .Y(n19) );
  BUFX2 U33 ( .A(n28), .Y(n20) );
  INVX1 U34 ( .A(n40), .Y(n28) );
  BUFX2 U35 ( .A(n125), .Y(n21) );
  INVX1 U36 ( .A(current_state[4]), .Y(n22) );
  INVX1 U37 ( .A(current_state[4]), .Y(n56) );
  AND2X2 U38 ( .A(n42), .B(n35), .Y(n32) );
  BUFX2 U39 ( .A(n124), .Y(n24) );
  BUFX2 U40 ( .A(n39), .Y(n25) );
  INVX1 U41 ( .A(n20), .Y(n26) );
  INVX1 U42 ( .A(n36), .Y(n27) );
  INVX2 U43 ( .A(n45), .Y(n46) );
  INVX1 U44 ( .A(current_state[3]), .Y(n62) );
  AND2X2 U45 ( .A(n9), .B(n115), .Y(n79) );
  AND2X1 U46 ( .A(n20), .B(n43), .Y(n34) );
  AND2X2 U47 ( .A(n77), .B(n127), .Y(n29) );
  INVX1 U48 ( .A(n29), .Y(n136) );
  OR2X1 U49 ( .A(n122), .B(n118), .Y(dest[0]) );
  AND2X2 U50 ( .A(n39), .B(n35), .Y(n33) );
  BUFX2 U51 ( .A(current_state[3]), .Y(n40) );
  INVX2 U52 ( .A(n47), .Y(n36) );
  AND2X1 U53 ( .A(n40), .B(n56), .Y(n37) );
  AND2X2 U54 ( .A(n46), .B(n22), .Y(n38) );
  INVX1 U55 ( .A(n55), .Y(n88) );
  BUFX2 U56 ( .A(current_state[2]), .Y(n39) );
  INVX1 U57 ( .A(src2[1]), .Y(n54) );
  BUFX2 U58 ( .A(n8), .Y(n41) );
  BUFX2 U59 ( .A(n60), .Y(n43) );
  BUFX2 U60 ( .A(current_state[4]), .Y(n44) );
  INVX1 U61 ( .A(n45), .Y(n47) );
  NAND2X1 U62 ( .A(n46), .B(n37), .Y(n51) );
  NAND2X1 U63 ( .A(n43), .B(n50), .Y(n55) );
  NAND3X1 U64 ( .A(n40), .B(n45), .C(n22), .Y(n48) );
  NAND3X1 U65 ( .A(n59), .B(n25), .C(n43), .Y(n134) );
  NAND2X1 U66 ( .A(n55), .B(n134), .Y(n96) );
  INVX2 U67 ( .A(n96), .Y(n123) );
  INVX2 U68 ( .A(current_state[2]), .Y(n83) );
  NAND2X1 U69 ( .A(n35), .B(n83), .Y(n52) );
  INVX2 U70 ( .A(n52), .Y(n63) );
  NAND2X1 U71 ( .A(n63), .B(n59), .Y(n124) );
  NAND3X1 U72 ( .A(n83), .B(n44), .C(n28), .Y(n49) );
  INVX2 U73 ( .A(n49), .Y(n58) );
  NAND3X1 U74 ( .A(n36), .B(n43), .C(n58), .Y(n131) );
  NAND3X1 U75 ( .A(n123), .B(n124), .C(n131), .Y(src2[2]) );
  NAND2X1 U76 ( .A(n50), .B(n33), .Y(n128) );
  NAND2X1 U77 ( .A(n33), .B(n59), .Y(n125) );
  OAI21X1 U78 ( .A(n52), .B(n51), .C(n125), .Y(n53) );
  NAND3X1 U79 ( .A(n63), .B(n38), .C(n20), .Y(n133) );
  NAND3X1 U80 ( .A(n115), .B(n54), .C(n133), .Y(op[2]) );
  NAND3X1 U81 ( .A(n32), .B(n44), .C(n36), .Y(n78) );
  NAND2X1 U82 ( .A(n35), .B(n58), .Y(n87) );
  NAND2X1 U83 ( .A(n78), .B(n87), .Y(dest[3]) );
  INVX2 U84 ( .A(overflow), .Y(n95) );
  NAND2X1 U85 ( .A(n31), .B(n32), .Y(n129) );
  NAND2X1 U86 ( .A(n129), .B(n78), .Y(n57) );
  AOI21X1 U87 ( .A(n88), .B(n95), .C(n57), .Y(n76) );
  NAND2X1 U88 ( .A(n41), .B(n44), .Y(n80) );
  NAND3X1 U89 ( .A(n58), .B(n47), .C(n43), .Y(n71) );
  NAND2X1 U90 ( .A(n80), .B(n71), .Y(n111) );
  NOR3X1 U91 ( .A(op[2]), .B(n111), .C(dest[3]), .Y(n67) );
  NAND2X1 U92 ( .A(n8), .B(n38), .Y(n77) );
  NAND3X1 U93 ( .A(n10), .B(n83), .C(n34), .Y(n101) );
  NAND2X1 U94 ( .A(n10), .B(n41), .Y(n84) );
  NAND2X1 U95 ( .A(n101), .B(n84), .Y(n100) );
  NOR2X1 U96 ( .A(n136), .B(n100), .Y(n66) );
  NAND2X1 U97 ( .A(n44), .B(n47), .Y(n68) );
  INVX2 U98 ( .A(n68), .Y(n61) );
  NAND2X1 U99 ( .A(n61), .B(n32), .Y(n139) );
  NAND2X1 U100 ( .A(n32), .B(n38), .Y(n126) );
  NAND2X1 U101 ( .A(n139), .B(n126), .Y(n119) );
  NAND3X1 U102 ( .A(n38), .B(n83), .C(n34), .Y(n141) );
  NAND3X1 U103 ( .A(n31), .B(n63), .C(n20), .Y(n116) );
  NAND3X1 U104 ( .A(n141), .B(n129), .C(n116), .Y(n64) );
  NOR2X1 U105 ( .A(n119), .B(n64), .Y(n65) );
  NAND3X1 U106 ( .A(n67), .B(n66), .C(n65), .Y(n109) );
  INVX2 U107 ( .A(n109), .Y(n99) );
  INVX2 U108 ( .A(n116), .Y(n86) );
  AOI22X1 U109 ( .A(n99), .B(n27), .C(n86), .D(dr), .Y(n75) );
  OAI21X1 U110 ( .A(n19), .B(n68), .C(n21), .Y(n73) );
  INVX2 U111 ( .A(n87), .Y(n70) );
  NAND2X1 U112 ( .A(n11), .B(n124), .Y(n69) );
  AOI21X1 U113 ( .A(n70), .B(n36), .C(n69), .Y(n121) );
  NAND3X1 U114 ( .A(n121), .B(n141), .C(n71), .Y(n72) );
  NOR2X1 U115 ( .A(n73), .B(n72), .Y(n74) );
  NAND3X1 U116 ( .A(n76), .B(n75), .C(n74), .Y(next_state[1]) );
  NAND3X1 U117 ( .A(n12), .B(n77), .C(n129), .Y(src1[1]) );
  NAND2X1 U118 ( .A(n13), .B(n78), .Y(n82) );
  NAND3X1 U119 ( .A(n80), .B(n79), .C(n133), .Y(n81) );
  NOR2X1 U120 ( .A(n82), .B(n81), .Y(n94) );
  OAI22X1 U121 ( .A(n131), .B(n95), .C(n83), .D(n109), .Y(n92) );
  INVX2 U122 ( .A(n84), .Y(err) );
  INVX2 U123 ( .A(dr), .Y(n85) );
  OAI21X1 U124 ( .A(n86), .B(err), .C(n85), .Y(n90) );
  NAND2X1 U125 ( .A(n70), .B(n27), .Y(n117) );
  OAI21X1 U126 ( .A(overflow), .B(n25), .C(n88), .Y(n89) );
  NAND3X1 U127 ( .A(n90), .B(n117), .C(n89), .Y(n91) );
  NOR2X1 U128 ( .A(n92), .B(n91), .Y(n93) );
  NAND2X1 U129 ( .A(n94), .B(n93), .Y(next_state[2]) );
  NAND2X1 U130 ( .A(n96), .B(n95), .Y(n106) );
  NAND3X1 U131 ( .A(n109), .B(n126), .C(n106), .Y(n98) );
  NAND3X1 U132 ( .A(n115), .B(n14), .C(n24), .Y(n97) );
  OR2X1 U133 ( .A(n98), .B(n97), .Y(next_state[3]) );
  AOI22X1 U134 ( .A(dr), .B(n100), .C(n99), .D(n35), .Y(n107) );
  INVX2 U135 ( .A(n101), .Y(n108) );
  OAI21X1 U136 ( .A(n108), .B(n111), .C(lc), .Y(n102) );
  NAND2X1 U137 ( .A(n102), .B(n141), .Y(n104) );
  NAND2X1 U138 ( .A(n29), .B(n133), .Y(n103) );
  NOR2X1 U139 ( .A(n104), .B(n103), .Y(n105) );
  NAND3X1 U140 ( .A(n107), .B(n106), .C(n105), .Y(next_state[0]) );
  NAND2X1 U141 ( .A(lc), .B(n108), .Y(n110) );
  OAI21X1 U142 ( .A(dr), .B(n110), .C(n109), .Y(n114) );
  INVX2 U143 ( .A(n111), .Y(n112) );
  INVX2 U144 ( .A(dest[3]), .Y(n140) );
  NAND3X1 U145 ( .A(n112), .B(n140), .C(n128), .Y(n113) );
  OR2X1 U146 ( .A(n114), .B(n113), .Y(next_state[4]) );
  NAND2X1 U147 ( .A(n115), .B(n128), .Y(src2[3]) );
  INVX2 U148 ( .A(src2[3]), .Y(n120) );
  NAND3X1 U149 ( .A(n116), .B(n120), .C(n24), .Y(n122) );
  NAND3X1 U150 ( .A(n126), .B(n117), .C(n129), .Y(n118) );
  INVX2 U151 ( .A(n119), .Y(n130) );
  NAND3X1 U152 ( .A(n121), .B(n120), .C(n130), .Y(dest[1]) );
  INVX2 U153 ( .A(n122), .Y(n144) );
  NAND3X1 U154 ( .A(n144), .B(n14), .C(n139), .Y(dest[2]) );
  NAND3X1 U155 ( .A(n123), .B(n21), .C(n131), .Y(src2[0]) );
  NAND3X1 U156 ( .A(n29), .B(n21), .C(n124), .Y(src1[0]) );
  NAND3X1 U157 ( .A(n128), .B(n127), .C(n126), .Y(src1[2]) );
  NAND2X1 U158 ( .A(n131), .B(n130), .Y(n132) );
  NOR2X1 U159 ( .A(n23), .B(n132), .Y(n138) );
  NAND3X1 U160 ( .A(n134), .B(n133), .C(n140), .Y(n135) );
  NOR2X1 U161 ( .A(n136), .B(n135), .Y(n137) );
  NAND2X1 U162 ( .A(n138), .B(n137), .Y(op[0]) );
  NAND3X1 U163 ( .A(n144), .B(n140), .C(n139), .Y(op[1]) );
  INVX2 U164 ( .A(op[0]), .Y(n143) );
  INVX2 U165 ( .A(n141), .Y(cnt_up) );
  NOR2X1 U166 ( .A(n26), .B(cnt_up), .Y(n142) );
  NAND3X1 U167 ( .A(n144), .B(n143), .C(n142), .Y(next_modwait) );
endmodule


module fir_filter ( clk, n_reset, data_ready, load_coeff, sample_data, 
        fir_coefficient, one_k_samples, modwait, err, fir_out );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   synced_data, synced_coefficient, cnt_up, overflow;
  wire   [16:0] outreg_data;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_low_1 sync_data ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(synced_data) );
  sync_low_0 sync_coeff ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(synced_coefficient) );
  counter count_num ( .clk(clk), .n_reset(n_reset), .cnt_up(cnt_up), .clear(
        1'b0), .one_k_samples(one_k_samples) );
  magnitude mag ( .in(outreg_data), .out(fir_out) );
  datapath path ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, 
        src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(
        overflow) );
  controller control ( .clk(clk), .n_reset(n_reset), .dr(synced_data), .lc(
        synced_coefficient), .overflow(overflow), .cnt_up(cnt_up), .modwait(
        modwait), .op(op), .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(
        src2), .dest(dest), .err(err) );
endmodule

