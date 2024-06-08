`timescale 1ns/1ps
module JK_FF_tb;
  reg clk;
  reg rst;
  reg j;
  reg k;
  wire q;
  wire q_bar;
  
  JK_FF DUT(clk,rst,j,k,q,q_bar);

  initial begin
    clk = 0;
    rst = 0;
    j = 0;
    k = 0;

    // Apply reset
    rst = 1;
    #10; rst = 0;
    #10; rst = 1;

    // Test sequence
    // No change
    #10; j = 0; k = 0;
    // Set
    #10; j = 1; k = 0;
    // Reset
    #10; j = 0; k = 1;
    // Toggle
    #10; j = 1; k = 1;
    // No change again
    #10; j = 0; k = 0;
	 
  end

  // Clock generator
  always #5 clk = ~clk;

endmodule
