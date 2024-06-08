module demux_2_1(
	input sel,data,
	output reg y0,y1
);

always @(*) begin 

	y0 = (sel == 1'b0) ? data : 1'b0;
	y1 = (sel == 1'b1) ? data : 1'b0;
	
end 
endmodule 