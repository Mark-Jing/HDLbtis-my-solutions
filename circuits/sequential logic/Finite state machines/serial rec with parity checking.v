module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    // Use FSM from Fsm_serial
    parameter idle=0,start=1,data=2,check=3,stop=4,error=5;
    reg [2:0] state,nstate;
    reg [3:0] cnt;
    reg [7:0] out_buf;
    reg odd_reset;
    reg odd_reg;
    wire odd;
    parity u1(
        .clk(clk),
        .reset(reset | odd_reset),
        .in(in),
        .odd(odd));   
    
    always@(posedge clk)begin
        if(reset)
            state <= idle;
        else
            state <= nstate;
    end
    always@(*)begin
        nstate = idle;
        case(state)
            idle :nstate = in?idle:start;
            start:nstate = data;
            data :nstate = (cnt == 8)? check:data;
            check:nstate = in?stop:error;
            error:nstate = in?idle:error;
            stop :nstate = in?idle:start;
            default:nstate = idle;
        endcase
    end
    always@(posedge clk)begin
        if(reset)
            cnt <= 0;
        else
            case(nstate)
                data : cnt<=cnt+1'b1;
                default: cnt<=0;
            endcase
    end
    // New: Datapath to latch input bits.
    always@(posedge clk) begin
        if(reset)
            out_buf <= 8'bx;
        else if(nstate == data)begin
            out_buf[cnt] <= in; 
        end    
    end
    // New: Add parity checking.
    always@(posedge clk) begin
        if(reset)
            odd_reg <= 0;
        else
            odd_reg <= odd;
    end
    always@(posedge clk) begin
        if(reset)
            odd_reset = 0;
        case(nstate)
            idle: odd_reset = 1;
            stop: odd_reset = 1;
            default:odd_reset = 0;
        endcase
    end
    assign out_byte = done? out_buf : 8'bx;
    assign done = (state == stop)&odd_reg;
endmodule