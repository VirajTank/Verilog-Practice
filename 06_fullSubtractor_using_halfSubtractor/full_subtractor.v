module half_subtractor(a,b,diff,borr);
input a,b;
output reg diff,borr;

always @(a,b)
begin 
	diff = a ^ b;
	borr = ~a & b;
end 
endmodule 

module full_subtractor(a_fa,b_fa,bin_fa,diff_fa,borr_fa);
input a_fa,b_fa,bin_fa;
output diff_fa,borr_fa;

wire diff_ha1,borr_ha1,borr_ha2;

half_subtractor HS1(a_fa,b_fa,diff_ha1,borr_ha1);
half_subtractor HS2(diff_ha1,bin_fa,diff_fa,borr_ha2);
assign borr_fa = borr_ha1 | borr_ha2;
endmodule 