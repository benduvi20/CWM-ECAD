//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
    parameter CLK_PERIOD = 10; //sets clock period, of 10 time units
    parameter TEST_PERIOD = 600; //in terms of time period, how long will the counter run for

//Todo: Registers and wires
    reg clk;
    reg rst;
    reg direction;
    reg enable;
    reg err;
    wire [7:0] counter_out;

//Todo: Clock generation

initial begin 
	clk = 1'b0;
	forever begin
		#(CLK_PERIOD / 2) clk = ~clk;
	end
end

//Todo: User logic

    initial
    begin
    	rst=1; //reset counter to start
    	direction = 1;
	enable = 1;
	err = 0;

	#1 rst=0; //rst to zero so it works
	
	#(TEST_PERIOD/2) direction = 0; //swaps direction halfway through
	if(counter_out==(TEST_PERIOD/2)/(CLK_PERIOD)) //checks it goes up to max value
	    err = 0;
	else
	    err = 1;
    end

//Todo: Finish test, check for success
    initial
    begin
    	#TEST_PERIOD 
		if(counter_out != 0) //checks it gets back to zero, otherwise error
		begin
	    	err = 1;
		end
		
	//Run success/failure check
		if(err==1) begin	
	    	$display("***TEST FAILED!***");
		end
		else begin
	    	$display("***TEST SUCCESS!***");
		end

    	$finish;
    end

//Todo: Instantiate counter module
    counter top(
	.rst (rst),
	.enable (enable),
	.direction (direction),
	.clk (clk),
	.counter_out (counter_out[7:0])
	);

endmodule 
