module ex6_top(Start, Reset, Board_clk,LED,HEX3,HEX2,HEX1,HEX0);
	input	Start,
			Reset,
			Board_clk;
	wire 	clk1k,
			en_dc,
			en_c;
			
	reg [7:0] HEX3;
					
	wire [3:0] 	BCD3,
					BCD2,
					BCD1,
					BCD0;
	wire 	[12:0]lsfr_out,
					countdown;
	wire	[11:0] cntout;
					
	output wire [9:0] LED;
	output wire [7:0] HEX3;
	output wire [6:0] HEX2,HEX1,HEX0;
	
	clk_div A0(board_clk,clk1k);
	lsfr A1 (clk1k,lsfr_out);
	down_counter A2 (lsfr_out,en_dc,clk1k,countdown);
	fsm A3 (board_clk,start,reset,countdown,LED,en_dc,en_c);
	counter_12 A4 (clk1k,reset,en_C,cntout);
	binary_to_bcd A5 (cntout,BCD3,BCD2,BCD1,BCD0);
	hex_to_7segdot A6 (BCD3,HEX3);
	hex_to_7seg A7 (BCD2,HEX2);
	hex_to_7seg A8 (BCD1,HEX1);
	hex_to_7seg A9 (BCD0,HEX0);
endmodule
	
	
	
	