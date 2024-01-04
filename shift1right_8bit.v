module shift1right_8bit(I, O);
	input [7:0] I;
	output [7:0] O;
	genvar i;
	
	generate 
		for(i=7; i>=1; i=i-1) begin: block1 
			buf b1(O[i-1], I[i]);
		end
	endgenerate
	and a1(O[7], 1'b0, I[0]);
	
	
endmodule