module FA(
    input a,b,
    input cin,
    output cout,
    output sum
);
    always @(*) begin
        sum=a^b^cin;
        cout=(a&&b)||(a&&cin)||(b&&cin);
    end
endmodule

module top_module(
    input [99:0] a,b,
    input cin,
    output cout,
    output [99:0] sum
);
    wire [99:0] tmp_cout;
    FA FA1(a[0],b[0],cin,tmp_cout[0],sum[0]);
    genvar i;
    generate
        for(i=1;i<=99;i++) begin:full_adder
            FA FAs(a[i],b[i],tmp_cout[i-1],tmp_cout[i],sum[i]);
    end
    endgenerate
    assign cout=tmp_cout[99];
endmodule