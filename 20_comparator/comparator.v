module comparator(
	input [3:0]A,B,
	output reg grt,less,eq
);

always @(*) begin 

	grt = 0;
	less = 0;
	eq = 0;
	
	if(A > B)
		grt = 1'b1;
	if(A < B)
		less = 1'b1;
	if(A == B)
		eq = 1'b1;
end 
endmodule 