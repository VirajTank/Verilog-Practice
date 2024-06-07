`timescale 1ns/1ps

module binary_to_gray_tb();

reg [3:0]b;
wire[3:0]g;
integer i;
binary_to_gray DUT(b,g);

initial begin 
	$monitor("Binary=%b Gray=%b",b,g);
	for (i = 0; i < 16; i = i +1) begin
		b = i;
		#10;
	end
end 
endmodule 