module Full_adder( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a&b) | (cin&(~a)&b) | (cin&a&(~b));
    assign sum = (cin&(~a)&(~b)) | (cin&a&b) | ((~cin)&(~a)&b) | ((~cin)&a&(~b));
endmodule