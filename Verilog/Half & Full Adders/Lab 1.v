`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jomar Pueyo
// 
// Create Date: 09/13/2017 05:16:48 PM
// Design Name: 
// Module Name: HalfAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/* Part 2: Design Full adder by instantiating two half adders. */
module fulladd(sum,carry_out,x_1,x_2,carry_in);
output sum,carry_out;
input x_1,x_2,carry_in;
wire wire_sum,wire_carryout1,wire_carryout2;

	halfaddergatelevel add1(wire_sum,wire_carryout1,x_1,x_2);
	halfaddergatelevel add2(sum,wire_carryout2,wire_sum,carry_in);
	or(carry_out,wire_carryout1,wire_carryout2);
	
endmodule

/* Part 1: Gate Level, Data Flow, Behavior */
////////////////////////////////////////////////////////////////////////////////

module fulladdergatelevel(sum,carry_out,carry_in,x_1,x_2);
output sum,carry_out;
input carry_in,x_1,x_2;
wire wire1,wire2,wire3;

    xor(wire1,x_1,x_2);
    and(wire2,x_1,x_2);
    xor(sum,wire1,carry_in);
    and(wire3,carry_in,wire1);
    or (carry_out,wire2,wire3);

endmodule

module halfaddergatelevel(sum,carry,x_1,x_2);
output sum,carry;
input x_1,x_2;

	xor(sum,x_1,x_2);
	and(carry,x_1,x_2);
	
endmodule

//////////////////////////////////////////////////////////////////////////////

module fulladderdataflow(sum,carry_out,x_1,x_2,carry_in);
output sum,carry_out;
input x_1,x_2,carry_in;

    assign sum = x_1 ^ x_2 ^ carry_in;
    assign carry_out = (x_1&&x_2)||(x_1&&carry_in)||(x_2&&carry_in);

endmodule


module halfadderdataflow(sum,carry,x_1,x_2);
output sum,carry;
input x_1,x_2;

    assign sum = x_1 ^ x_2;
    assign carry = x_1 && x_2;

endmodule

////////////////////////////////////////////////////////////////////////

module fulladderbehavioral(sum,carry_out,x_1,x_2,carry_in);
output reg sum,carry_out;
input x_1,x_2,carry_in;

always@(x_1,x_2,carry_in)
    begin
    {carry_out,sum} = x_1+x_2+carry_in; 
    end
endmodule 


module halfadderbehavioral(sum,carry,x_1,x_2);
output reg sum,carry;
input x_1,x_2;
    
always@(x_1,x_2)
    begin
    
    sum = x_1^x_2;
    carry = x_1&x_2;
     
    end
endmodule