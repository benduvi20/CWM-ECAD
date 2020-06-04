//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Benjamin Duvieusart
// Date: 03/06/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
	//Todo: Parameters
	parameter CLK_PERIOD = 10;

	//Todo: Regitsers and wires
	reg clk;
	reg rst;
	reg button;
	reg err;
	reg [2:0] throw_before;
	wire [2:0] throw;

	//Todo: Clock generation
	initial begin
		clk = 1'b0;
		forever
			#(CLK_PERIOD/2) clk=~clk;
	end

    
	//Todo: User logic
	

	initial begin
		rst=1; // start with reset to initiate
		#10
		rst <= 0;
		#50
		rst <= 1;
		#52
		rst <= 0;
	end
	
	initial begin
		
		button=1'b0;
		err=0;
		throw_before=3'b000; // start with reset
	    
		forever begin
		    #CLK_PERIOD
		        
		    if (rst)
		    begin
		        if (throw!=3'b001)
		        begin
		            $display("***TEST 1 FAILED!***");
		            err=1;
		        end
		    end
		        
		    else if ((button) && (throw_before==3'b000||throw_before==3'b111||throw_before==3'b110))
		    begin
		        if (throw != 3'b001)
		        begin
		            $display("***TEST 2 FAILED!***");
		            err=1;
		        end
		    end
		            
		    else if (!button)
		    begin
		        if (throw!=throw_before)
		        begin
		            $display("***TEST 3 FAILED!***");
		            err=1;
		        end
		    end
		    
		    throw_before <= throw;
		    button=button+1;

		end
	end
	
	//Todo: Finish test, check for success
	initial begin
		#250
		if (err==0)
			$display("***TEST PASSED! :) ***");
		$finish;
	end

	//Todo: Instantiate counter module
 	roll top (
	.clk (clk),		
	.rst (rst),
	.button (button),
	.throw (throw)
	);

endmodule 
