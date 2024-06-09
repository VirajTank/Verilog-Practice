`timescale 1ns/1ps

module moore_1010_sequence_tb();

  // Inputs
  reg clk;
  reg rst;
  reg inp;

  // Outputs
  wire outp;

  // Instantiate the Unit Under Test (UUT)
  moore_1010_sequence uut (
    .clk(clk), 
    .rst(rst), 
    .inp(inp), 
    .outp(outp)
  );

  initial begin
    // Initialize Inputs
    clk = 0;
    rst = 0;
    inp = 0;

    // Reset the design
    rst = 1; #10;
    rst = 0; #10;

    // Apply test sequence
    // Sequence to test: 101010
    inp = 1; #10; // State: B
    inp = 0; #10; // State: C
    inp = 1; #10; // State: D
    inp = 0; #10; // State: E, outp should be 1
    inp = 1; #10; // State: D
    inp = 0; #10; // State: E, outp should be 1 again
    inp = 1; #10; // State: D
    inp = 0; #10; // State: E, outp should be 1 again

    // Further sequences can be tested similarly
  end

  // Clock generation
  always #5 clk = ~clk;

endmodule
