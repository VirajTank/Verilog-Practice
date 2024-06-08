module odd_parity(
	input [3:0]A,
	output reg out
);


always@(A) begin
	out=~(A[3] ^ A[2] ^ A[1] ^ A[0]);
end

endmodule 