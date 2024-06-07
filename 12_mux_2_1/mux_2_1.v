module mux_2_1(
	input a,b,s,
	output reg y
);

always @(*) begin
	y = s ? b : a;
end 
endmodule 