module one_bit_full_adder ( 
    input a, b, cin,
    output cout, sum );
    always @(*) begin
        sum=a^b^cin;
        cout=(a&&b)||(b&&cin)||(a&&cin);
    end
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    genvar i;
    one_bit_full_adder FA1(a[0],b[0],cin,cout[0],sum[0]);
    generate
        for(i=1;i<=2;i++) begin:Full_adder
            one_bit_full_adder FA(a[i],b[i],cout[i-1],cout[i],sum[i]);
        end
    endgenerate
endmodule