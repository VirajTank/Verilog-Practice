module full_subtractor(a,b,bin,diff,borr);
input a,b,bin;
output reg diff,borr;

always @(a,b,bin) begin 
	diff <= a ^ b ^ bin;
	borr <= (~a & b) | (~(a ^ b) & bin);
end 

endmodule 