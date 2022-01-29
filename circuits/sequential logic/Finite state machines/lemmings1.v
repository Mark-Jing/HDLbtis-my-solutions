module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter goLeft=0,goRight=1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            goLeft: begin
                if(bump_left&&bump_right) next_state=goRight;
                else if(bump_left) next_state=goRight;
                else if(bump_right) next_state=goLeft;
                else next_state=state;
            end
            goRight: begin
                if(bump_left&&bump_right) next_state=goLeft;
                else if(bump_left) next_state=goRight;
                else if(bump_right) next_state=goLeft;
                else next_state=state;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) state<=goLeft;
        else state<=next_state;
    end

    // Output logic
    assign walk_left= (state==goLeft);
    assign walk_right= (state==goRight);

endmodule