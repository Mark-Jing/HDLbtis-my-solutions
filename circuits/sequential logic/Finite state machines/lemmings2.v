module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter  WL=0,WR=1,FL=2,FR=3;
    reg[1:0] state,next_state;
    always @(*) begin
        case (state)
            WL: begin
                if(ground) begin
                    if(bump_left) next_state=WR;
                    else next_state=WL;
                end
                else next_state=FL;
            end
            WR: begin
                if(ground) begin
                    if(bump_right) next_state=WL;
                    else next_state=WR;
                end
                else next_state=FR;
            end
            FL: begin
                if(ground) next_state=WL;
                else next_state=FL;
            end
            FR: begin
                if(ground) next_state=WR;
                else next_state=FR;
            end
        endcase
    end
    always @(posedge clk or posedge areset) begin
        if(areset) state<=WL;
        else state<=next_state;
    end
    always @(*) begin
        walk_left=(state==WL);
        walk_right=(state==WR);
        aaah=(state==FR||state==FL);
    end
endmodule