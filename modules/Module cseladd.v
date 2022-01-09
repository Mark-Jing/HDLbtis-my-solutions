module top_module(
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);
  wire cout_low;
  wire [15:0] res_low;
  wire [15:0] res_0,res_1;
  wire cout_1,cout_0;
  add16 lowbit(a[15:0],b[15:0],0,sum[15:0],cout_low);
  add16 alt_0(a[31:16],b[31:16],0,res_0,cout_0);
  add16 alt_1(a[31:16],b[31:16],1,res_1,cout_1);
  always @(cout_low,res_0,res_1) begin
    case(cout_low)
      0: sum[31:16]=res_0;
      1: sum[31:16]=res_1;
    endcase
  end
endmodule