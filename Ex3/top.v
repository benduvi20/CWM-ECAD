//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    input clk,
    input rst,
    input enable,
    input direction, 
    output reg [7:0] counter_out
    );
                    
    //Todo: add registers and wires, if needed
    reg [7:0] counter;
	
always @(posedge clk) begin
	if (rst == 1)
		counter[0]
	if (enable == 0)
		counter
	if (direction == 1)
		counter <= counter + 4'd1; 
	else 
		counter <= counter - 4'd1; 
	end 
assign counter_out = counter
      
endmodule
