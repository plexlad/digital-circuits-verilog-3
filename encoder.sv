module dec2to4 (W, En, Y);
    input [1:0] W;
    input En;
    output reg [0:3] Y;

    always @(W,En)
        case({En, W})
            3'b100: Y = 4'b1000;
            3'b101: Y = 4'b0100;
            3'b110: Y = 4'b0010;
            3'b111: Y = 4'b0001;
            default: Y = 4'b0000;
        endcase
endmodule

module mux4to1 (s0, s1, w, f);
    input s0;
    input s1;
    input [3:0] w;
    output f;

    wire [1:0] ws;
    assign ws[0] = s0;
    assign ws[1] = s1;

    wire [3:0] as;
    dec2to4 d(ws, 1, as);

    wire [3:0] os;
    genvar i;
    generate
        for (i=0; i<4; i=i+1) begin
            assign os[i] = w[i] & as[i];
        end
    endgenerate

    assign f = os[0] | os[1] | os[2] | os[3];
endmodule
