`timescale 1ns/1ps

module SR_FF_tb;
  reg clk;
  reg rst;
  reg s;
  reg r;
  wire q;
  wire q_bar;

  SR_FF DUT (clk,rst,s,r,q,q_bar);

  initial begin
    clk = 0;
    rst = 0;
    s = 0;
    r = 0;

    // Apply reset
    rst = 1;
    #10; rst = 0;
    #10; rst = 1;

    // Test sequence
    // No change
    #10; s = 0; r = 0;
    // Set
    #10; s = 1; r = 0;
    // Reset
    #10; s = 0; r = 1;
    // Invalid
    #10; s = 1; r = 1;
    // Back to no change
    #10; s = 0; r = 0;

  end

  // Clock generator
  always #5 clk = ~clk;

endmodule 