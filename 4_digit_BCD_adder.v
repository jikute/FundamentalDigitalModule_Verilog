/*
You are provided with a BCD (binary-coded decimal) one-digit adder
named bcd_fadd that adds two BCD digits and carry-in, and produces a sum and carry-out.

Instantiate 4 copies of bcd_fadd to create a 4-digit BCD ripple-carry adder.
Your adder should add two 4-digit BCD numbers (packed into 16-bit vectors)
and a carry-in to produce a 4-digit sum and carry out.
*/
module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire carry[2:0];
    bcd_fadd bcd_fadd0(.a(a[3:0]),
                       .b(b[3:0]),
                       .cin(cin),
                       .cout(carry[0]),
                       .sum(sum[3:0]));
    bcd_fadd bcd_fadd1(.a(a[7:4]),
                       .b(b[7:4]),
                       .cin(carry[0]),
                       .cout(carry[1]),
                       .sum(sum[7:4]));
    bcd_fadd bcd_fadd2(.a(a[11:8]),
                       .b(b[11:8]),
                       .cin(carry[1]),
                       .cout(carry[2]),
                       .sum(sum[11:8]));
    bcd_fadd bcd_fadd3(.a(a[15:12]),
                       .b(b[15:12]),
                       .cin(carry[2]),
                       .cout(cout),
                       .sum(sum[15:12]));
endmodule

module bcd_fadd {
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
endmodule

