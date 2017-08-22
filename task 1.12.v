`timescale 1 ns / 1 ps 
module jsn_counter(clk, n_rst, out);

parameter WIDTH = 4;

input clk;
input n_rst;
output reg [WIDTH - 1 : 0] out;

always @(posedge clk, negedge n_rst)
	if(!n_rst) begin
		out <= {WIDTH{1'b0}};
	end else begin
        	out <= out >> 1;
		out[WIDTH-1] <= ~out[0];
   end
endmodule	
