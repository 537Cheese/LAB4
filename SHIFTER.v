module SHIFTER(A, B, rightOut, leftOut);
input [31:0]A;
input [4:0]B;

output [31:0]rightOut;
output [31:0]leftOut;

assign leftOut = A<<B;
assign rightOut = A>>B;

endmodule
