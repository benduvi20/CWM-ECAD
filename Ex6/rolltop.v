`timescale 1ns / 100ps

module roll(
    //ports 
    input rst,
    input button,
    input clk,
    output reg [2:0] throw );

	//logic
	always@(posedge clk or posedge rst)
		if (rst)
			throw <= 3'b000
	
		else if(throw == 3'b000 | throw == 3'b111) 
			throw <= 3'b001;
 		 
		else if (button) 
		begin
			if (throw == 3'b110)
			throw <= 3'b001
	
			else
			throw <= throw + 1;	
		 end 
		else 

			
endmodule
