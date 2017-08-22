`timescale 1 ns / 1 ps 
module reg_8bit_we(clk, rst_n, data_in, data_out, we_n);

input clk, rst_n, we_n;
input [7:0] data_in;
output reg [7:0] data_out;

always @(posedge clk, negedge rst_n) begin
	if(!rst_n) begin
		data_out <=0;
	end else 
	if (!we_n) begin
		data_out <= data_in;
	end
end
endmodule
