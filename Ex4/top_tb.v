//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Benjamin Duvieusart
// Date: 03/06/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

    parameter CLK_PERIOD = 10;

	reg clk, rst, button, err;
	wire [2:0] throw;
	
    initial begin
    clk = 0;
    forever
	if (throw == 3'd7)
		err = 1
        #(CLK_PERIOD/2) clk = ~clk;
    end
    
    initial 
	begin
    	rst = 1;
    	button = 1;
    	count = 1;
    	err = 0;
    	forever 
    	    rst <= 0;
            #10
       	    button = 0;
            #20
            rst = 1;
        end
    
    initial begin
    	#50
    	if (err)
    		$display("***TEST FAILED!***");
    	else
    		$display("***TEST PASSED!***"); 
    end



     //The instantiation of the user's module
     roll top (
     .rst (rst),
     .button (button),
     .clk (clk),
     .throw (throw)
     );
     

     
endmodule
