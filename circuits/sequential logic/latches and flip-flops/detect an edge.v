module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] buff;
    always @(posedge clk) begin
        buff<=in;
        pedge<=(~buff)&in;
    end
endmodule