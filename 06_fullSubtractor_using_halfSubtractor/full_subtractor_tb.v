`timescale 1ns/1ps

module full_subtractor_tb();
reg a,b,bin;
wire diff,borr;

full_subtractor DUT (a,b,bin,diff,borr);

initial begin 
$monitor($time,"a=%d b=%d bin=%d diff=%d borr=%d",a,b,bin,diff,borr);
end 

initial begin 
a = 1'b0; b = 1'b0; bin = 1'b0;
#10 a = 1'b0; b = 1'b0; bin = 1'b1;
#10 a = 1'b0; b = 1'b1; bin = 1'b0;
#10 a = 1'b0; b = 1'b1; bin = 1'b1;
#10 a = 1'b1; b = 1'b0; bin = 1'b0;
#10 a = 1'b1; b = 1'b0; bin = 1'b1;
#10 a = 1'b1; b = 1'b1; bin = 1'b0;
#10 a = 1'b1; b = 1'b1; bin = 1'b1;

end 

endmodule 