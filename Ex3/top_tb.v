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

//<<<<<<< HEAD
//Todo: Registers and wires
    reg clk;
    reg rst;
    reg direction;
    reg enable;
    reg err;
    wire [7:0] counter_out;
//=======
//parameter CLK_PERIOD = 5;

//Todo: Regitsers and wires
//>>>>>>> f2dc1069d9e51d71f4787bf4d5fd4b09125f6751

reg clk;
reg err;
reg rst;
reg dir;
reg enable;
reg [7:0] maxCount;


//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

initial begin 
	clk = 1'b0;
	forever begin
		#(CLK_PERIOD / 2) clk = ~clk;
	end
end

//Todo: User logic
<<<<<<< HEAD
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

=======
initial begin
	err = 0;
	rst = 0;	
	dir = 1;
	enable = 1;

	#30
	maxCount <= counter_out
	dir <= 0; // count down
	
	#40
	if maxCount < counter_out
		err = 1;
	enable = 0;
	#45
	rst = 1;
	
end

initial begin
	#50
	if (!err)
		$display("No errors recorded");
    
	$finish; //finish after 50 ticks
end 


counter count(
	.clk(clk),
	.rst(rst),
	.direction(dir),
	.enable(enable)
	);

 
>>>>>>> f2dc1069d9e51d71f4787bf4d5fd4b09125f6751
endmodule 
