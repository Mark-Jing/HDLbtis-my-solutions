module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter WL=0,WR=1,FL=2,FR=3,DL=4,DR=5,BR=6;
    reg[2:0] state,next_state;
    always @(*) begin
        case(state)
            WL: begin
                if(ground) begin
                    if(dig) next_state=DL;
                    else begin
                        if(bump_left) next_state=WR;
                        else next_state=WL;
                    end
                end
                else next_state=FL;
            end
            WR: begin
                if(ground) begin
                    if(dig) next_state=DR;
                    else begin
                        if(bump_right) next_state=WL;
                        else next_state=WR;
                    end
                end
                else next_state=FR;
            end
            FL: begin
                if(ground) begin
                    if(cur_fall>=5'd21) next_state=BR;
                    else next_state=WL;
                end
                else next_state=FL;
            end
            FR: begin
                if(ground) begin
                    if(cur_fall>=5'd21) next_state=BR;
                    else next_state=WR;
                end
                else next_state=FR;
            end
            DL: begin
                if(ground) next_state=DL;
                else next_state=FL;
            end
            DR: begin
                if(ground) next_state=DR;
                else next_state=FR;
            end
            BR: next_state=BR;
        endcase
    end
    reg[7:0] cur_fall;
    always @(posedge clk or posedge areset) begin
        if(areset) cur_fall<=8'b0;
        else if(next_state==FL||next_state==FR) cur_fall<=cur_fall+1'b1;
        else cur_fall<=8'b0;
    end
    always @(posedge clk or posedge areset) begin
        if(areset) state=WL;
        else state=next_state;
    end
    always @(*) begin
        if(state==BR) begin
            walk_left=0;
            walk_right=0;
            aaah=0;
            digging=0;
        end else begin
            walk_left=(state==WL);
            walk_right=(state==WR);
            aaah=(state==FL||state==FR);
            digging=(state==DL||state==DR);
        end
    end
endmodule