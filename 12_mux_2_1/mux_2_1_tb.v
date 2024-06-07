`timescale 1ns/1ps
module mux_2_1_tb();

reg a,b,s;
wire y;

mux_2_1 DUT(a,b,s,y);

initial begin 
	$monitor ("a=%b b=%b s=%b y=%b",a,b,s,y);
	s = 0; a = 0; b = 0; #10;
	s = 0; a = 0; b = 1; #10;
	s = 0; a = 1; b = 0; #10;
	s = 0; a = 1; b = 1; #10;
	s = 1; a = 0; b = 0; #10;
	s = 1; a = 0; b = 1; #10;
	s = 1; a = 1; b = 0; #10;
	s = 1; a = 1; b = 1; 
end 
endmodule 
