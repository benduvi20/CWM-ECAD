//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name: Benjamin Duvieusart
// Date: 04/06/2020
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module times_table_taster();

	parameter CLK_PERIOD = 10;
	reg clk;
	reg read;
	reg [2:0] a;
	reg [2:0] b;
	wire [4:0] result;
	
	// clock
    initial begin
    clk = 0;
    forever
        #(CLK_PERIOD/2) clk = ~clk;
    end
	

	//NEED TO TEST

	times_tables top(
		.clk(clk), 
		.a(a), 
		.b(b), 
		.read(read), 
		.result(result));
	
endmodule
