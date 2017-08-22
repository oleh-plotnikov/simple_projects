`timescale 1 ns / 1 ps 
module param_shift_reg(clk, rst_n, data_in, data_out);

parameter WIDTH = 8;

input clk, rst_n;
input data_in;   //serial loading
output reg [WIDTH - 1 : 0] data_out;

always @(posedge clk, negedge rst_n) begin
	if(!rst_n) begin
		data_out <= 0;
	end else begin
		data_out <= {data_out[WIDTH - 2 : 0], data_in};
	end
end
endmodule	
