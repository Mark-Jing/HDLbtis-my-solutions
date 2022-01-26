module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    always @(posedge clk) begin
        if(!reset) q<=4'b0001+q;
        else q<=0;
    end
endmodule