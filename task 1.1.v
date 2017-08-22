`timescale 1 ns / 1 ps 
module dff(clk, d_in, d_out);

input clk, d_in;
output reg d_out;

always @(posedge clk) begin
  d_out <= d_in;
end
endmodule
