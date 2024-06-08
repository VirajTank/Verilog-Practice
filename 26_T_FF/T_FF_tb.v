`timescale 1ns / 1ps

module T_FF_tb;
  reg clk;
  reg rst;
  reg t;
  wire q;
  wire q_bar;
  
  T_FF DUT (clk,rst,t,q,q_bar);

  initial begin
    // Initialize Inputs
    clk = 0;
    rst = 0;
    t = 0;

    // Apply reset
    rst = 1;
    #10; rst = 0;
    #10; rst = 1;

    // Test sequence
    // No toggle (t = 0)
    #10; t = 0;
    // Toggle (t = 1)
    #10; t = 1;
    // No toggle (t = 0)
    #10; t = 0;
    // Toggle (t = 1)
    #10; t = 1;
    // Toggle (t = 1)
    #10; t = 1;
  end

  // Clock generator
  always #5 clk = ~clk;

endmodule
