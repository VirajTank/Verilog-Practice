module gray_to_binary(
	input [3:0]g,
	output reg [4:0]b
);

always @(*) begin 
	
	b[3] = g[3];
	b[2] = g[2] ^ b[3];
	b[1] = g[1] ^ b[2];
	b[0] = g[0] ^ b[1];

end 
endmodule 