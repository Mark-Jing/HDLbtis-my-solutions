module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
	wire x=8'b00000000;
    assign x=x|sel;
    assign out=in[x]; 
endmodule