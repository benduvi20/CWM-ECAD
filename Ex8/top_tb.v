//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name: Benjamin Duvieusart
// Date: 05/06/202
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name: Benjamin Duvieusart
// Date: 04/06/2020
//
// Description: A testbench module to test Ex7 - Times Table
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
	reg err;
	reg [2:0] a;	
	reg [2:0] b;
	reg read;
	wire [5:0] result;
	
	//Todo: Clock generation
	initial	begin
  		clk = 1'b0;
  		forever
  			#(CLK_PERIOD/2) clk=~clk;
  	end

	//Todo: User logic
	initial begin
		a=0;
		b=0;		
		rst = 1;
		read = 1;
		err=0;

		forever begin
			
			#CLK_PERIOD
			if (read && a*b!=result)
				begin
					$display("***TEST FAILED!,wrong calculation***");
					err=1;
				end
			
			a = a+1;
			if (a==0)
				b = b+1;
		end
	end
	
	//Todo: Finish test, check for success
	initial begin
        	#640
        	if (err==0)
          		$display("***TEST PASSED! :) ***");
		$finish;
	end


	//Todo: Instantiate times tables module
	times_tables top (
		.clk (clk),
		.rst (rst),
		.a (a),
		.b (b),
		.read (read),
		.result (result)
	);
	
endmodule  
