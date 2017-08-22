`timescale 1ns / 1ps
module edge2_tb;

parameter PERIOD = 4;

reg clk, n_rst, in;
wire out, in_reg;
integer i;

edge2 cmp_inst1(.clk(clk),
		.n_rst(n_rst),
		.in(in),	
		.in_reg(in_reg),						
		.out(out)							
		);

initial begin
		clk=0;
		forever #(PERIOD/2) clk = ~clk;
end

initial begin
	n_rst = 1'b0;
	in = 1'b0;
	@(negedge clk) n_rst = 1'b1;
	@(negedge clk) in = 1'b1;
		#(PERIOD*2);
	@(negedge clk) in = ~in;  
		#(PERIOD*3);
	@(negedge clk) in = ~in;
	repeat (2) @(negedge clk);
 	$finish;
$finish;
end
endmodule
