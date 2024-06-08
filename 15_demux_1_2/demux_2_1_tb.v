`timescale 1ns/1ps

module demux_2_1_tb();

reg sel,data;
wire y0,y1;
integer i;

demux_2_1 DUT(sel,data,y0,y1);

initial begin
	$monitor("sel=%b data=%b y0=%b y1=%b",sel,data,y0,y1);
	
	for (i = 0; i < 4; i = i + 1) begin
		{sel,data} = i;
		#10;
	end
	
//	sel = 0;data = 0;#10;
//	sel = 0;data = 1;#10;
//	sel = 1;data = 0;#10;
//	sel = 1;data = 1;
	
end
endmodule 