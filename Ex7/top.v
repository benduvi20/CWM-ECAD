//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name: Benjamin Duvieusart
// Date: 05/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module times_tables(
	input clk,
	input [2:0] a,
	input [2:0] b,	
	input read,
	output [5:0] result
	);

	wire [5:0] ab;
	assign ab = {a[2:0],b[2:0]};

mem_blk your_instance_name (
  .clka(clk),    // input wire clka
  .ena(read),      // input wire ena
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(ab),  // input wire [5 : 0] addra
  .dina(6'b000000),    // input wire [5 : 0] dina
  .douta(result)  // output wire [5 : 0] douta
);


endmodule
