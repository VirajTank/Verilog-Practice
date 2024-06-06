`timescale 1ns/1ps

module half_adder_tb();
reg a,b;
wire sum,carry;

half_adder DUT (a,b,sum,carry);

initial begin 
$monitor($time,"a=%d b=%d sum=%d carry=%d",a,b,sum,carry);
end 

initial begin 
a = 1'b0; b = 1'b0;
#10 a = 1'b0; b = 1'b1;
#10 a = 1'b1; b = 1'b0;
#10 a = 1'b1; b = 1'b1;
end 

endmodule 