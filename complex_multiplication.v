`timescale 1ns/10ps

module complex_mul (A_real, A_imaginary, B_real, B_imaginary, product_real, product_imaginary,clock,reset);

input signed [29:0] A_real, A_imaginary;
input signed [21:0] B_real, B_imaginary;
input clock,reset;

output signed [29:0] product_real, product_imaginary;

wire signed [29:0] A_real_B_real, A_imaginary_B_imaginary;
wire signed [29:0] A_real_B_imaginary, A_imaginary_B_real;

fixed_point_mul M1 (.first_input(A_real), 
	   	    .second_input(B_real), 
		    .product(A_real_B_real),
		    .clock(clock),.reset(reset));

fixed_point_mul M2 (.first_input(A_imaginary), 
	            .second_input(B_imaginary), 
		    .product(A_imaginary_B_imaginary),
		    .clock(clock),.reset(reset));

fixed_point_mul M3 (.first_input(A_real), 
		    .second_input(B_imaginary), 
		    .product(A_real_B_imaginary),
		    .clock(clock),.reset(reset));

fixed_point_mul M4 (.first_input(A_imaginary), 
		    .second_input(B_real), 
		    .product(A_imaginary_B_real),
		    .clock(clock),.reset(reset));

assign product_real      = A_real_B_real - A_imaginary_B_imaginary;
assign product_imaginary = A_real_B_imaginary + A_imaginary_B_real;

endmodule
