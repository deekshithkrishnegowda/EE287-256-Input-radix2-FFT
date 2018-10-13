`timescale 1ns/10ps

module fixed_point_mul(first_input, second_input, product,clock,reset);

input signed [29:0] first_input;
input signed [21:0] second_input;
input clock,reset;

output reg signed [29:0] product;
wire signed [51:0] product52;


DW02_mult_4_stage #(30,22) DW02(.A(first_input),.B(second_input),.TC(1'b1),.CLK(clock),.PRODUCT(product52));

always@(*)
begin
	product = product52[49:20];
end
endmodule
