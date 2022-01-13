module top_module( 
  input [399:0] a, b,
  input cin,
  output cout,
  output [399:0] sum );
    wire[99:0] cout_wires;
    genvar i;
    generate
      bcd_fadd(a[3:0],b[3:0],cin,cout_wires[0],sum[3:0]);
      for(i=1;i<=99;i++) begin: BCD_full_adder
        bcd_fadd bcd_adder(a[i*4+3:i*4],b[i*4+3:i*4],cout_wires[i-1],cout_wires[i],sum[4*i+3:4*i]);
      end
    endgenerate
    assign cout=cout_wires[99];
endmodule