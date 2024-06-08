module SR_FF(
	input clk,rst,
	input s,r,
	output reg q,
	output q_bar
);

always @(posedge clk) begin 
	if(!rst)
	q <= 0;
	else begin
		case({s,r})
			2'b00: q <= q; //no change
			2'b01: q <= 1'b0; //reset
			2'b10: q <= 1'b1; //set
			2'b11: q <= 1'bx; //invalid
		endcase
	end 
end 

assign q_bar = ~q;
endmodule 