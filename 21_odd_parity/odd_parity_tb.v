`timescale 1ns/1ps

module odd_parity_tb();

reg [3:0]A;
wire out;
integer i;
odd_parity DUT(A,out);

initial begin 
	$monitor("A=%b out=%b",A,out);
	
	for(i = 0; i < 16; i = i + 1) begin
		A = i;
		#10;
	end
end 
endmodule 