`timescale 1ns/1ps

module full_adder_tb();
reg a,b,cin;
wire sum,carry;

full_adder DUT (a,b,cin,sum,carry);

initial begin 
$monitor($time,"a=%d b=%d cin=%d sum=%d carry=%d",a,b,cin,sum,carry);
end 

initial begin 
a = 1'b0; b = 1'b0; cin = 1'b0;
#10 a = 1'b0; b = 1'b0; cin = 1'b1;
#10 a = 1'b0; b = 1'b1; cin = 1'b0;
#10 a = 1'b0; b = 1'b1; cin = 1'b1;
#10 a = 1'b1; b = 1'b0; cin = 1'b0;
#10 a = 1'b1; b = 1'b0; cin = 1'b1;
#10 a = 1'b1; b = 1'b1; cin = 1'b0;
#10 a = 1'b1; b = 1'b1; cin = 1'b1;

end 

endmodule 