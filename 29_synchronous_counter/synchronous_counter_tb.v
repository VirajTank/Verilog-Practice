`timescale 1ns / 1ps

module synchronous_counter_tb;
  reg clk;
  reg rst;
  reg up;
  wire [3:0] count;
  
  synchronous_counter uut (
    .clk(clk), 
    .rst(rst), 
    .up(up), 
    .count(count)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Initialize Inputs
    clk = 0;
    rst = 0;
    up = 0;

    // Apply reset
    #10 rst = 1;  // Deassert reset
    #10 rst = 0;  // Assert reset
    #10 rst = 1;  // Deassert reset

    // Test UP counting
    up = 1;
    #100;  // Allow some time for counting

    // Check the outputs
    #20;
    $display("After up counting: count = %b", count);

    // Test DOWN counting
    up = 0;
    #100;  // Allow some time for counting

    // Check the outputs
    #20;
    $display("After down counting: count = %b", count);

    // Apply reset during operation
    #10 rst = 0;  // Assert reset
    #10 rst = 1;  // Deassert reset

    // Allow some time for reset to propagate
    #20;
    $display("After reset: count = %b", count);

  end

  initial begin
    // Monitor the signals
    $monitor("At time %t, rst = %b, up = %b, count = %b", 
             $time, rst, up, count);
  end

endmodule
