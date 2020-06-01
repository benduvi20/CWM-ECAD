//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name: Benjamin Duvieusart
// Date: 01/06/2020
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    input a,
    input b,
    input sel,
    output reg out    
    );
    
    //Todo: define registers and wires here

    //Todo: define your logic here
    always @(a or b or sel)begin
  	if (sel == 0)
	out = a;
	else 
	out = b;
    end          
      

endmodule
