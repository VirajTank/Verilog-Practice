`timescale 1ns/1ps

module mealy_1010_sequence_tb();

  // Inputs
  reg clk;
  reg rst;
  reg inp;

  // Outputs
  wire outp;

  // Instantiate the Unit Under Test (UUT)
  mealy_1010_sequence uut (
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
	 inp = 1; #10; // State: B, outp = 0
    inp = 0; #10; // State: C, outp = 0
    inp = 1; #10; // State: D, outp = 0
    inp = 0; #10; // State: C, outp = 1 (sequence 1010 detected)
    inp = 1; #10; // State: D, outp = 0
    inp = 0; #10; // State: C, outp = 1 (sequence 1010 detected again)
    inp = 1; #10; // State: D, outp = 0
    inp = 0; #10; // State: C, outp = 1 (sequence 1010 detected again)

    // Further sequences can be tested similarly
  end

  // Clock generation
  always #5 clk = ~clk;

endmodule 