module top_module( 
    input a, b, cin,
    output cout, sum );
    always @(*) begin
        sum=a^b^cin;
        cout=(a&&b)||(b&&cin)||(a&&cin);
    end
endmodule