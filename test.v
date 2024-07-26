// module test(input a, input b,output c);
//   assign c = a & b;
// endmodule
module test(input a, input b,output reg c);
  always @(a or b)
  begin
    if(a==1 && b==1)
      c=1;
    else
      ;
  end
endmodule
module tb;
  reg a,b;
  wire c;
  test uut(
         .a(a),
         .b(b),
         .c(c)
       );
  initial
  begin
    $dumpfile("wave.vcd");
    $dumpvars;
    a=1;
    b=1;
    #10;
    a=0;
    b=1;
    #10;
    a=1;
    b=0;
    #10;
    a=0;
    b=0;
end
endmodule
