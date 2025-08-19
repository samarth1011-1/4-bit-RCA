`timescale 1ns/1ps

module rcatest;

reg [3:0]a;
reg [3:0]b;
wire [3:0]sum;
wire cout;
reg cin;

rca uut(.cin(cin),.a(a),.b(b),.cout(cout),.sum(sum));

initial begin
    $dumpfile("rcatest.vcd");
    $dumpvars(0,rcatest);
    $monitor($time," A = %b, B = %b, Cin=%b -> Sum = %b, Cout=%b",a,b,cin,sum,cout);
    #5 cin = 0; a = 4'b0001; b = 4'b0001;
    #5 cin = 0; a = 4'b1110; b = 4'b0001;
    #5 cin = 1; a = 4'b0101; b = 4'b0101;
    #5 cin = 1; a = 4'b1110; b = 4'b0001;
    #5 $finish;
end

endmodule