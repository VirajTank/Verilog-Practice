module half_subtractor(a,b,diff,borr);
input a,b;
output reg diff,borr;

always @(a,b)
begin 
	diff <= a ^ b;
	borr <= ~a & b;
end 
endmodule 