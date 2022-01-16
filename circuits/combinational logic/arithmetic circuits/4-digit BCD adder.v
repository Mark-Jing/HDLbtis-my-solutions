module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0] tmp_cout;
    bcd_fadd FA1(a[3:0],b[3:0],cin,tmp_cout[0],sum[3:0]);
    genvar i;
    generate
        for(i=1;i<=3;i++) begin:full_adder
            bcd_fadd FA(a[i*4+3:i*4],b[i*4+3:i*4],tmp_cout[i-1],tmp_cout[i],sum[i*4+3:i*4]);
        end
    endgenerate
    assign cout=tmp_cout[3];
endmodule