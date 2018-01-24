/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 24 17:23:43 2018
/////////////////////////////////////////////////////////////


module sensor_d ( sensors, error );
  input [3:0] sensors;
  output error;
  wire   n3;

  INVX1 U3 ( .A(n3), .Y(error) );
  AOI21X1 U4 ( .A(sensors[3]), .B(sensors[1]), .C(sensors[0]), .Y(n3) );
endmodule

