`timescale 1ns/1ps
module ripple_carry_adder_tb();
reg [3:0]A_tb;
reg [3:0]B_tb;
wire carry_tb;
wire [3:0]sum_tb;

ripple_carry_adder DUT(A_tb,B_tb,sum_tb,carry_tb);

integer i;

initial begin
	for (i=0;i<64;i=i+1)
	begin
		{A_tb,B_tb} = i;
		#1;
	end 
end

initial begin
$monitor($time,"A=%d B=%d Sum=%d Carry=%d",A_tb,B_tb,sum_tb,carry_tb);
end 

endmodule
