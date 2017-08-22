`timescale 1 ns / 1 ps 

module pipeline (clk, n_rst, A, B, C, Q, Q_pipe);

parameter WIDTH = 4;

	input clk;
	input n_rst;
	input [WIDTH-1:0] A;
	input [WIDTH-1:0] B;
	input [WIDTH-1:0] C;
	output reg [WIDTH-1:0] Q;
	output reg [WIDTH-1:0] Q_pipe;
	reg [WIDTH-1:0] q_a;
	reg [WIDTH-1:0] q_b;
	reg [WIDTH-1:0] q_c;
	reg [WIDTH-1:0] q_cc;
	reg [WIDTH-1:0] q_ab;

always @(posedge clk, negedge n_rst)
	begin 
		if (!n_rst) begin 
			Q <= 0;
			Q_pipe <= 0;
			q_a <= 0;
			q_b <= 0;
			q_c <= 0;
			q_ab <= 0;
			q_cc <= 0;
		end else begin
			q_a <= A;
			q_b <= B;
			q_c <= C;
			q_cc <= q_c;
			q_ab <= q_a + q_b;
			Q_pipe <= q_ab ^ q_cc;
			Q <= (q_a + q_b) ^ q_c;
		end 
end 
endmodule 
