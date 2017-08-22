`timescale 1ns / 1ps
module param_shhift_reg_tb;

parameter PERIOD = 4;
parameter WIDTH = 8;

reg clk, rst_n;
reg data_in;
wire [WIDTH - 1 : 0] data_out;
integer i;

param_shift_reg #(.WIDTH(WIDTH)) reg_inst1(  .clk(clk),
						.rst_n(rst_n),
						.data_in(data_in),
						.data_out(data_out)
						);
initial begin
	clk = 0;
	forever #(PERIOD/2) clk = ~clk;
end

initial begin
	rst_n = 0;
	data_in = 0;
	@(negedge clk) rst_n = 1;
	data_in = 1;
	@(negedge clk);
	@(negedge clk);
	data_in = 0;
	repeat(7) @(negedge clk);
	$finish;
end
endmodule
