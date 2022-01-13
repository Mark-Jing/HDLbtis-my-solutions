module top_module( 
    input a, b,
    output cout, sum );
    always @(*) begin
        sum=a^b;
        cout=a&&b;
    end
endmodule