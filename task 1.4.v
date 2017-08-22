`timescale 1 ns / 1 ps 
module reg_8bit(clk, rst_n, data_in, data_out);

input clk, rst_n;
input [7:0] data_in;
output reg [7:0] data_out;

always @(posedge clk, negedge rst_n) begin
	if(!rst_n) begin
		data_out <=0;
	end else begin
		data_out <= data_in;
	end
end
endmodule
