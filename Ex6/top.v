//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: Benjamin Duvieusart
// Date: 04-06-2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module mux(
	input rst,
	input clk,
	input button,
	input sel,
	output [2:0] result
	);
	
	wire [2:0] RAG;
	wire [2:0] throw;
	

	// Instantiate traffic module
	traffic traffictop (
	.clk (clk),
	.red (RAG[2]),
	.amber (RAG[1]),
	.green (RAG[0])
	);
	
	// Instantiate roll module
 	roll rolltop (
	.clk (clk),		
	.rst (rst),
	.button (button),
	.throw (throw)
	);

	// Instantiate multiplex module
	// when select = 1, traffic lights chosen, when select = 0, dice roll chosen
	assign result = (sel)?(RAG):(throw);

endmodule
