module binary_to_bcd (biner,ribuan,ratusan,puluhan,satuan);

	input [11:0] biner;
	
	output reg [3:0] 	ribuan,
							ratusan,
							puluhan,
							satuan;
	
						
	integer i;
	always @ (biner)
	begin
		ribuan=4'd0;
		ratusan=4'd0;
		puluhan=4'd0;
		satuan=4'd0;
		
		for (i=11; i>=0; i=i-1) begin
			if (ribuan >=5)
				ribuan=ribuan+3;
			if	(ratusan >=5)
				ratusan = ratusan+3;
			if (puluhan >=5)
				puluhan=puluhan+3;
			if	(satuan >=5)
				satuan = satuan+3;
			
			ribuan = ribuan << 1;
			ribuan[0]=ratusan[3];
			ratusan = ratusan << 1;
			ratusan[0] =puluhan[3];
			puluhan = puluhan <<1;
			puluhan[0] = satuan[3];
			satuan = satuan << 1;
			satuan[0] =biner[i];
			
		end
	end

endmodule