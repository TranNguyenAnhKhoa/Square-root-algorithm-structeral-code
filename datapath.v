module datapath(clk, i1, i2, en_R1, en_R2, en_R3, en_R4, en_R5, b1, b2, b3, b4, b5, b6, b7, sel_AU1, sel_AU2, Done, result);
//port
	input [7:0] i1, i2;
	// enable register
	input en_R1, en_R2, en_R3, en_R4, en_R5;
	// tristate
	input b1, b6;
	input [1:0] b2, b3, b4, b5, b7;
	// Done
	input clk, Done;
	// select AU function
	input [1:0] sel_AU1, sel_AU2;
	//result
	output [7:0] result;
	// bus
	wire [7:0] bus1, bus2, bus3, bus4, bus5, bus6, bus7;
	wire [7:0] R1_out, R2_out, R3_out, R4_out, R5_out,
				AU1_out, AU2_out, shift1_out, shift3_out;
	
	
	// ******** bus 1 ************
	bufif1_8bit bu1(.out(bus1[7:0]), 
						 .in(R1_out[7:0]), 
						 .en(b1)
						);
	register_8bit R1(	.I(bus3[7:0]),
							.Q(R1_out[7:0]),
							.clk(clk),
							.en(en_R1)
						);
	
	// ******** bus 2 ************
	bufif1_8bit bu2_1(.out(bus2[7:0]), 
							.in(R1_out[7:0]), 
							.en(b2[1])
							);
	bufif1_8bit bu2_0(.out(bus2[7:0]), 
							.in(R2_out[7:0]), 
							.en(b2[0])
							);
	register_8bit R2(	.I(bus4[7:0]),
							.Q(R2_out[7:0]),
							.clk(clk),
							.en(en_R2)
						);

	shift3right_8bit sr3( .I(AU1_out[7:0]),
								 .O(shift3_out[7:0])
						);
	shift1right_8bit sr1( .I(AU1_out[7:0]),
								 .O(shift1_out[7:0])
						);
	// ******** bus 3 ************
	bufif1_8bit bu3_1(.out(bus3[7:0]), 
							.in(i1[7:0]), 
							.en(b3[1])
							);
	bufif1_8bit bu3_0(.out(bus3[7:0]), 
							.in(AU1_out[7:0]), 
							.en(b3[0])
							);
	AU1_2Stage AU1(.A(bus1[7:0]), 
						.B(bus2[7:0]), 
						.sel(sel_AU1[1:0]), 
						.clk(clk), 
						.out(AU1_out[7:0])
						);
	
	// ******** bus 4 ************
	bufif1_8bit bu4_1(.out(bus4[7:0]), 
							.in(i2[7:0]), 
							.en(b4[1])
							);
	bufif1_8bit bu4_0(.out(bus4[7:0]), 
							.in(AU1_out[7:0]), 
							.en(b4[0])
							);
	
	
	// ******** bus 5 ************
	bufif1_8bit bu5_1(.out(bus5[7:0]), 
							.in(R4_out[7:0]), 
							.en(b5[1])
							);
	bufif1_8bit bu5_0(.out(bus5[7:0]), 
							.in(R5_out[7:0]), 
							.en(b5[0])
							);
	register_8bit R4(	.I(AU1_out[7:0]),
							.Q(R4_out[7:0]),
							.clk(clk),
							.en(en_R4)
						);
	register_8bit R5(	.I(shift1_out[7:0]),
							.Q(R5_out[7:0]),
							.clk(clk),
							.en(en_R5)
						);
	
	// ******** bus 6 ************
	bufif1_8bit bu6(	.out(bus6[7:0]), 
							.in(R3_out[7:0]), 
							.en(b6)
						);
	register_8bit R3(	.I(bus7[7:0]),
							.Q(R3_out[7:0]),
							.clk(clk),
							.en(en_R3)
						);

	// ******** bus 7 ************
	bufif1_8bit bu7_1(.out(bus7[7:0]),
							.in(shift3_out[7:0]), 
							.en(b7[1])
							);
	bufif1_8bit bu7_0(.out(bus7[7:0]), 
							.in(AU2_out[7:0]), 
							.en(b7[0])
							);
	AU2_2Stage AU2(.A(bus5[7:0]), 
						.B(bus6[7:0]), 
						.sel(sel_AU2[1:0]), 
						.clk(clk), 
						.out(AU2_out[7:0])
						);
	// ******** Done **************
	bufif1_8bit D(	.out(result[7:0]), 
						.in(R3_out[7:0]), 
						.en(Done)
						);

endmodule
