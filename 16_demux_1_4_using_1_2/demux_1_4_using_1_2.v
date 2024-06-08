module demux_1_2(
	input sel,data,
	output reg y0,y1
);

always @(*) begin 

	y0 = (sel == 1'b0) ? data : 1'b0;
	y1 = (sel == 1'b1) ? data : 1'b0;
	
end 
endmodule  


module demux_1_4_using_1_2(
	input [1:0]sel,
	input data,
	output y0,y1,y2,y3
);

wire z1,z2;

demux_1_2 DM1(sel[1],data,z1,z2);
demux_1_2 DM2(sel[0],z1,y0,y1);
demux_1_2 DM3(sel[0],z2,y2,y3);
endmodule 