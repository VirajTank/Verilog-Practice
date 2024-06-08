`timescale 1ns/1ps

module comparator_tb();
reg [3:0]A,B;
wire grt,less,eq;
integer i;
comparator DUT(A,B,grt,less,eq);

initial begin
	$monitor("A=%d B=%d grt=%b less=%b eq=%b",A,B,grt,less,eq);
	for(i = 0; i < 64; i = i +1) begin
		{A,B} = i;
		#10;
	end 
end 

endmodule 
