`timescale 1ns / 1ps
module dff_complex_tb;

parameter PERIOD = 4;

reg clk, rst_n, set_n, we, d_in;
wire d_out;

dff_complex dff_inst1(.clk(clk),
			.rst_n(rst_n),
			.set_n(set_n),
			.we(we),
			.d_in(d_in),
			.d_out(d_out)
           		);
initial begin
  clk = 0;
  forever #(PERIOD/2) clk = ~clk;
end

initial begin
	d_in = 0;
	rst_n = 0;
	set_n = 1;
	we = 1;

	@(negedge clk) rst_n = 1;
	repeat (3) begin
		@(negedge clk) d_in = ^$random();
	end
 	we = 0;
	repeat (2) begin
		@(negedge clk) d_in = ^$random();
	end
	we = 1;
	repeat (3) begin
		@(negedge clk) d_in = ^$random();
	end
	rst_n = 0;
	@(negedge clk) set_n = 0;
	@(negedge clk) rst_n = 1;
	repeat (5) @(negedge clk);
	$finish;
end
endmodule
