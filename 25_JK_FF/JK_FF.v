module JK_FF(
	input clk, rst,
	input j, k,
	output reg q,
	output q_bar
);

always @(posedge clk) begin 
	if (!rst)
		q <= 0;
	else begin 
		case ({j, k})
			2'b00: q <= q;     // no change
			2'b01: q <= 1'b0;  // reset
			2'b10: q <= 1'b1;  // set
			2'b11: q <= ~q;    // toggle
		endcase
	end
end 

assign q_bar = ~q;
endmodule
