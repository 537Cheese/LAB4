module ADDER(A, B, Cin, S, Cout);

input	A, B; 
input Cin;

output reg S;
output reg Cout;

always @(A or B or Cin)
begin
{ Cout, S } = (A + B + Cin);
end
endmodule




