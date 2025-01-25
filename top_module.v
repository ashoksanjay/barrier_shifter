module barrier_shift(out, in, shift, dir);
  input [3:0] in;
  input [1:0] shift;
  input dir;
  output reg [3:0] out;
  
  always @(*) begin
    if(dir == 1'b0) begin
      case(shift)
        2'b00 : out = in;
        2'b01 : out = {in[2:0], in[3]};
        2'b10 : out = {in[1:0], in[3:2]};
        2'b11 : out = {in[0], in[3:1]};
      endcase
    end
    else if(dir == 1'b1) begin
      case(shift)
        2'b00 : out = in;
        2'b01 : out = {in[0], in[3:1]};
        2'b10 : out = {in[1:0], in[3:2]};
        2'b11 : out = {in[2:0], in[3]};
      endcase
      
    end
  end
  
endmodule
