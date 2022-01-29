module top_module(
    input clk,
    input reset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            B: begin
                if(in==1) next_state=B;
                else next_state=A;
            end
            A: begin
                if(in==1) next_state=A;
                else next_state=B;
            end
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(reset) state<=B;
        else state<=next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out= (state==A)?0:1;
endmodule