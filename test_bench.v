module test;
  reg [3:0] in;
  reg [1:0] shift;
  reg dir;
  wire [3:0] out;
  
  barrier_shift uut(.out(out), .in(in), .shift(shift), .dir(dir));
  
  initial begin
    $monitor("%b || %b", in ,out);
    $dumpfile("dump.vcd");
    $dumpvars(0, test);
    in = 4'b101; shift = 2'b01; dir = 0;#10;
    shift = 2'b11; dir = 1; #10;
    shift = 2'b10; dir = 0; #10;
    $finish;
  end
  
endmodule
