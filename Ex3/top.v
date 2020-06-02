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
    //Todo: add ports 
    input rst,
    input enable,
    input direction,
    input clk,
    output [7:0] counter_out
    );               
    //Todo: add registers and wires, if needed
    reg [7:0] counter;

//<<<<<<< HEAD
    //Todo: add user logic
    assign counter_out = counter;
	  
    always@(posedge clk or posedge rst)
	counter <= rst?0:(enable?(direction?(counter+1):(counter-1)):counter);			  
	// check reset, then enable, then direction

/*=======
    initial begin
	    counter = 8'd0
    end
	
    always @(posedge clk or posedge rst) begin
	if (rst == 1)
		counter <= 8'd0
	else if (enable == 0)
		counter <= counter
	else if (direction == 1)
		counter <= counter + 8'd1; 
	else 
		counter <= counter - 8'd1; 
    end 
	
assign counter_out = counter
      
>>>>>>> f2dc1069d9e51d71f4787bf4d5fd4b09125f6751*/
endmodule
