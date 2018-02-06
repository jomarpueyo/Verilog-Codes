`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:59:27 02/15/2017
// Design Name:   ALU
// Module Name:   C:/temp/ALU/ALU_TB.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_TB;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	reg [2:0] control;

	// Outputs
	wire cout;
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.out(out), 
		.control(control)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;
		control = 0;
		#100;
		
		a = 4'b1010;
		b = 4'b0101;
		cin = 0;
		control = 3'b000;//add
		
		#100;
		a = 4'b1010;
		b = 4'b1010;
		cin = 0;
		control = 3'b001;//sub
		
		#100;
		a = 4'b1010;
		b = 4'b0101;
		cin = 0;
		control = 3'b010;//or
		
		#100;
		a = 4'b1010;
		b = 4'b0101;
		cin = 1'b1;
		control = 3'b000;//test cout
		#100;
		
      a = 4'b1010;
		b = 4'b0101;
		cin = 1'b1;
		control = 3'b011;
		#100;
		
		a = 4'b1010;
		b = 4'b0101;
		cin = 1'b1;
		control = 3'b100;
		#100;
      
		a = 4'b1010;
		b = 4'b0101;
		cin = 1'b1;
		control = 3'b101;
		#100;
      
		a = 4'b1010;
		b = 4'b0101;
		cin = 1'b1;
		control = 3'b110;
		#100;
		
      a = 4'b1010;
		b = 4'b0101;
		cin = 1'b1;
		control = 3'b111;
		#100;
      
		// Add stimulus here

	end
      
endmodule

