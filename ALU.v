module ALU (A,B,Cin, Op, Sum, Status);
parameter N = 31;
input [N:0]A;
input [N:0]B;
input Cin;
input [2:0] Op;

output [N:0] Sum;
output reg [3:0] Status;

wire carry[32:0];
wire [N:0] I0, I1, I2, I3,I4,I5,I6,I7;

assign I0 = A^B;
assign I1 = A&B;
assign I2 = A|B;
assign I3 = (~A)|B;

generate
	genvar i;
		for(i =0; i< 32 ; i = i+1)
		begin: full_adder
		ADDER inst0 (A[i], B[i], carry[i], I4[i], carry[i+1]);//A,B,Cin,S,Cout
	end
endgenerate

SHIFTER inst32(A, B, I5, I6);

assign I7 = 32'b0;

MULTIPLEXER inst33 (I0, I1, I2, I3, I4, I5, I6, I7, Op, Sum);

always @ (A or B) begin
	if( (A[N] == 1 && B[N] == 1) || (A[N] == 0 && B[N] == 0))
		Status[0] = 1'b1;
	else 
		Status[0] = 1'b0;
end


always @(carry[32]) 
	Status[3] = carry[32];

always @(Sum[31]) 
	Status[1] = Sum[31];

always @ (Sum) begin
	if ( Sum == 32'b0)
		Status[2] = 1'b1;
	else
		Status[2] = 1'b0;
end
endmodule





