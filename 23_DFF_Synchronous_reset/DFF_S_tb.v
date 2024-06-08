`timescale 1ns/1ps

module DFF_S_tb;
  reg clk;
  reg rst;
  reg d;
  wire q;

  DFF_S uut(clk,rst,d,q);

  initial begin
    clk = 0;
    rst = 0;
    d = 0;

    // Apply reset
    rst = 1;
    #10;
    rst = 0;

    // Test sequence
    #10; d = 1;
    #10; d = 1; rst = 1;
    #10; rst =
	 0;
    #10; d = 1;
    #10; d = 0;
    
  end

  // Clock generator
  always #5 clk = ~clk;

endmodule