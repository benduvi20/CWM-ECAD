`timescale 1ns / 100ps

module roll(
    //ports 
    input rst,
    input button,
    input clk,
    output reg [2:0] throw );

	//logic
	always@(posedge clk)begin

		if (rst || throw == 3'b00 || throw == 3'b111)
 		 	throw <= 3'b001;

		else if (button && throw == 3'b110)
			throw <= 3'b001;
	
		else if (button && throw !== 3'b110)
			throw <= throw + 1;	
		  
		else 
			throw <= throw;
	end
endmodule
