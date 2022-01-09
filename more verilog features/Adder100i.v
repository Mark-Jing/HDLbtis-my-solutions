module one_bit_full_adder(
    input a,b,
    input cin,
    output cout,sum);
    assign sum  = a^b^cin;
    assign cout = (a&b)|(b&cin)|(cin&a);
endmodule

module top_module( 
  input [99:0] a, b,
  input cin,
  output [99:0] cout,
  output [99:0] sum );
    genvar i;
    one_bit_full_adder FA1(a[0],b[0],cin,cout[0],sum[0]);
    generate
      for(i=1;i<=99;i++) begin :Full_adder
        one_bit_full_adder FA(a[i],b[i],cout[i-1],cout[i],sum[i]);
      end
    endgenerate
endmodule