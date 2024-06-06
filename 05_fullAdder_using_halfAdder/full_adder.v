module half_adder(a,b,sum,carry);
input a,b;
output reg sum,carry;

always @(a,b)
begin 
	sum = a ^ b;
	carry = a & b;
end 
endmodule 

module full_adder(a_fa,b_fa,cin_fa,sum_fa,carry_fa);
input a_fa,b_fa,cin_fa;
output sum_fa,carry_fa;

wire sum_ha1,carry_ha1,carry_ha2;

half_adder HA1(a_fa,b_fa,sum_ha1,carry_ha1);
half_adder HA2(sum_ha1,cin_fa,sum_fa,carry_ha2);
assign carry_fa = carry_ha1 | carry_ha2;

endmodule 