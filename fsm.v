module fsm(clk,start,Reset,countdown, LED,en_dc,en_c);
	input clk,
			start,
			Reset;
	input [11:0]countdown;
	
	output reg 	[9:0] LED = 10'b0;
	output reg  en_dc=1'b0,
					en_c=1'b0;
	
	reg [2:0] 	state,
					NextState;
	
	localparam 	idle = 2'b00,
					random =2'b01,
					timing =2'b10,
					final =2'b11;
	// Next State
	always @ (negedge start) 
	begin
		case (state)
			idle : 	if(!start) begin
							NextState=random;
							LED=10'b0;
						end
						else	begin
							NextState=idle;
							LED=10'b0;
						end
			random : if(countdown==0) begin
							NextState=timing;
							LED=10'b1111111111;
						end
						else	if(!start) begin
							NextState=random;
							LED=10'b0;
						end
			timing:	if(start) begin
							NextState=final;
							LED=10'b0;
						end
						else	begin
							NextState=timing;
							LED=10'b1111111111;
						end
			final :	NextState=final;
		endcase
	end
	
	always @ (negedge Reset, posedge clk) 
	begin
		if (!Reset)
			state=idle;
		else
			state=NextState;
	end

		
	always@(negedge start, negedge Reset)
		begin
			case (state)
				random : begin
							en_dc = 1'b1;
							en_c = 1'b0;
							end
				timing : begin
							en_c  = 1'b1;
							end
				final	: begin
							en_c = 1'b0;
							end
				default :begin
							en_c = 1'b0;
							en_dc = 1'b0;
							end
			endcase
		end
endmodule
