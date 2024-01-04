module FA_8bit(A, B, C_in, C_out, sum);
	input [7:0] A, B;
	input C_in;
	output [7:0] sum;
	output C_out;
	wire [6:0] carry;
	
	full_adder fa7(.A(A[7]),
						.B(B[7]),
						.C_in(carry[6]),
						.C_out(C_out),
						.sum(sum[7])
						);
	full_adder fa6(.A(A[6]),
						.B(B[6]),
						.C_in(carry[5]),
						.C_out(carry[6]),
						.sum(sum[6])
						);
	full_adder fa5(.A(A[5]),
						.B(B[5]),
						.C_in(carry[4]),
						.C_out(carry[5]),
						.sum(sum[5])
						);
	full_adder fa4(.A(A[4]),
						.B(B[4]),
						.C_in(carry[3]),
						.C_out(carry[4]),
						.sum(sum[4])
						);
	full_adder fa3(.A(A[3]),
						.B(B[3]),
						.C_in(carry[2]),
						.C_out(carry[3]),
						.sum(sum[3])
						);
	full_adder fa2(.A(A[2]),
						.B(B[2]),
						.C_in(carry[1]),
						.C_out(carry[2]),
						.sum(sum[2])
						);
	full_adder fa1(.A(A[1]),
						.B(B[1]),
						.C_in(carry[0]),
						.C_out(carry[1]),
						.sum(sum[1])
						);
	full_adder fa0(.A(A[0]),
						.B(B[0]),
						.C_in(C_in),
						.C_out(carry[0]),
						.sum(sum[0])
						);

endmodule
