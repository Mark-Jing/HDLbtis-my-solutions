module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] buffer;
    always @(posedge clk) begin
        buffer<=in;
        anyedge<=in^buffer;
    end
endmodule