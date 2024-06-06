`timescale 1ns/1ps
module alu_tb();

reg [3:0]a,b,s;
wire [3:0]y;
integer i;

alu DUT(a,b,s,y);

initial begin 
	$monitor($time,"S=%d A=%d B=%d Output=%d",a,b,s,y);
end 

initial begin
		a<=4'b1111;
		b<=4'b0010;
		for(i = 0; i < 16; i = i + 1) begin
			s = i;
			#10;
		end
end 
endmodule 