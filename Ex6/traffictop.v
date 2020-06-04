`timescale 1ns / 100ps

module traffic(
    	input clk,
    	output red,
    	output amber,
    	output green);

	reg [2:0] RAG;
	
	assign red = RAG[2];
	assign amber = RAG[1];
	assign green = RAG[0];
	
	always@(posedge clk)
		
		if (RAG==3'b100)	//red to red+amber
			RAG<=3'b110; 

		else if (RAG==3'b110) 	//red+amber to green
			RAG<=3'b001;

		else if (RAG==3'b001) 	//green to amber
			RAG<=3'b010;

		else 			//amber to red
			RAG<=3'b100;
		
endmodule
