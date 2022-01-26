module top_module (
    input clk,
    input x,
    output z
); 
   	reg wire1,wire2,wire3;
    initial z = 1;
    always @(posedge clk)begin
    	wire1 = x^wire1;
        wire2 = x&(~wire2);
        wire3 = x|(~wire3);
        z = ~(wire1|wire2|wire3); 
    end
endmodule