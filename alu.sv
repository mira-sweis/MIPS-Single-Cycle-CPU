module alu(	input logic [31:0] a, b,
		input logic [2:0] f,
		output logic [31:0] y,
		output logic zero);

logic [32:0] a_unsigned, b_unsigned;

logic [31:0] sub, add, less_than, an, orr, less_than_u;
// zero fill a and b for unsigned comparison
assign a_unsigned = {1'b0, a};
assign b_unsigned = {1'b0, b};

assign sub = a - b;
assign add = a + b;
assign less_than = ($signed(a) < $signed(b));
assign less_than_u = (a_unsigned < b_unsigned);
assign orr = a|b;
assign an = a&b;

always_comb begin
	case(f)
		3'b010: y = add;
		3'b110: y = sub;
		3'b000: y = an;
		3'b001: y = orr;
		3'b111: y = less_than;
		3'b011: y = less_than_u;
		default: y = add;
	endcase
end

assign zero = (sub == 0) ? 1 : 0;

endmodule
