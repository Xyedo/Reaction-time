module clk_div(clk50M, clk1k);
	input clk50M;
	output reg clk1k;
	
	reg [27:0] count=28'b0;
	parameter pembagi = 28'd50000;
	
	always @ (posedge clk50M) begin
		count = count +1'b1;
		if (count >=(pembagi-1))
			count = 28'd0;
		clk1k = (count < pembagi/2)? 1'b1:1'b0;
		end
endmodule
