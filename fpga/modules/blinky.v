module blinky (clk, out);

parameter tapbit = 0;
input clk;
output out;

reg [31:0] count;

always @(posedge clk) count <= count + 1;

assign out = count[tapbit];

endmodule
