module DFF_A(
	input clk,rst,
	input d,
	output reg q
);

always @(posedge clk or posedge rst) begin 

	if(rst) 
	q <= 0;
	else 
	q <= d;

end 
endmodule 