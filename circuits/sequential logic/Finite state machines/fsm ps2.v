module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    parameter byte1=0,byte2=1,byte3=2,don=3;
    reg[1:0] state,next_state;
    // State transition logic (combinational)
    always @(*) begin
        case(state)
            byte1: begin
                if(in[3]) next_state=byte2;
                else next_state=byte1;
            end
            byte2: next_state=byte3;
            byte3: next_state=don;
            don: begin
                if(in[3]) next_state=byte2;
                else next_state=byte1;
            end
        endcase
    end
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset) state=byte1;
        else state=next_state;
    end
    // Output logic
    assign done=(state==don);
endmodule