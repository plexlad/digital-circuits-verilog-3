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
    if2to4 decoder0(x[0 +: 2], b[0 +: 4], en0);
    if2to4 decorder1(x[0 +: 2], b[4 +: 4], en1);
endmodule

module h6to64(x, b, en);
    input en;
    input  [5:0]  x;
    output [63:0] b;
    wire [7:0] w;
    wire [63:0] b4;

    h3to8 dS(x[3 +: 3], w, 1);

    h3to8 decoder0(x[0 +: 3], b4[0  +: 8], w[0]);
    h3to8 decoder1(x[0 +: 3], b4[8  +: 8], w[1]);
    h3to8 decoder2(x[0 +: 3], b4[16 +: 8], w[2]);
    h3to8 decoder3(x[0 +: 3], b4[24 +: 8], w[3]);
    h3to8 decoder4(x[0 +: 3], b4[32 +: 8], w[4]);
    h3to8 decoder5(x[0 +: 3], b4[40 +: 8], w[5]);
    h3to8 decoder6(x[0 +: 3], b4[48 +: 8], w[6]);
    h3to8 decoder7(x[0 +: 3], b4[56 +: 8], w[7]);

//    genvar i;
//    generate
//        for (i=0; i<8; i=i+1) begin
//            h3to8 d(x[0 +: 3], b4[i*8 +: 8], w[i]);
//        end
//    endgenerate
endmodule
