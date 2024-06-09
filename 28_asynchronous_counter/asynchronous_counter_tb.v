module asynchronous_counter_tb();
  reg clk, rst;
  reg j, k;
  reg up;
  wire [3:0] q, q_bar;
  asynchronous_counter DUT(clk, rst, j, k, up, q, q_bar);
  
  initial begin
    clk = 0; 
	 rst = 0; 
    up = 1;
    #4; 
	 
	 rst = 1;j = 1; k = 1;
    #80;
	 
    rst = 0;
    #4; 
	 
	 rst = 1; up = 0;
    #50;
  end
  always #2 clk = ~clk;

endmodule 