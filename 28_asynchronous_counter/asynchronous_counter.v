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

module updown_selector(
	input q,q_bar,up, 
	output nclk
);  
  assign nclk = up?q_bar:q;
endmodule

module asynchronous_counter(
	input clk,rst,
	input j,k,
	input up,
	output [3:0]q,q_bar
);
wire [3:0] nclk;
genvar g;

JK_FF jk0(clk, rst, j, k, q[0], q_bar[0]);
generate 	
	for(g = 1; g < 4; g = g + 1) begin : counter
		updown_selector ud1(q[g-1], q_bar[g-1], up, nclk[g-1]);
      JK_FF jk1(nclk[g-1], rst, j, k, q[g], q_bar[g]);
	end 
endgenerate 
endmodule 