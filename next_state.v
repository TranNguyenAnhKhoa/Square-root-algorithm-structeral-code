module next_state(Start, Q, D);
	input Start;
	input [3:0] Q;
	output [3:0] D;
	wire nQ2, nQ1, nQ0;
	wire and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13;
// port not
	not n3(nQ2, Q[2]);
	not n2(nQ1, Q[1]);
	not n1(nQ0, Q[0]);
// D3	
	and a1(and1, Q[3], nQ2);
	and a2(and2, Q[3], nQ0);
	and a3(and3, Q[2], Q[1], Q[0]);
	or o1(D[3], and1, and2, and3);
// D2	
	and a4(and4, Q[2], nQ1);
	and a5(and5, Q[2], nQ0);
	and a6(and6, nQ2, Q[1], Q[0]);
	or o2(D[2], and4, and5, and6);
// D1
	and a7(and7, nQ1, Q[0]);
	and a8(and8, Q[1], nQ0);
	or o3(D[1], and7, and8);
// D0
	and a9(and9, nQ0, Start);
	and a10(and10, Q[1], nQ0);
	and a11(and11, Q[2], nQ0);
	and a12(and12, Q[3], nQ0);
	and a13(and13, Q[3], Q[2]);
	or o4(D[0], and9, and10, and11, and12, and13);
	
	
endmodule
	