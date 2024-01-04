module asyn_dff_en(D, clk, En, Q, PR, CLR);
	input D, clk, En;
	output Q, PR, CLR;
	wire and1,and2,enb,or1;
	
	asyn_dff d1(.d(or1),
					.clk(clk), 
					.q(Q), 
					.pr(PR), 
					.clr(CLR)
				);
	
	and a1(and1, D, En);
	not n1(enb, En);
	and n2(and2, enb, Q);
	or o1(or1, and1, and2);
	
endmodule

module asyn_dff(d, clk, q, pr, clr);
	input d, clk, pr, clr;
	output q;
	wire and1,and2,and3,and4,or1,or2,or3,or4,pr_not,d_not,clk_not,clr_not,or1_not,or2_not,or3_not,or4_not;
	
	and a1(and1,d,clr,clk_not);
	and a2(and2,pr,clk_not,d_not);
	and a3(and3,or1,clk);
	and a4(and4,clk,or2);
	
	or o1(or1,pr_not,and1,or2_not);
	or o2(or2,or1_not,and2,clr_not);
	or o3(or3,pr_not,and3,or4_not);
	or o4(or4,or3_not,and4,clr_not);
	
	not n1(pr_not,pr);
	not n2(d_not,d);
	not n3(clk_not,clk);
	not n4(clr_not,clr);
	not n5(or1_not,or1);
	not n6(or2_not,or2);
	not n7(or3_not,or3);
	not n8(or4_not,or4);
	
	buf(q,or3);
	
endmodule