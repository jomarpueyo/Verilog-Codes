module fulladder(sum,carry_out,x_1,x_2,carry_in);
output sum,carry_out;
input x_1,x_2,carry_in;
wire wire_sum,wire_carryout1,wire_carryout2;

	halfadder add1(wire_sum,wire_carryout1,x_1,x_2);
	halfadder add2(sum,wire_carryout2,wire_carryout1,carry_in);
	or(carry_out,wire_carryout1,wire_carryout2);
	
endmodule

module halfadder(sum,carry,x_1,x_2);
output sum,carry;
input x_1,x_2;

	xor(sum,x_1,x_2);
	and(carry,x_1,x_2);
	
endmodule