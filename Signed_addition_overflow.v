/* adder for complement numbers with overflow detect.
Assume that you have two 8-bit 2's complement numbers, a[7:0] and b[7:0].
These numbers are added to produce s[7:0].
Also compute whether a (signed) overflow has occurred.
*/
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
    wire cout[7:0];
    Full_adder Full_adder0(.a(a[0]), .b(b[0]), .cin(0), .cout(cout[0]), .sum(s[0]));
    genvar i;
    generate
        for(i=1;i<=7;i++)
            begin : gen1
                Full_adder Full_adders(.a(a[i]), .b(b[i]), .cin(cout[i-1]), .cout(cout[i]), .sum(s[i]));
            end
    endgenerate
    assign overflow = ((~a[7])&(~b[7])&s[7]) | (a[7]&b[7]&(~s[7]));
endmodule

module Full_adder( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a&b) | (cin&(~a)&b) | (cin&a&(~b));
    assign sum = (cin&(~a)&(~b)) | (cin&a&b) | ((~cin)&(~a)&b) | ((~cin)&a&(~b));
endmodule