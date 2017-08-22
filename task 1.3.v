`timescale 1 ns / 1 ps 
module dff_complex(clk, rst_n, set_n, we, d_in, d_out);
input clk, rst_n, set_n, we, d_in;
output reg d_out;
always @(posedge clk, negedge rst_n, negedge set_n) begin
	if(!rst_n) begin    
		d_out <= 1'b0;
	end else if(!set_n) begin
		d_out <= 1'b1;
	end else if(we) begin
		d_out <= d_in;
	end
end
//synopsys translate_off
	always @(rst_n, set_n) begin
		if(rst_n && !set_n) begin
		force d_out = 1'b1;
	end else begin
		release d_out;
	end
end
//synopsys translate_on
endmodule
