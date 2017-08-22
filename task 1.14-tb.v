`timescale 1 ns / 1 ps 

module pipeline_tb; 

parameter PERIOD = 2;
parameter WIDTH = 4;

	reg clk, n_rst;
	reg [WIDTH-1:0] A, B, C;
	wire [WIDTH-1:0] Q, Q_pipe;

pipeline #(.WIDTH(WIDTH)) pipeline_inst1(.clk(clk),
					.n_rst(n_rst),
					.A(A),
					.B(B),
					.C(C),
					.Q(Q),
					.Q_pipe(Q_pipe)
					);

initial begin 
	clk = 0;
	forever #(PERIOD/2) clk = ~clk; 
end   

initial begin 
	A = 4'b0100;
	B = 4'b0100;
	C = 4'b0001;
	n_rst = 0;
	#(PERIOD);
	n_rst = 1;
	#(PERIOD);
	repeat (20) begin 
		@(negedge clk) begin 
			A = $random; 
			B = $random;
			C = $random;
		end 
	end 
	$finish;
end
endmodule 
