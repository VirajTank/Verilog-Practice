module mux_2_1(
	input sel,
	input i0,i1,
	output reg y
);

always @(*) begin
	y = sel ? i1 : i0;
end 
endmodule 

module mux_4_1_using_2_1(
	input sel0,sel1,
	input i0,i1,i2,i3,
	output y
);

	wire y0,y1;
	
	mux_2_1 M1(sel1,i2,i3,y1);
	mux_2_1 M2(sel1,i0,i1,y0);
	mux_2_1 M3(sel0,y0,y1,y);
endmodule 