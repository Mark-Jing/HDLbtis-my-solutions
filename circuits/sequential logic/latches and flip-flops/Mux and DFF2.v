module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire out1,D;
    always @(posedge clk) begin
        out1= E==0?Q:w;
        D=L==0?out1:R;
        Q<=D;
    end
endmodule