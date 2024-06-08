`timescale 1ns/1ps

module priority_encoder_tb();

reg [7:0]y;
wire [2:0]d;
priority_encoder DUT(y,d);

initial begin 
	$monitor("y=%b d=%b",y,d);
	y = 8'b00000000; #10;
   y = 8'b00000001; #10;
   y = 8'b00000010; #10;
   y = 8'b00000100; #10;
   y = 8'b00001000; #10;
   y = 8'b00010000; #10;
   y = 8'b00100000; #10;
   y = 8'b01000000; #10;
   y = 8'b10000000; #10;
	
	//random with more than one input
	y = 9'b00100101;
	
end 
endmodule 