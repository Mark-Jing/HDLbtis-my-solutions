module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    parameter idle=0,start=1,data=2,stop=3,error=4;
    reg [2:0] state,nstate;
    reg [3:0] cnt;
    
    always@(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= nstate;
    end
    always@(*) begin
        nstate=idle;
        case(state)
            idle: nstate=in?idle:start;
            start: nstate=data;
            data: nstate=(cnt==8)?(in?stop:error):data;
            error: nstate=in?idle:error;
            stop: nstate=in?idle:start;
            default:nstate=idle;
        endcase
    end
    always@(posedge clk)begin
        if(reset)begin
            done<=0;
            cnt<=0;
        end
        else
            case(nstate)
                data: begin
                    done<=0;
                    cnt<=cnt+1'b1;
                end
                stop: begin
                    done<=1;
                    cnt<=0;
                end
                default: begin
                    done<=0;
                    cnt<=0;
                end
            endcase
    end
endmodule