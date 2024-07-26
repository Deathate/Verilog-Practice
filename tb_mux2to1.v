module mux2to1 (
    input wire a,      // First input
    input wire b,      // Second input
    input wire sel,    // Select signal
    output reg y      // Output
  );// Assign the output based on the select signal
  // assign y = sel ? b : a;
  always @(*)
  begin
    if(sel)
    begin
      y=b;
    end
    else
    begin
      y=a;
    end
  end
endmodule
module hello_world;
  initial
  begin
    $display("Hello, world!");
  end
endmodule

module testbench;

  reg a;
  reg b;
  reg sel;
  wire y;

  // Instantiate the mux2to1 module
  mux2to1 uut (
            .a(a),
            .b(b),
            .sel(sel),
            .y(y)
          );
  initial
  begin
    $dumpfile("wave.vcd");
    $dumpvars;
    // Test case 1
    a = 0;
    b = 0;
    sel = 0;
    #10;
    $display("sel=%b, a=%b, b=%b, y=%b", sel, a, b, y);

    // Test case 2
    a = 0;
    b = 1;
    sel = 0;
    #10;
    $display("sel=%b, a=%b, b=%b, y=%b", sel, a, b, y);

    // Test case 3
    a = 1;
    b = 0;
    sel = 1;
    #10;
    $display("sel=%b, a=%b, b=%b, y=%b", sel, a, b, y);

    // Test case 4
    a = 1;
    b = 1;
    sel = 1;
    #10;
    $display("sel=%b, a=%b, b=%b, y=%b", sel, a, b, y);

    // Test case 5
    a = 1;
    b = 0;
    sel = 0;
    #10;
    $display("sel=%b, a=%b, b=%b, y=%b", sel, a, b, y);

    $finish;
  end
  initial
  begin
    // Monitor changes
    $monitor("At time %t: a = %b, b = %b, sel = %b, y = %b", $time, a, b, sel, y);
  end
endmodule
