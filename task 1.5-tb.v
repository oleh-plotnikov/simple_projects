`timescale 1ns / 1ps
module reg_8bit_we_tb;

parameter PERIOD = 4;

reg clk, rst_n, we_n;
reg [7:0] data_in;
wire [7:0] data_out;
integer i;

reg_8bit_we reg_inst1(.clk(clk),
			 .rst_n(rst_n),
			 .data_in(data_in),
			 .data_out(data_out),
			 .we_n(we_n)
			 );
initial begin
	clk = 0;
	forever #(PERIOD/2) clk = ~clk;
end

initial begin
	rst_n = 0;
	data_in = 0;
	we_n = 0;
	@(negedge clk) rst_n = 1;
	for (i = 0; i < 256; i = i + 1) begin
		@(negedge clk) data_in = i;
		if ((i >= 5) && (i <= 10)) we_n = !we_n;
	end
	@(negedge clk);
	$finish;
end
endmodule
