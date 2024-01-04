module full_adder(A, B, C_in, C_out, sum);
	input A, B, C_in;
	output C_out, sum;
	wire sum, c1, c2, s1;
	half_adder ha1(.A(A),
						.B(B),
						.C(c1),
						.S(s1)
						);
	half_adder ha2(.A(C_in),
						.B(s1),
						.C(c2),
						.S(sum)
						);
	or o1(C_out, c1, c2);
endmodule

module half_adder(A, B, S, C);
	input A, B;
	output S, C;
	
	and a1(C, A, B);
	xor x1(S, A, B);
	
endmodule
