`timescale 1 ns / 1 ps 

module complex_latch (clk, n_rst, data_in, jcnt_out, data_out);

	input clk;
	input n_rst;
	input [3:0] data_in;

	output reg [3:0] jcnt_out;
	output reg [3:0] data_out;
	wire we;

assign we = (n_rst ^ (^jcnt_out ^ (^jcnt_out[2:1])));

always @(posedge clk, negedge n_rst) begin 
		if (!n_rst) jcnt_out <= 4'b0;
		else jcnt_out <= {~jcnt_out[0], jcnt_out[3:1]};
	end 

always @(we, data_in, n_rst) begin 
    if (!n_rst)
        data_out <= 4'b0000;
    else if (we)
        data_out <= data_in;
end

endmodule
