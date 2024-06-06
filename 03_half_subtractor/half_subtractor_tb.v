`timescale 1ns/1ps
module half_subtractor_tb();
reg a,b;
wire diff,borr;

half_subtractor DUT(a,b,diff,borr);

initial begin
$monitor($time,"a=%d b=%d diff=%d borr=%d",a,b,diff,borr);
end 

initial begin 
a = 1'b0; b = 1'b0;
#10 a = 1'b0; b = 1'b1;
#10 a = 1'b1; b = 1'b0;
#10 a = 1'b1; b = 1'b1;
end 
endmodule 