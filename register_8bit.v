module register_8bit(I, Q, en, clk);
	input [7:0] I;
	input en, clk;
	output [7:0] Q;
	genvar i;
	
	generate
		for(i=7; i>=0; i=i-1) begin: block1
			d_ffe dfe1(	.D(I[i]),
							.enable(en),
							.clk(clk),
							.Q(Q[i])
							);
		end
	endgenerate
endmodule
