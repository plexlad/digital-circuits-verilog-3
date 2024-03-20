module if2to4(x, b, en);
    input en;
    input  [1:0] x;
    output [3:0] b;
    assign b[0] = (~x[0] & ~x[1]) & en;
    assign b[1] = ( x[0] & ~x[1]) & en;
    assign b[2] = (~x[0] &  x[1]) & en;
    assign b[3] = ( x[0] &  x[1]) & en;
endmodule

module h3to8(x, b, en);
    input en;
    input  [2:0] x;
    output [7:0] b;
    wire en0;
    wire en1;

    assign en0 = ~x[2] & en;
    assign en1 =  x[2] & en;
    if2to4 encoder0(x[0 +: 2], b[0 +: 4], en0);
    if2to4 encoder1(x[0 +: 2], b[4 +: 4], en1);
endmodule

module h6to64(x, b, en);
    input en;
    input  [5:0]  x;
    output [63:0] b;
endmodule
