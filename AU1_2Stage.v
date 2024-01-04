// abs/min/max
module AU1_2Stage(A, B, sel, clk, out);
	input [7:0] A, B;
	input [1:0] sel;
	input clk;
	output [7:0] out;
	wire [7:0] and1;
	wire [7:0] nB;
	wire [7:0] b_m2, fa_df, a_m1, fa_m1, m1_m2;
	genvar i;
	wire [3:0] out_df;
	wire nSel1, nSel0, nS7, and2, and3, and4, or1;
	
	not n2(nSel1, sel[1]);
	not n3(nSel0, sel[0]);
	not n4(nS7, fa_m1[7]);
	generate
		for(i=7; i>=0; i=i-1) begin: blockand1
			and a1(and1[i], A[i], sel[1]);
		end
	endgenerate

	generate
		for(i=7; i>=0; i=i-1) begin: blocknot1
			not n1(nB[i], B[i]);
		end
	endgenerate

	FA_8bit fa1(.A(and1[7:0]),
					.B(nB[7:0]),
					.C_in(1'b1),
					.sum(fa_df[7:0])
					);
	dff_8bit df_a(.D(A[7:0]),
					  .Q(a_m1[7:0]),
					  .clk(clk)
					);
	dff_8bit df_b(.D(B[7:0]),
					  .Q(b_m2[7:0]),
					  .clk(clk)
					);
	dff_8bit df_sum(.D(fa_df[7:0]),
						 .Q(fa_m1[7:0]),
						 .clk(clk)
					);
	mux2to1_8bit m1(.A1(a_m1[7:0]),
						 .B0(fa_m1[7:0]),
						 .sel(out_df[1]),
						 .C(m1_m2[7:0])
						);
	mux2to1_8bit m2(.A1(m1_m2[7:0]),
						 .B0(b_m2[7:0]),
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
					 .Q(out_df[2]),
					 .clk(clk)
					);
	d_ff df_sel3(.D(nSel1),
					 .Q(out_df[3]),
					 .clk(clk)
					);

	and a2(and2, nS7, out_df[3]);
	and a3(and3, out_df[0], nS7);
	and a4(and4, out_df[1], out_df[2], fa_m1[7]);
	or o1(or1, and2, and3, and4);
	
endmodule
