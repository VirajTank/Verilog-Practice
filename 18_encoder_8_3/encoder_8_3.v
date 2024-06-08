module encoder_8_3(
	input [7:0]y,
	output reg [2:0]d
);

always @(y) begin
	
	d[2] = y[4] | y[5] | y[6] | y[7];
	d[1] = y[2] | y[3] | y[6] | y[7];
	d[0] = y[1] | y[3] | y[5] | y[7];

end 	
endmodule 