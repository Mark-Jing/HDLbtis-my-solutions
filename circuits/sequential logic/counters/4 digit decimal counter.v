module bcdcount (
    input clk,
    input reset,
    input ena,
    output [3:0] q
);
        always @(posedge clk) begin
            if(reset==1) q<=4'b0;
            else if(ena==1)
                if(q==4'd9) q<=4'b0;
                else q<=q+1;
        end
endmodule

module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q
);
    reg [3:0] q1,q2,q3,q4;
    bcdcount cnt0(clk,reset,1'b1,q1);
    bcdcount cnt1(clk,reset,q1==4'd9,q2);
    bcdcount cnt2(clk,reset,q2==4'd9&&q1==4'd9,q3);
    bcdcount cnt3(clk,reset,q3==4'd9&&q2==4'd9&&q1==4'd9,q4);
    q={q4,q3,q2,q1};
endmodule