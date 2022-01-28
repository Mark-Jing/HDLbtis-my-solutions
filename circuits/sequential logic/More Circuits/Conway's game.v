module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    
    integer i,m,n;
    reg [17:0] g_2d [17:0];
    reg [2:0] sum;
    // extend 16×16 toroid to 18×18 grid
    always@(*) begin
        g_2d[0] = {q[16*15],q[16*15 +: 16],q[16*16 -1]};
        g_2d[17] = {q[16*0],q[16*0 +: 16],q[16*1 -1]};
        for(i = 1 ; i < 17 ; i += 1) begin //note index starting point
            g_2d[i] = {q[16*(i-1)],q[16*(i-1) +: 16],q[16*i -1]};
        end
    end
    // judge every cell’s life
    always@(posedge clk) begin
        if(load) begin
            q <= data;
        end
        else begin
            for(m = 0 ; m < 16 ; m += 1) begin: row
                for(n = 0 ; n < 16 ; n += 1) begin: col
                    sum = g_2d[m][n] + g_2d[m][n+1] + g_2d[m][n+2] 
                    + g_2d[m+1][n] + g_2d[m+1][n+2] 
                    + g_2d[m+2][n] + g_2d[m+2][n+1] + g_2d[m+2][n+2];
                    case(sum)
                        3'b010: q[16*m+n] <= q[16*m+n];
                        3'b011: q[16*m+n] <= 1'b1;
                        default: q[16*m+n] <= 1'b0;
                    endcase
                end
            end
        end
    end
endmodule
