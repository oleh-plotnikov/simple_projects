`timescale 1 ns / 1 ps 
module param_shift_direct_parallel_reg(par_in, direction, clk, rst_n, we_n, data_out);

parameter WIDTH = 4;

input clk, rst_n, we_n, direction;
input [WIDTH - 1:0] par_in;
output reg [WIDTH - 1 : 0] data_out;

always @(posedge clk, negedge rst_n)
		if(!rst_n)
			data_out <= 0;
		else if (!we_n) begin
			data_out <= par_in;
		end else if (direction) begin
			data_out <= data_out << 1;
		end else if (!direction) begin
			data_out <= data_out >> 1;		
		end
	
endmodule	


