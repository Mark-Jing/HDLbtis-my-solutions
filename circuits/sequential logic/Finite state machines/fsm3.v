module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    parameter A=0,B=1,C=2,D=3;
    reg[1:0] state=A,next_state;
    // State transition logic
    always @(*) begin
        case(state)
            A: begin
                if(in) next_state=B;
                else next_state=A;
            end
            B: begin
                if(in) next_state=B;
                else next_state=C;
            end
            C: begin
                if(in) next_state=D;
                else next_state=A;
            end
            D: begin
                if(in) next_state=B;
                else next_state=C;
            end
        endcase
    end
    // State flip-flops with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if(areset) state<=A;
        else state<=next_state;
    end
    // Output logic
    assign out= (state==D);
endmodule