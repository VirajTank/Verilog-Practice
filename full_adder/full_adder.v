module full_adder(a,b,cin,sum,carry);
input a,b,cin;
output reg sum,carry;

always @(a,b,cin)
begin 
	sum = a ^ b ^ cin;
	carry = (a&b) | (b&cin) | (cin&a);
end
endmodule 