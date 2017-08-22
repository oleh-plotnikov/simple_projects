`timescale 1 ns / 1 ps 
module comparator (a, b, equal, greater, lower);

parameter WIDTH = 8;

input [WIDTH - 1:0] a, b;
output reg equal, greater, lower;
wire [WIDTH:0] tmp;

assign tmp = a - b;

always @(tmp) begin
	equal = 0;
	greater = 0;
	lower = 0;
	if(!tmp) begin
		equal = 1;
	end else if (tmp[WIDTH]) begin
		lower =1;
	end else begin
		greater = 1;
	end
end
endmodule
