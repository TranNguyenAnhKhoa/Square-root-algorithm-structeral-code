module shift3right_8bit(I, O);
	input [7:0] I;
	output [7:0] O;
	genvar i;
	
	generate 
		for(i=7; i>=3; i=i-1) begin: block1 
			buf b1(O[i-3], I[i]);
		end
	endgenerate
	and a1(O[7], I[2], 1'b0);
	and a2(O[6], I[1], 1'b0);
	and a3(O[5], I[0], 1'b0);
	
endmodule
