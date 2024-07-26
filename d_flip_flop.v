module d_flip_flop (
    input wire clk,
    input wire d,
    output reg q
  );
  always @(posedge clk)
  begin
    q <= d;
  end
endmodule
`timescale 1ns / 1ps

module tb_d_flip_flop;

  // Declare inputs as reg and outputs as wire
  reg clk;
  reg d;
  wire q;

  // Instantiate the DUT
  d_flip_flop uut (
                .clk(clk),
                .d(d),
                .q(q)
              );

  // Clock generation
  initial
  begin
    clk = 0; // Initial value of clock
    forever
      #5 clk = ~clk; // Toggle clock every 5 ns
  end

  // Stimulus block
  initial
  begin
    $dumpfile("wave.vcd");
    $dumpvars;
    // Initialize inputs
    d = 0;
    // Apply test vectors
    #10 d = 1; // Change d after 10 ns
    #10 d = 0; // Change d after another 10 ns
    #10 d = 1; // Change d after another 10 ns

    // End the simulation after some time
    #50 $finish;
  end

  // Monitor signals
  initial
  begin
    $monitor("At time %t, clk = %b, d = %b, q = %b", $time, clk, d, q);
  end

endmodule
