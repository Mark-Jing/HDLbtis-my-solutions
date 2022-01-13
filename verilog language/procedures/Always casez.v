// synthesis verilog_input_version verilog_2001
module top_module (
  input [7:0] in,
  output reg [2:0] pos  );
  always @(*) begin
       	casex (in[7:0])
            8'bxxxxxxx1: pos = 0;
            8'bxxxxxx1x: pos = 1;
            8'bxxxxx1xx: pos = 2;
            8'bxxxx1xxx: pos = 3;
            8'bxxx1xxxx: pos = 4;
            8'bxx1xxxxx: pos = 5;
            8'bx1xxxxxx: pos = 6;
            8'b1xxxxxxx: pos = 7;
            default: 	 pos = 0;
    	endcase
	end
endmodule
