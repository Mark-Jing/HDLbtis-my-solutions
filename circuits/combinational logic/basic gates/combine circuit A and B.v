module circuitA (
    input x,y,
    output z
);
    assign z=(x^y)&x;
endmodule

module circuitB (
    input x,y,
    output z
);
    assign z=x~^y;
endmodule

module top_module (
    input x,y,
    output z
);
    wire outIA1,outIB1,outIA2,outIB2;
    circuitA IA1(x,y,outIA1);
    circuitB IB1(x,y,outIB1);
    circuitA IA2(x,y,outIA2);
    circuitB IB2(x,y,outIB2);
    assign z=(outIA1||outIB1)^(outIA2&&outIB2);
endmodule