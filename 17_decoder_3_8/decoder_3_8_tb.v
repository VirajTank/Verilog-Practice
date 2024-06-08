`timescale 1ns/1ps

module decoder_3_8_tb();

reg [2:0]d;
wire [7:0]y;
integer i;
decoder_3_8 DUT(d,y);

initial begin 
	$monitor("d=%b y=%b",d,y);
	
	for(i = 0; i < 8; i = i + 1)begin
	d = i;
	#10;
	end
end 
endmodule 