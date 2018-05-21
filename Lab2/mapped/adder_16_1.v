/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 24 20:31:39 2018
/////////////////////////////////////////////////////////////


module adder_16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n27, n29, n30, n31, n32, n33, n35,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n50, n52,
         n53, n54, n55, n56, n57, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n97, n99,
         n101, n102, n105, n106, n107, n109, n110, n111, n169, n170, n171,
         n172;

  XNOR2X1 U3 ( .A(n22), .B(n1), .Y(SUM[15]) );
  AOI21X1 U4 ( .A(n172), .B(n22), .C(n19), .Y(n17) );
  NAND2X1 U7 ( .A(n21), .B(n172), .Y(n1) );
  NAND2X1 U10 ( .A(B[15]), .B(A[15]), .Y(n21) );
  XOR2X1 U11 ( .A(n25), .B(n2), .Y(SUM[14]) );
  OAI21X1 U12 ( .A(n25), .B(n23), .C(n24), .Y(n22) );
  NAND2X1 U13 ( .A(n24), .B(n97), .Y(n2) );
  NOR2X1 U15 ( .A(B[14]), .B(A[14]), .Y(n23) );
  NAND2X1 U16 ( .A(B[14]), .B(A[14]), .Y(n24) );
  XNOR2X1 U17 ( .A(n30), .B(n3), .Y(SUM[13]) );
  AOI21X1 U18 ( .A(n171), .B(n30), .C(n27), .Y(n25) );
  NAND2X1 U21 ( .A(n29), .B(n171), .Y(n3) );
  NAND2X1 U24 ( .A(B[13]), .B(A[13]), .Y(n29) );
  XOR2X1 U25 ( .A(n33), .B(n4), .Y(SUM[12]) );
  OAI21X1 U26 ( .A(n33), .B(n31), .C(n32), .Y(n30) );
  NAND2X1 U27 ( .A(n32), .B(n99), .Y(n4) );
  NOR2X1 U29 ( .A(B[12]), .B(A[12]), .Y(n31) );
  NAND2X1 U30 ( .A(B[12]), .B(A[12]), .Y(n32) );
  XNOR2X1 U31 ( .A(n38), .B(n5), .Y(SUM[11]) );
  AOI21X1 U32 ( .A(n170), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U35 ( .A(n37), .B(n170), .Y(n5) );
  NAND2X1 U38 ( .A(B[11]), .B(A[11]), .Y(n37) );
  XOR2X1 U39 ( .A(n41), .B(n6), .Y(SUM[10]) );
  OAI21X1 U40 ( .A(n41), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U41 ( .A(n40), .B(n101), .Y(n6) );
  NOR2X1 U43 ( .A(B[10]), .B(A[10]), .Y(n39) );
  NAND2X1 U44 ( .A(B[10]), .B(A[10]), .Y(n40) );
  XNOR2X1 U45 ( .A(n46), .B(n7), .Y(SUM[9]) );
  AOI21X1 U46 ( .A(n42), .B(n61), .C(n43), .Y(n41) );
  NOR2X1 U47 ( .A(n44), .B(n47), .Y(n42) );
  OAI21X1 U48 ( .A(n48), .B(n44), .C(n45), .Y(n43) );
  NAND2X1 U49 ( .A(n45), .B(n102), .Y(n7) );
  NOR2X1 U51 ( .A(B[9]), .B(A[9]), .Y(n44) );
  NAND2X1 U52 ( .A(B[9]), .B(A[9]), .Y(n45) );
  XNOR2X1 U53 ( .A(n53), .B(n8), .Y(SUM[8]) );
  OAI21X1 U54 ( .A(n60), .B(n47), .C(n48), .Y(n46) );
  NAND2X1 U55 ( .A(n169), .B(n56), .Y(n47) );
  AOI21X1 U56 ( .A(n57), .B(n169), .C(n50), .Y(n48) );
  NAND2X1 U59 ( .A(n52), .B(n169), .Y(n8) );
  NAND2X1 U62 ( .A(B[8]), .B(A[8]), .Y(n52) );
  XOR2X1 U63 ( .A(n60), .B(n9), .Y(SUM[7]) );
  OAI21X1 U64 ( .A(n60), .B(n54), .C(n55), .Y(n53) );
  NAND2X1 U69 ( .A(n55), .B(n56), .Y(n9) );
  NOR2X1 U71 ( .A(B[7]), .B(A[7]), .Y(n54) );
  NAND2X1 U72 ( .A(B[7]), .B(A[7]), .Y(n55) );
  XNOR2X1 U73 ( .A(n68), .B(n10), .Y(SUM[6]) );
  OAI21X1 U75 ( .A(n62), .B(n82), .C(n63), .Y(n61) );
  NAND2X1 U76 ( .A(n64), .B(n72), .Y(n62) );
  AOI21X1 U77 ( .A(n73), .B(n64), .C(n65), .Y(n63) );
  NOR2X1 U78 ( .A(n66), .B(n69), .Y(n64) );
  OAI21X1 U79 ( .A(n66), .B(n70), .C(n67), .Y(n65) );
  NAND2X1 U80 ( .A(n67), .B(n105), .Y(n10) );
  NOR2X1 U82 ( .A(B[6]), .B(A[6]), .Y(n66) );
  NAND2X1 U83 ( .A(B[6]), .B(A[6]), .Y(n67) );
  XOR2X1 U84 ( .A(n71), .B(n11), .Y(SUM[5]) );
  OAI21X1 U85 ( .A(n71), .B(n69), .C(n70), .Y(n68) );
  NAND2X1 U86 ( .A(n70), .B(n106), .Y(n11) );
  NOR2X1 U88 ( .A(B[5]), .B(A[5]), .Y(n69) );
  NAND2X1 U89 ( .A(B[5]), .B(A[5]), .Y(n70) );
  XOR2X1 U90 ( .A(n76), .B(n12), .Y(SUM[4]) );
  AOI21X1 U91 ( .A(n72), .B(n81), .C(n73), .Y(n71) );
  NOR2X1 U92 ( .A(n74), .B(n79), .Y(n72) );
  OAI21X1 U93 ( .A(n74), .B(n80), .C(n75), .Y(n73) );
  NAND2X1 U94 ( .A(n75), .B(n107), .Y(n12) );
  NOR2X1 U96 ( .A(B[4]), .B(A[4]), .Y(n74) );
  NAND2X1 U97 ( .A(B[4]), .B(A[4]), .Y(n75) );
  XNOR2X1 U98 ( .A(n81), .B(n13), .Y(SUM[3]) );
  AOI21X1 U99 ( .A(n77), .B(n81), .C(n78), .Y(n76) );
  NAND2X1 U102 ( .A(n80), .B(n77), .Y(n13) );
  NOR2X1 U104 ( .A(B[3]), .B(A[3]), .Y(n79) );
  NAND2X1 U105 ( .A(B[3]), .B(A[3]), .Y(n80) );
  XNOR2X1 U106 ( .A(n87), .B(n14), .Y(SUM[2]) );
  AOI21X1 U108 ( .A(n91), .B(n83), .C(n84), .Y(n82) );
  NOR2X1 U109 ( .A(n85), .B(n88), .Y(n83) );
  OAI21X1 U110 ( .A(n85), .B(n89), .C(n86), .Y(n84) );
  NAND2X1 U111 ( .A(n86), .B(n109), .Y(n14) );
  NOR2X1 U113 ( .A(B[2]), .B(A[2]), .Y(n85) );
  NAND2X1 U114 ( .A(B[2]), .B(A[2]), .Y(n86) );
  XOR2X1 U115 ( .A(n90), .B(n15), .Y(SUM[1]) );
  OAI21X1 U116 ( .A(n90), .B(n88), .C(n89), .Y(n87) );
  NAND2X1 U117 ( .A(n89), .B(n110), .Y(n15) );
  NOR2X1 U119 ( .A(B[1]), .B(A[1]), .Y(n88) );
  NAND2X1 U120 ( .A(B[1]), .B(A[1]), .Y(n89) );
  XNOR2X1 U121 ( .A(n16), .B(CI), .Y(SUM[0]) );
  OAI21X1 U123 ( .A(n92), .B(n94), .C(n93), .Y(n91) );
  NAND2X1 U124 ( .A(n93), .B(n111), .Y(n16) );
  NOR2X1 U126 ( .A(B[0]), .B(A[0]), .Y(n92) );
  NAND2X1 U127 ( .A(B[0]), .B(A[0]), .Y(n93) );
  OR2X2 U132 ( .A(B[8]), .B(A[8]), .Y(n169) );
  OR2X2 U133 ( .A(B[11]), .B(A[11]), .Y(n170) );
  OR2X2 U134 ( .A(B[13]), .B(A[13]), .Y(n171) );
  OR2X2 U135 ( .A(B[15]), .B(A[15]), .Y(n172) );
  INVX2 U136 ( .A(n31), .Y(n99) );
  INVX2 U137 ( .A(n23), .Y(n97) );
  INVX2 U138 ( .A(CI), .Y(n94) );
  INVX2 U139 ( .A(n91), .Y(n90) );
  INVX2 U140 ( .A(n82), .Y(n81) );
  INVX2 U141 ( .A(n80), .Y(n78) );
  INVX2 U142 ( .A(n61), .Y(n60) );
  INVX2 U143 ( .A(n55), .Y(n57) );
  INVX2 U144 ( .A(n52), .Y(n50) );
  INVX2 U145 ( .A(n37), .Y(n35) );
  INVX2 U146 ( .A(n29), .Y(n27) );
  INVX2 U147 ( .A(n21), .Y(n19) );
  INVX2 U148 ( .A(n92), .Y(n111) );
  INVX2 U149 ( .A(n88), .Y(n110) );
  INVX2 U150 ( .A(n85), .Y(n109) );
  INVX2 U151 ( .A(n79), .Y(n77) );
  INVX2 U152 ( .A(n74), .Y(n107) );
  INVX2 U153 ( .A(n69), .Y(n106) );
  INVX2 U154 ( .A(n66), .Y(n105) );
  INVX2 U155 ( .A(n54), .Y(n56) );
  INVX2 U156 ( .A(n44), .Y(n102) );
  INVX2 U157 ( .A(n39), .Y(n101) );
  INVX2 U158 ( .A(n17), .Y(SUM[16]) );
endmodule


module adder_16 ( a, b, carry_in, sum, overflow );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input carry_in;
  output overflow;


  adder_16_DW01_add_1 r304 ( .A({1'b0, a}), .B({1'b0, b}), .CI(carry_in), 
        .SUM({overflow, sum}) );
endmodule

