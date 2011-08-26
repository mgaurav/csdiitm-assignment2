`include "stimulus.v"

module cla4(out, cout, in1, in2, c0);
   output [3:0] out;
   output 	cout;
   input [3:0] in1, in2;
   input c0;

   wire g0, g1, g2, g3;
   wire p0, p1, p2, p3;
   wire c1, c2, c3;

   and(g0, in1[0], in2[0]);
   and(g1, in1[1], in2[1]);
   and(g2, in1[2], in2[2]);
   and(g3, in1[3], in2[3]);

   xor(p0, in1[0], in2[0]);
   xor(p1, in1[1], in2[1]);
   xor(p2, in1[2], in2[2]);
   xor(p3, in1[3], in2[3]);

   wire p01, p02, p03, p12, p13, p23;
   wire cp0, cp01, cp02, cp03;

   and(cp0, c0, p0);
   and(cp01, c0, p0, p1);
   and(cp02, c0, p0, p1, p2);
   and(cp03, c0, p0, p1, p2, p3);

   or(c1, g0, cp0);
   wire g0p1, g1p2, g0p12, g2p3, g1p23, g0p13;

   and(g0p1, g0, p1);
   and(g1p2, g1, p2);
   and(g0p12, g0, p1, p2);
   and(g2p3, g2, p3);
   and(g1p23, g1, p2, p3);
   and(g0p13, g0, p1, p2, p3);

   or(c2, g1, g0p1, cp01);
   or(c3, g2, g1p2, g0p12, cp02);
   or(cout, g3, g2p3, g1p23, g0p13, cp03);

   xor(out[0], p0, c0);
   xor(out[1], p1, c1);
   xor(out[2], p2, c2);
   xor(out[3], p3, c3);
   
endmodule // cla4

module adder16(out, cout, in1, in2, as);
   output [15:0] out;
   output 	 cout;
   input [15:0]  in1, in2;
   input 	 as;

   wire 	 c4, c8, c12;
   wire [15:0] 	 in2m;

   xor(in2m[0], in2[0], as);
   xor(in2m[1], in2[1], as);
   xor(in2m[2], in2[2], as);
   xor(in2m[3], in2[3], as);
   xor(in2m[4], in2[4], as);
   xor(in2m[5], in2[5], as);
   xor(in2m[6], in2[6], as);
   xor(in2m[7], in2[7], as);
   xor(in2m[8], in2[8], as);
   xor(in2m[9], in2[9], as);
   xor(in2m[10], in2[10], as);
   xor(in2m[11], in2[11], as);
   xor(in2m[12], in2[12], as);
   xor(in2m[13], in2[13], as);
   xor(in2m[14], in2[14], as);
   xor(in2m[15], in2[15], as);
   
   cla4 CLA0(out[3:0], c4, in1[3:0], in2m[3:0], as);
   cla4 CLA1(out[7:4], c8, in1[7:4], in2m[7:4], c4);
   cla4 CLA2(out[11:8], c12, in1[11:8], in2m[11:8], c8);
   cla4 CLA3(out[15:12], cout, in1[15:12], in2m[15:12], c12);

endmodule // adder16
