//////////////////////////////////////////////////adder//////////////////////
module fourbitadder(sum,cout,cin,a,b);
//4 full adders together
output [3:0] sum;
output cout;
input [3:0] a,b;
input cin;
//connects the adders together
wire c1,c2,c3;

//sum,carryout,a in, b in, carryin 
    full adder1(sum[0],c1,a[0],b[0],cin);
    full adder2(sum[1],c2,a[1],b[1],c1);
    full adder3(sum[2],c3,a[2],b[2],c2);
    full adder4(sum[3],cout,a[3],b[3],c3);

endmodule


module full(s,co,ci,a,b);
//full block of adding
output s,co;
input ci,a,b;
//connects the two half adders to create one full adder
wire abxor, aband, abciand;

// sum,carry,a,b
    half add1(abxor,aband,a,b);
    half add2(s,abciand,ci,abxor);
// carryout of fulladder
    or       (co,abciand,aband);
endmodule



module half(s,c,a,b);
//half block of adding
output s,c;
input a,b;

    xor (s,a,b);
    and (c,a,b);

endmodule
////////////////////////////////////////////adder////////////////////////////



////////////////////////////////////////////subtractor//////////////////////
module subtractor(a,b,bin,diff,bout);
	input a,b,bin;
	output diff,bout;
						//truthtable to kmap logic
		assign diff=(a&~b&~bin)|(!a&~b&bin)|(!a&b&~bin);   
		assign bout=(!a&bin)|(!a&b)|(b&bin);

endmodule



module fourbitsubtractor(a,b,bin,diff,bout);
	input [3:0] a,b;
	input bin;
	output [3:0] diff;
	output bout;
	wire [2:0] carry;
						//abstaniate 1bit subtractor four times for four bit subtractor
	subtractor bit1(a[0],b[0],bin,diff[0],carry[0]);
	subtractor bit2(a[1],b[1],carry[0],diff[1],carry[1]);
	subtractor bit3(a[2],b[2],carry[1],diff[2],carry[2]);
	subtractor bit4(a[3],b[3],carry[2],diff[3],bout);
	
endmodule
/////////////////////////////////////////subtractor/////////////////////////

///////////////////////////////////////or////
module operationor(a,b,out);
  input [3:0] a,b;
  output reg [3:0] out;
  
always@*
  out = a|b;
endmodule
///////////////////////////////////////or////


module ALU(a,b,cin,cout,out,control);
	input  [0:3] a,b;
	input  [0:2] control;
	input        cin;
	output reg [3:0] out;
	output reg      cout;  
	wire [0:3] w1,w2,w3;
	wire c1,c2;
// wires to carry the abstantiation output/cout to the mux	
 
 
fourbitadder add(w1,c1,cin,a,b);
fourbitsubtractor sub(a,b,cin,w2,c2);	
operationor orr(a,b,w3);	
	
always@*
begin
	case(control)
	3'b000: out = w1;
	3'b001: out = w2;
	3'b010: out = w3;
	3'b011: out = a&b;
	3'b100: out = {a[1],a[2],a[3],1'b0};
	3'b101: out = {1'b0,a[0],a[1],a[2]};
	3'b110: out = {a[1:3],a[0]};
	3'b111: out = {a[3],a[0:2]};
  endcase
end

//separate mux for the cout
always@*
begin
	case(control)
	3'b000: cout<= c1;
	3'b001: cout<= c2;
	default: cout<= 1'b0;
  endcase
end


endmodule