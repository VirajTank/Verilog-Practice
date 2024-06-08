`timescale 1ns/1ps

module demux_1_4_using_1_2_tb();
	reg [1:0]sel;
	reg data;
	wire y0,y1,y2,y3;
	integer i;
demux_1_4_using_1_2 DUT(sel,data,y0,y1,y2,y3);

initial begin 
	$monitor("sel=%b data=%b y0=%b y1=%b y2=%b y3=%b",sel,data,y0,y1,y2,y3);
	for(i = 0; i < 8; i = i + 1) begin 
		{sel,data} = i;
		#10;
	end 
end 
endmodule 