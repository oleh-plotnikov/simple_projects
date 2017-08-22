`timescale 1ns / 1ps
module dff_tb;

parameter PERIOD = 4;

reg clk, d_in;
wire d_out;

dff dff_inst1(.clk(clk),
		.d_in(d_in), 
		.d_out(d_out)
		);

initial begin
  clk = 0;
  forever #(PERIOD/2) clk = ~clk;
end
initial begin
  d_in = 0;
  @(negedge clk) d_in = 1;
  repeat (20) begin
    @(negedge clk) d_in = $random();  
  end
$finish;
end
endmodule
