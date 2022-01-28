module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);
    MUXDFF s1(KEY[3],KEY[1],SW[3],KEY[2],KEY[0],LEDR[3]);
    MUXDFF s2(LEDR[3],KEY[1],SW[2],KEY[2],KEY[0],LEDR[2]);
    MUXDFF s3(LEDR[2],KEY[1],SW[1],KEY[2],KEY[0],LEDR[1]);
    MUXDFF s4(LEDR[1],KEY[1],SW[0],KEY[2],KEY[0],LEDR[0]);
endmodule
 
module MUXDFF (
    input w,
    input e,
    input r,
    input l,
    input clk,
    output q);
    always@(posedge clk)begin
        case({e,l})
            2'b00:q<=q;
            2'b01:q<=r;
            2'b10:q<=w;
            2'b11:q<=r;
        endcase
    end
endmodule