// add/sub/max
module AU2_2Stage(A, B, sel, clk, out);
	input [7:0] A, B;
	input [1:0] sel;
	input clk;
	output [7:0] out;
	genvar i;
	wire [7:0] B_xor, fa_out, sum_mux, a_mux, b_mux, mux1_mux2;
	wire nSel1, nSel0, and1, or1, nSum7;
	wire [3:0] out_df;
	
	not n2(nSel1, sel[1]);
	not n3(nSel0, sel[0]);
	not n4(nSum7, sum_mux[7]);
	or o1(or1, nSum7, out_df[3], out_df[2]);
	and a1(and1, out_df[1], out_df[0]);
	
	generate
	for(i=7; i>=0; i=i-1) begin: xor1
		xor x1(B_xor[i], B[i], sel[1]);
	end
	endgenerate
	
	FA_8bit fa1(.A(A[7:0]),
					.B(B_xor[7:0]),
					.C_in(sel[1]),
					.sum(fa_out[7:0])
					);
	dff_8bit df1(.D(fa_out[7:0]),
					 .Q(sum_mux[7:0]),
					 .clk(clk)
					);
	dff_8bit df2(.D(A[7:0]),
					 .Q(a_mux[7:0]),
					 .clk(clk)
					);
	dff_8bit df3(.D(B[7:0]),
					 .Q(b_mux[7:0]),
					 .clk(clk)
					);
	mux2to1_8bit m1(.A1(a_mux[7:0]), 
						 .B0(sum_mux[7:0]),
						 .sel(and1),
						 .C(mux1_mux2[7:0])
						);
	mux2to1_8bit m2(.A1(mux1_mux2[7:0]),
						 .B0(b_mux[7:0]),
						 .sel(or1),
						 .C(out[7:0])
						);
	d_ff df_sel0(.D(sel[0]),
					 .Q(out_df[0]),
					 .clk(clk)
					);
	d_ff df_sel1(.D(sel[1]),
					 .Q(out_df[1]),
					 .clk(clk)
					);
	d_ff df_sel2(.D(nSel0),
					 .Q(out_df[3]),
					 .clk(clk)
					);
	d_ff df_sel3(.D(nSel1),
					 .Q(out_df[2]),
					 .clk(clk)
					);
endmodule
