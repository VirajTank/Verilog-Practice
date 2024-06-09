`timescale 1ns / 1ps

module universal_shift_register_tb();
  reg clk;
  reg reset;
  reg [3:0] data_in;
  reg [1:0] mode;
  wire [3:0] data_out;

  universal_shift_register uut (
    .clk(clk), 
    .reset(reset), 
    .data_in(data_in), 
    .data_out(data_out), 
    .mode(mode)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Initialize Inputs
    clk = 1;
    reset = 0;
    data_in = 0;
    mode = 2'b00;

    // Apply reset
    #10 reset = 1;

    // Test parallel load
    #10 data_in = 4'b1010;
    mode = 2'b11;
    #10 mode = 2'b00; // hold the value

    // Test right shift
    #10 data_in = 4'b0101;
    mode = 2'b01;
    #10 mode = 2'b00; // hold the value
    #10 mode = 2'b01; // shift right again
    #10 mode = 2'b00; // hold the value

    // Test left shift
    #10 data_in = 4'b1100;
    mode = 2'b10;
    #10 mode = 2'b00; // hold the value
    #10 mode = 2'b10; // shift left again
    #10 mode = 2'b00; // hold the value

    // Apply reset
    #10 reset = 0;
    #10 reset = 1;

    // Test parallel load after reset
    #10 data_in = 4'b1111;
    mode = 2'b11;
    #10 mode = 2'b00; // hold the value
  end

  initial begin
    // Monitor the signals
    $monitor("At time %t, reset = %b, mode = %b, data_in = %b, data_out = %b", 
             $time, reset, mode, data_in, data_out);
  end

endmodule
