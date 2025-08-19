module rca(cin,a,b,cout,sum);
    input cin;
    input [3:0] a;
    input [3:0] b;
    output [3:0] sum;
    output cout;

    wire c1,c2,c3;
    fulladd F1(a[0],b[0],cin,sum[0],c1);
    fulladd F2(a[1],b[1],c1,sum[1],c2);
    fulladd F3(a[2],b[2],c2,sum[2],c3);
    fulladd F4(a[3],b[3],c3,sum[3],cout);
endmodule

module fulladd(a,b,cin,sum,cout);
    input cin;
    input a;
    input b;
    output sum;
    output cout;

    assign sum = a^b^cin;
    assign cout = a&b | b&cin | cin&a;    
    
endmodule