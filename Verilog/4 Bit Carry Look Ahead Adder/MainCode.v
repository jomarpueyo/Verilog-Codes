`timescale 1ns / 1ps
//Partial Full Adder
module PFA(s,g,p,a,b,c);
output s,g,p; 
input  a,b,c;

	xor(p,a,b);
	xor(s,p,c);
	and(g,a,b);

endmodule

//Carry Look Ahead Logic
module CLA(p1,g1,p2,g2,cin,pout,gout,c1,c2);
input p1,g1,p2,g2,cin;
output pout,gout,c1,c2;
wire w1,w2;

assign c1=cin;

    and (pout,p1,p2);
	and (w1,p2&g1);
    or  (gout,g2,w1);
    and (w2,p1,cin);
	or  (c2,w2,g1);
	 
endmodule


//4Bit Carry Look Ahead Ad
module fourbit(a,b,cin,s,cout,PG,GG);
input  [3:0] a,b;
input        cin;
output [3:0] s;
output       cout,PG,GG;

wire [3:0] p,g,c;
//sum,generate,propagate,a,b,carry-PFA
	PFA set1(s[0],g[0],p[0],a[0],b[0],c[0]);
	PFA set2(s[1],g[1],p[1],a[1],b[1],c[1]);
	PFA set3(s[2],g[2],p[2],a[2],b[2],c[2]);
	PFA set4(s[3],g[3],p[3],a[3],b[3],c[3]);
	
//Cout,gout,pout,cin,pin,gin-CLA
wire [1:0] pp,gg,cc;
	CLA part1(p[0],g[0],p[1],g[1],cc[0],pp[0],gg[0],c[0],c[1]);
	CLA part2(p[2],g[2],p[3],g[3],cc[1],pp[1],gg[1],c[2],c[3]);
//2ndlayer
wire ppp,ggg;
	CLA part3(pp[0],gg[0],pp[1],gg[1],cin,ppp,ggg,cc[0],cc[1]);
//finalout
assign 
	cout = ggg + (ppp & cin),
	PG = p[3]&p[2]&p[1]&p[0],
	GG = g[3]+p[3]&g[2]+p[3]&p[2]&g[1]+p[3]&p[2]&p[1]&g[0];
endmodule