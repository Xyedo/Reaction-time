module counter_12 (clk,clear,enable,cntout);

	input clk,clear,enable;
	output [11:0]cntout;
	reg [11:0] cnt; 

	always @ (posedge clk) begin 
		if(!clear)
			cnt = 11'b0;
		else if (enable)
			cnt = cnt + 1'b1;
	end
	assign cntout = cnt;

endmodule
