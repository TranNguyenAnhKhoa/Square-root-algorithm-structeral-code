module bufif1_8bit(out, in, en);
//port
	input [7:0] in;
	input en;
	output [7:0] out;
	genvar i;
//logic
	generate
		for(i=7; i>=0; i=i-1) begin: buf1
			bufif1 b(out[i], in[i], en);
		end
	endgenerate
endmodule
