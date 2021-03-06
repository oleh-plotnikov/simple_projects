`timescale 1ns / 1ps
module comparator_tb;

parameter WIDTH = 4;
parameter DELAY = 10;

reg [WIDTH - 1 : 0] a, b;
wire equal, greater, lower;
integer i, j;

comparator #(.WIDTH(WIDTH)) cmp_inst1(.a(a),
					.b(b),
					.equal(equal),
					.greater(greater),
					.lower(lower)
					);
initial begin
	a = 0;
	b = 0;
	for(i=0; i<2**WIDTH; i=i+1) begin
		for(j=0; j<2**WIDTH; j=j+1) begin
			#DELAY;
			a=i;
			b=j;
		end
	end
	$finish;
end
endmodule
