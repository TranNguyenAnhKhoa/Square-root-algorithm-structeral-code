module mux2to1_8bit(A1, B0, sel, C);
	input [7:0]A1, B0;
	input sel;
	output [7:0]C;
	genvar i;
	
	generate
		for(i=7; i>=0; i=i-1) begin: block1
			mux2to1 m1( .A(A1[i]),
							.B(B0[i]),
							.sel(sel),
							.C(C[i])
						);
		end
	endgenerate
	
endmodule

module mux2to1 (A, B, sel, C);
	input A, B, sel;
	output C;
	wire and1, and2, not1;
	
	not n1(not1, sel);
	and a1(and1, A, sel);
	and a2(and2, B, not1);
	or o1(C, and1, and2);
endmodule