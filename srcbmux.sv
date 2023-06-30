module srcbmux #(parameter N = 32)
		(input logic [N-1:0] writedata, signimm,
		input logic aluSrc,
		output logic [N-1:0] srcb);

assign srcb = (aluSrc) ? signimm : writedata;

endmodule
