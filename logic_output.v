module logic_output(Q, en_R1, en_R2, en_R3, en_R4, en_R5, bus1, bus2, bus3, bus4, bus5, bus6, bus7, sel_AU1, sel_AU2, Done);
//port
	input [3:0]Q;
	// enable register
	output en_R1, en_R2, en_R3, en_R4, en_R5;
	// enable bus
	output bus1, bus6;
	output [1:0] bus2, bus3, bus4, bus5, bus7;
	// Done
	output Done;
	// select AU function
	output [1:0] sel_AU1, sel_AU2;
	
	wire nQ3, nQ2, nQ1, nQ0;
	wire and1, and2, and3 ,and4, and5, and6, and7 ,and8, and9, and10,
		  and11, and12, and13 ,and14, and15, and16, and17 ,and18, and19, and20,
		  and21, and22, and23 ,and24, and25, and26, and27 ,and28, and29, and30,
		  and31, and32, and33 ,and34, and35, and36, and37 ,and38, and39, and40,
		  and41, and42, and43 ,and44, and45, and46, and47;
	
	not n3(nQ3, Q[3]);
	not n2(nQ2, Q[2]);
	not n1(nQ1, Q[1]);
	not n0(nQ0, Q[0]);
	
	// en_R1
	and a1(and1, nQ3, nQ2, nQ0);
	and a2(and2, Q[2], Q[1], Q[0]);
	and a3(and3, Q[3], nQ2, nQ1, Q[0]);
	or o1(en_R1, and1, and2, and3);
	
	// en_R2
	and a4(and4, nQ3, Q[1], Q[0]);
	and a5(and5, Q[3], Q[1], nQ0);
	and a6(and6, nQ3, nQ2, nQ1, nQ0);
	or o2(en_R2, and4, and5, and6);
	
	// en_R3
	and a7(and7, Q[3], nQ0);
	and a8(and8, Q[3], Q[2]);
	and a9(and9, Q[2], Q[1], nQ0);
	or o3(en_R3, and7, and8, and9);
	
	// en_R4
	and a10(and10, Q[3], Q[2], Q[0]);
	or o4(en_R4, and9, and10);
	
	// en_R5
	and a12(and12, Q[3], Q[2], nQ0);
	and a13(and13, nQ3, Q[2], nQ1, Q[0]);
	or o5(en_R5, and12, and13);
	
	// bus1
	and a14(and14, nQ3, Q[2], nQ1);
	and a15(and15, Q[2], nQ1, nQ0);
	and a16(and16, Q[3], Q[1], Q[0]);
	or o6(bus1, and14, and15, and16);
	
	//bus2[1:0]
	and a17(and17, nQ3, nQ2, nQ1, Q[0]);
	and a18(and18, Q[3], nQ2, nQ1, nQ0);
	or o7(bus2[1], and17, and18); // bus2[1]
	
	and a19(and19, nQ3, Q[2], nQ1);
	and a20(and20, Q[2], nQ1, nQ0);
	and a21(and21, Q[3], nQ2, Q[0]);
	and a22(and22, nQ3, nQ2, Q[1], nQ0);
	or o8(bus2[0], and19, and20, and21, and22); //bus2[0]
	
	//bus3[1:0]
	and a23(and23, Q[2], Q[1], Q[0]);
	or o9(bus3[1], and23, and6); //bus3[1]
	
	and a24(and24, nQ2, nQ1, Q[0]);
	and a25(and25, Q[3], nQ2, nQ1);
	and a26(and26, nQ3, nQ2, Q[1], nQ0);
	or o10(bus3[0], and24, and25, and26); //bus3[0]
	
	//bus4[1:0]
	or o11(bus4[1], and23, and6); //bus4[1]
	
	and a27(and27, nQ3, nQ2, Q[1]);
	and a28(and28, nQ2, Q[1], nQ0);
	and a29(and29, Q[3], nQ2, nQ1, Q[0]);
	or o12(bus4[0], and27, and28 ,and29); //bus4[0]
	
	//bus5[1:0]
	and a30(and30, Q[3], nQ1, nQ0);
	and a31(and31, Q[3], Q[1], Q[0]);
	or o13(bus5[1], and30, and23, and31); //bus5[1]
	
	and a32(and32, Q[3], Q[1], nQ0);
	and a33(and33, Q[3], nQ2, nQ1, Q[0]);
	or o14(bus5[0], and32, and33); //bus5[0]
	
	//bus6
	and a34(and34, Q[3], nQ2);
	and a35(and35, Q[3], nQ0);
	or o15(bus6, and34, and35, and23);
	
	//bus7
	and a36(and36, Q[2], Q[1], nQ0);
	and a37(and37, Q[3], Q[2], Q[0]);
	or o16(bus7[1], and36, and37); // bus7[1]
	

	and a38(and38, Q[3], nQ2);
	and a39(and39, Q[3], nQ0);
	or o17(bus7[0], and38, and39, and23); //bus7[0]
	
	//sel_AU1[1:0]
	and a40(and40, Q[1], Q[0]);
	and a41(and41, nQ3, Q[2]);
	and a42(and42, Q[2], nQ0);
	or o18(sel_AU1[1], and40, and41, and42); //sel_AU1[1]
	
	and a43(and43, nQ3, Q[2], Q[0]);
	and a44(and44, Q[3], Q[2], nQ0);
	or o19(sel_AU1[0], and43, and44); //sel_AU1[0]
	
	//sel_AU2[1:0]
	buf b5(sel_AU2[1], Q[1]);
	and a46(sel_AU2[0], nQ2, Q[1]);
	
	//Done
	and a47(Done, Q[3], Q[2], Q[0]);
	
endmodule
