module hex_to_7segdot (SW,HEX0);
	
	input		[3:0] SW;
	output	[7:0] HEX0;
	
	reg		[6:0] HEX0;
	
	always @(*)
		case (SW)
		4'h0 : HEX0 = 8'b11000000;
		4'h1 : HEX0 = 8'b11111001;
		4'h2 : HEX0 = 8'b10100100;
		4'h3 : HEX0 = 8'b10110000;
		4'h4 : HEX0 = 8'b10011001;
		4'h5 : HEX0 = 8'b10010010;
		4'h6 : HEX0 = 8'b10000010;
		4'h7 : HEX0 = 8'b11111000;
		4'h8 : HEX0 = 8'b10000000;
		4'h9 : HEX0 = 8'b10011000;
		4'ha : HEX0 = 8'b10001000;
		4'hb : HEX0 = 8'b10000011;
		4'hc : HEX0 = 8'b11000110;
		4'hd : HEX0 = 8'b10100001;
		4'he : HEX0 = 8'b10000110;
		4'hf : HEX0 = 8'b10001110;
		endcase
endmodule
		