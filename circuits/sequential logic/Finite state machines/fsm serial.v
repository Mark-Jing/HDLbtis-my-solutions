module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter integer bytes[9]= {10,1,2,3,4,5,6,7,8};
    parameter start=0,over=9;
    reg[3:0] state,next_state;
    always @(*) begin
        if(state==start) begin
            if(~in) next_state=bytes[0];
            else next_state=start;
        end else if(state==bytes[8]) begin
            if(in) next_state=over;
            else next_state=start;
        end else if(state==over) begin
            next_state=start;
        end else begin
            next_state=bytes[state+1];
        end
    end
    always @(posedge clk) begin
        if(reset) state=start;
        else state=next_state;
    end
    assign done=(state==over);
endmodule