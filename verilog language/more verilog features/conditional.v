module top_module (
  input [7:0] a, b, c, d,
  output [7:0] min);//
 // assign intermediate_result1 = compare? true: false;
    wire [7:0] wire1,wire2;
    always @(*) begin
      wire1=a<b?a:b;
      wire2=c<d?c:d;
      min=wire1<wire2?wire1:wire2;
    end
endmodule
