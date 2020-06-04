//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
	    
	//Parameters
	parameter CLK_PERIOD = 10;

	//Registers and wires
	reg clk;
	reg sel;
	reg rst;
	reg button;
	reg [2:0] result_prev;
	wire [2:0] result;
	reg err;
    
	//Clock generation
	initial begin
		clk = 1'b0;
			forever
	 			#(CLK_PERIOD/2) clk=~clk;
	end
	
	//Decide how select will be tested (split testing into traffic(1) and dice)	
	initial begin
		sel=1;	
		rst=1;
		// traffic requires 5 clk period to complete
		#101 // If put at 50, test will be for sel=0 instead of the results on sel=1 at clock #45 instance
		sel = 0;
		#10
		rst = 0;

	end
		
	//Stimulus logic
	initial begin
		result_prev=3'b000; // start in failed state, where code should pull it into right one at 0s BEFORE clock even rises at 5s
		err=0;
		button=0;
		
		forever begin
			#CLK_PERIOD

			if (sel)
			begin
			
			
			
				if (result==3'b000||result==3'b101||result==3'b111|result==3'b011)
				begin
					$display("***TRAFFIC TEST 1 FAILED!***");
					err=1;
				end
			
				else if ((result_prev==3'b100) && (result!=3'b110))
				begin
					$display("***TRAFFIC TEST 2 FAILED!***");
					err=1;
				end

				else if ((result_prev==3'b110) && (result!=3'b001))
				begin
					$display("***TRAFFIC TEST 3 FAILED!***");
					err=1;
				end	

				else if ((result_prev==3'b001) && (result!=3'b010))
				begin
					$display("***TRAFFIC TEST 4 FAILED!***");
					err=1;
				end	
			
         			else if ((result_prev==3'b010) && (result!=3'b100))
				begin
					$display("***TRAFFIC TEST 5 FAILED!***");
					err=1;
				end

			result_prev = result;
			
			
			
			end
			

			// testbench for dice, sel =0
			else
			begin
					
					
				if (rst)
		    		begin
		        		if (result!=3'b001)
		       			begin
		            			$display("***DICE TEST 1 FAILED!***");
		            			err=1;
		        		end
		    		end
		        
		    		else if ((button) && (result_prev==3'b000||result_prev==3'b111||result_prev==3'b110))
		    		begin
		        		if (result != 3'b001)
		        		begin
		            			$display("***DICE TEST 2 FAILED!***");
		            			err=1;
		        		end
		    		end
		            
		    		else if (!button)
		    		begin
		        		if (result!=result_prev)
		        		begin
		            			$display("***DICE TEST 3 FAILED!***");
		            			err=1;
		        		end
		    		end
		    
		    	result_prev <= result;
		    	button=button+1;

			end
		end
	end

	//Finish simulation and check for success
	initial begin
		#250
		if (err==0)
			$display("***TEST PASSED! :) ***");
		$finish;
	end

	//Instantiate Multiplex of Traffic or Dice module
 	mux top (
	.rst (rst),
	.clk (clk),		
	.button (button),
	.sel (sel),
	.result (result)
	);

endmodule
