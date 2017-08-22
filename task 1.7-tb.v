`timescale 1ns / 1ps
module param_shift_direct_parallel_reg_tb;

parameter PERIOD = 4;
parameter WIDTH = 4;

reg clk, rst_n, we_n, direction;
reg [WIDTH - 1:0] par_in;
wire [WIDTH-1:0] data_out;

param_shift_direct_parallel_reg #(.WIDTH(WIDTH)) reg_inst1(.clk(clk),
								.rst_n(rst_n),
								.we_n(we_n),
								.direction(direction),
								.data_out(data_out),
								.par_in(par_in)
								 );
initial begin
clk = 0;
forever #(PERIOD/2) clk = ~clk;
end

initial begin
	par_in = 0;
	rst_n = 0;
	we_n = 1;
	direction = 0;
	repeat (2) @(negedge clk); rst_n = 1; we_n = 0;
		par_in = 4'b1;
	@(negedge clk); we_n = 1; direction = 1;
	repeat (3) @(negedge clk); direction = 0;
	repeat (5) @(negedge clk);
	repeat (2) @(negedge clk); rst_n = 1; we_n = 0;
		par_in = 4'b1111;
	@(negedge clk); we_n = 1; direction = 1;
	repeat (6) @(negedge clk);
	$finish;
end
endmodule
