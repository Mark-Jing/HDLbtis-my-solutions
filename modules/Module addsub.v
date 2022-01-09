module top_module(
  input [31:0] a,
  input [31:0] b,
  input sub,
  output [31:0] sum
);
  wire [31:0] subb;
  wire cout1,cout2;
  assign subb=b^{32{sub}};
  add16 add1(a[15:0],subb[15:0],sub,sum[15:0],cout1);
  add16 add2(a[31:16],subb[31:16],cout1,sum[31:16],cout2);
endmodule