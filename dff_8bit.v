module dff_8bit(Q, D, clk);
	input [7:0] D;
	input clk;
	output [7:0] Q;
	genvar i;
	
	generate
		for(i=7; i>=0; i=i-1) begin: block1
			d_ff df1 (.Q(Q[i]),
						 .D(D[i]),
						 .clk(clk)
						);
		end
	endgenerate
	
endmodule
