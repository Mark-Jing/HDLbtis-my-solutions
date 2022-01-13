module top_module( 
  input [254:0] in,
  output [7:0] out );
    reg [254:0] cnt;
    always @(in) begin
      cnt=0;
      for(integer i=0;i<=254;i++) begin
          if(in[i]) cnt+=1'b1;
          else cnt+=1'b0;
      end
      out=cnt;
    end
endmodule