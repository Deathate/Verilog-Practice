// module full_adder_s(
//     input  a,  b,  cin,
//     output reg sum,  cout
//   );
//   always @(*)
//   begin
//     sum = a ^ b ^ cin;
//     cout = (a & b) | (b & cin) | (a & cin);
//   end
module full_adder_s(
    input  a,  b,  cin,
    output reg sum, cout
  );
  always @(*)
  begin
    {cout, sum} = a + b + cin;
  end
endmodule
module tb;
  reg a,b,c;
  wire sum,cout;
  full_adder_s uut(
                 .a(a),
                 .b(b),
                 .cin(c),
                 .sum(sum),
                 .cout(cout)
               );
  initial
  begin
    $dumpfile("wave.vcd");
    $dumpvars;
    a = 0;
    b = 0;
    c = 0;
    #10;
    if (sum != 0 || cout != 0)
      $display("Test case 1 failed");

    a = 0;
    b = 1;
    c = 0;
    #10;
    if (sum != 1 || cout != 0)
      $display("Test case 2 failed");
    a = 1;
    b = 0;
    c = 0;
    #10;
    if (sum != 1 || cout != 0)
      $display("Test case 3 failed");
    a = 1;
    b = 1;
    c = 0;
    #10;
    if (sum != 0 || cout != 1)
      $display("Test case 4 failed");
    a = 0;
    b = 0;
    c = 1;
    #10;
    if (sum != 1 || cout != 0)
      $display("Test case 5 failed");
    a = 0;
    b = 1;
    c = 1;
    #10;
    if (sum != 0 || cout != 1)
      $display("Test case 6 failed");
    a = 1;
    b = 0;
    c = 1;
    #10;
    if (sum != 0 || cout != 1)
      $display("Test case 7 failed");
    a = 1;
    b = 1;
    c = 1;
    #10;
    if (sum != 1 || cout != 1)
      $display("Test case 8 failed");
    #50;
    $finish;
  end
endmodule
