`timescale 1ns/1ps

module carry_look_ahead_adder_tb();

reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry;

wire [4:0]add; 

carry_look_ahead_adder DUT(a,b,cin,sum,carry);

assign add = {carry,sum};

initial begin 
	$monitor("A = %b, B = %b, Cin = %b --> Sum = %b, Cout = %b, Addition = %0d", a, b, cin, sum, carry, add);
	
	 a = 1; b = 0; cin = 0; #10;
    a = 2; b = 4; cin = 1; #10;
    a = 11; b = 6; cin = 0; #10;
    a = 5; b = 3; cin = 1;
	
end 
endmodule 
