`timescale 1 ns / 1 ps 
module circular_shifter(clk, n_rst, out);

parameter WIDTH = 4;

input clk;
input n_rst;
output reg [WIDTH - 1 : 0] out;

always @(posedge clk, negedge n_rst)
	if(!n_rst) begin
		out[WIDTH-1] <= 1'b1;
		out[WIDTH-2:0] <= 1'b0;
	end else begin
		out[WIDTH-1] <= out[0];
		out <= out >> 1;
   end	
endmodule	

