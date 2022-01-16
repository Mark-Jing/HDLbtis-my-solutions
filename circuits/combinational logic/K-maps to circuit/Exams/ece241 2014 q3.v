module top_module (
    input c,
    input d,
    output [3:0] mux_in
);
    
    always @(*) begin
        case({c,d})
            2'b0:
                mux_in = 4'b0100;
            2'b1:
                mux_in = 4'b0001;
            2'b11:
                mux_in = 4'b1001;
            default:
                mux_in = 4'b0101;
        endcase
    end
endmodule
