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
    output out    
    );
    
    //Todo: define registers and wires here
    wire T1, T2, selbar;

    //Todo: define your logic here
    not (selbar,sel);
    and (T1,a,selbar);
    and (T2,b,sel);
    or (out,T1,T2);                
      
endmodule
