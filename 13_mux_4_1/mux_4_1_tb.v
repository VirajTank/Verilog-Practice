`timescale 1ns/1ps

module mux_4_1_tb();

reg i0,i1,i2,i3;
reg [1:0]sel;
wire y;
integer i;
mux_4_1 DUT(i0,i1,i2,i3,sel,y);

initial begin 
	$monitor("sel=%b i0=%b i1=%b i1=%b i3=%b y=%b",sel,i0,i1,i2,i3,y);
	{i3,i2,i1,i0} = 4'b1010;
	for (i = 0; i < 4; i = i + 1) begin 
		sel = i;
		#10;
	end 
end 
endmodule 