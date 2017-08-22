`timescale 1 ns / 1 ps 

module complex_latch_tb;

parameter PERIOD = 4;

reg clk, n_rst;
reg [3:0] data_in;
wire [3:0] jcnt_out, data_out;

complex_latch complex_latch(.clk(clk),
				.n_rst(n_rst),
				.data_in(data_in),
				.jcnt_out(jcnt_out),
				.data_out(data_out)
				); 

initial begin 
	clk = 1'b0;
	forever #(PERIOD/2) clk = ~clk;
end 

initial begin 
	n_rst = 1'b0;
	data_in = 4'b0100;
	@(negedge clk) n_rst = 1'b1;
	#(PERIOD*2);
	@(negedge clk) data_in = 4'b0001;
	@(negedge clk) data_in = 4'b1001;
	@(negedge clk) data_in = 4'b0011;
	@(negedge clk) data_in = 4'b1101;
	#(PERIOD*2);
	@(negedge clk) data_in = 4'b0101;
	@(negedge clk) data_in = 4'b0010; 
	#(PERIOD*2);	
	$finish;
end
endmodule 
