`timescale 1ns / 1ps
module circular_shifter_tb;

parameter PERIOD = 4;
parameter WIDTH = 4;

reg clk, n_rst;
wire [WIDTH-1:0] out;

circular_shifter #(.WIDTH(WIDTH)) reg_inst1(.clk(clk),
						.n_rst(n_rst),
						.out(out)
						 );
initial begin
	clk = 0;
	forever #(PERIOD/2) clk = ~clk;
end

initial begin
	n_rst = 0;
	repeat (2) @(negedge clk);
	n_rst = 1;
	repeat (30) @(negedge clk);
	$finish;
end
endmodule
