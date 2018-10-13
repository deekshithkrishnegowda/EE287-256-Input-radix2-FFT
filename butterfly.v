
module butterfly_single (case_select, input1_real, input1_imaginary, 
		  	 input2_real, input2_imaginary,
		      	 output1_real, output1_imaginary,
		  	 output2_real, output2_imaginary,clock,reset);

input signed [29:0] input1_real, input1_imaginary;
input signed [29:0] input2_real, input2_imaginary;
input [6:0] case_select;
input clock,reset;

reg signed [21:0] _real, _imaginary;

reg signed [21:0] twiddle_real, twiddle_imaginary;

output signed [29:0] output1_real, output1_imaginary;
output signed [29:0] output2_real, output2_imaginary;

wire signed [29:0] input2_twiddle_real, input2_twiddle_imaginary;

reg signed [29:0] input1_real_ff, input1_imaginary_ff;
reg signed [29:0] input2_real_ff, input2_imaginary_ff;
reg signed [21:0] twiddle_real_ff, twiddle_imaginary_ff;


always @ (*) begin
	twiddle_real = _real;
	twiddle_imaginary = _imaginary;
end

always @ (posedge clock or posedge reset) begin
	if (reset) begin
		twiddle_real_ff <= 0;
		twiddle_imaginary_ff <= 0;
		input1_real_ff <= 0;
		input1_imaginary_ff <= 0;
		input2_real_ff <= 0;
		input2_imaginary_ff <= 0;
	end else begin
		twiddle_real_ff <= twiddle_real;
		twiddle_imaginary_ff <= twiddle_imaginary;
		input1_real_ff <= input1_real;
		input1_imaginary_ff <= input1_imaginary;
		input2_real_ff <= input2_real;
		input2_imaginary_ff <= input2_imaginary;
	end
end

always @ (case_select) begin

		case (case_select)
			 0 : begin
				 _real = 22'd1048576;
				 _imaginary = 22'd0;
				end
			 1 : begin
				 _real = 22'd1048260;
				 _imaginary = -22'd25733;
				end
			 2 : begin
				 _real = 22'd1047312;
				 _imaginary = -22'd51451;
				end
			 3 : begin
				 _real = 22'd1045734;
				 _imaginary = -22'd77138;
				end
			 4 : begin
				 _real = 22'd1043526;
				 _imaginary = -22'd102778;
				end
			 5 : begin
				 _real = 22'd1040690;
				 _imaginary = -22'd128356;
				end
			 6 : begin
				 _real = 22'd1037226;
				 _imaginary = -22'd153858;
				end
			 7 : begin
				 _real = 22'd1033138;
				 _imaginary = -22'd179266;
				end
			 8 : begin
				 _real = 22'd1028427;
				 _imaginary = -22'd204567;
				end
			 9 : begin
				 _real = 22'd1023097;
				 _imaginary = -22'd229744;
				end
			 10 : begin
				 _real = 22'd1017151;
				 _imaginary = -22'd254783;
				end
			 11 : begin
				 _real = 22'd1010592;
				 _imaginary = -22'd279668;
				end
			 12 : begin
				 _real = 22'd1003424;
				 _imaginary = -22'd304385;
				end
			 13 : begin
				 _real = 22'd995652;
				 _imaginary = -22'd328919;
				end
			 14 : begin
				 _real = 22'd987280;
				 _imaginary = -22'd353254;
				end
			 15 : begin
				 _real = 22'd978313;
				 _imaginary = -22'd377377;
				end
			 16 : begin
				 _real = 22'd968757;
				 _imaginary = -22'd401272;
				end
			 17 : begin
				 _real = 22'd958618;
				 _imaginary = -22'd424926;
				end
			 18 : begin
				 _real = 22'd947901;
				 _imaginary = -22'd448324;
				end
			 19 : begin
				 _real = 22'd936613;
				 _imaginary = -22'd471451;
				end
			 20 : begin
				 _real = 22'd924761;
				 _imaginary = -22'd494295;
				end
			 21 : begin
				 _real = 22'd912352;
				 _imaginary = -22'd516841;
				end
			 22 : begin
				 _real = 22'd899393;
				 _imaginary = -22'd539075;
				end
			 23 : begin
				 _real = 22'd885893;
				 _imaginary = -22'd560985;
				end
			 24 : begin
				 _real = 22'd871859;
				 _imaginary = -22'd582557;
				end
			 25 : begin
				 _real = 22'd857299;
				 _imaginary = -22'd603778;
				end
			 26 : begin
				 _real = 22'd842224;
				 _imaginary = -22'd624635;
				end
			 27 : begin
				 _real = 22'd826641;
				 _imaginary = -22'd645117;
				end
			 28 : begin
				 _real = 22'd810560;
				 _imaginary = -22'd665209;
				end
			 29 : begin
				 _real = 22'd793991;
				 _imaginary = -22'd684901;
				end
			 30 : begin
				 _real = 22'd776943;
				 _imaginary = -22'd704180;
				end
			 31 : begin
				 _real = 22'd759428;
				 _imaginary = -22'd723035;
				end
			 32 : begin
				 _real = 22'd741455;
				 _imaginary = -22'd741455;
				end
			 33 : begin
				 _real = 22'd723035;
				 _imaginary = -22'd759428;
				end
			 34 : begin
				 _real = 22'd704180;
				 _imaginary = -22'd776943;
				end
			 35 : begin
				 _real = 22'd684901;
				 _imaginary = -22'd793991;
				end
			 36 : begin
				 _real = 22'd665209;
				 _imaginary = -22'd810560;
				end
			 37 : begin
				 _real = 22'd645117;
				 _imaginary = -22'd826641;
				end
			 38 : begin
				 _real = 22'd624635;
				 _imaginary = -22'd842224;
				end
			 39 : begin
				 _real = 22'd603778;
				 _imaginary = -22'd857299;
				end
			 40 : begin
				 _real = 22'd582557;
				 _imaginary = -22'd871859;
				end
			 41 : begin
				 _real = 22'd560985;
				 _imaginary = -22'd885893;
				end
			 42 : begin
				 _real = 22'd539075;
				 _imaginary = -22'd899393;
				end
			 43 : begin
				 _real = 22'd516841;
				 _imaginary = -22'd912352;
				end
			 44 : begin
				 _real = 22'd494295;
				 _imaginary = -22'd924761;
				end
			 45 : begin
				 _real = 22'd471451;
				 _imaginary = -22'd936613;
				end
			 46 : begin
				 _real = 22'd448324;
				 _imaginary = -22'd947901;
				end
			 47 : begin
				 _real = 22'd424926;
				 _imaginary = -22'd958618;
				end
			 48 : begin
				 _real = 22'd401272;
				 _imaginary = -22'd968757;
				end
			 49 : begin
				 _real = 22'd377377;
				 _imaginary = -22'd978313;
				end
			 50 : begin
				 _real = 22'd353254;
				 _imaginary = -22'd987280;
				end
			 51 : begin
				 _real = 22'd328919;
				 _imaginary = -22'd995652;
				end
			 52 : begin
				 _real = 22'd304385;
				 _imaginary = -22'd1003424;
				end
			 53 : begin
				 _real = 22'd279668;
				 _imaginary = -22'd1010592;
				end
			 54 : begin
				 _real = 22'd254783;
				 _imaginary = -22'd1017151;
				end
			 55 : begin
				 _real = 22'd229744;
				 _imaginary = -22'd1023097;
				end
			 56 : begin
				 _real = 22'd204567;
				 _imaginary = -22'd1028427;
				end
			 57 : begin
				 _real = 22'd179266;
				 _imaginary = -22'd1033138;
				end
			 58 : begin
				 _real = 22'd153858;
				 _imaginary = -22'd1037226;
				end
			 59 : begin
				 _real = 22'd128356;
				 _imaginary = -22'd1040690;
				end
			 60 : begin
				 _real = 22'd102778;
				 _imaginary = -22'd1043526;
				end
			 61 : begin
				 _real = 22'd77138;
				 _imaginary = -22'd1045734;
				end
			 62 : begin
				 _real = 22'd51451;
				 _imaginary = -22'd1047312;
				end
			 63 : begin
				 _real = 22'd25733;
				 _imaginary = -22'd1048260;
				end
			 64 : begin
				 _real = 22'd0;
				 _imaginary = -22'd1048576;
				end
			 65 : begin
				 _real = -22'd25733;
				 _imaginary = -22'd1048260;
				end
			 66 : begin
				 _real = -22'd51451;
				 _imaginary = -22'd1047312;
				end
			 67 : begin
				 _real = -22'd77138;
				 _imaginary = -22'd1045734;
				end
			 68 : begin
				 _real = -22'd102778;
				 _imaginary = -22'd1043526;
				end
			 69 : begin
				 _real = -22'd128356;
				 _imaginary = -22'd1040690;
				end
			 70 : begin
				 _real = -22'd153858;
				 _imaginary = -22'd1037226;
				end
			 71 : begin
				 _real = -22'd179266;
				 _imaginary = -22'd1033138;
				end
			 72 : begin
				 _real = -22'd204567;
				 _imaginary = -22'd1028427;
				end
			 73 : begin
				 _real = -22'd229744;
				 _imaginary = -22'd1023097;
				end
			 74 : begin
				 _real = -22'd254783;
				 _imaginary = -22'd1017151;
				end
			 75 : begin
				 _real = -22'd279668;
				 _imaginary = -22'd1010592;
				end
			 76 : begin
				 _real = -22'd304385;
				 _imaginary = -22'd1003424;
				end
			 77 : begin
				 _real = -22'd328919;
				 _imaginary = -22'd995652;
				end
			 78 : begin
				 _real = -22'd353254;
				 _imaginary = -22'd987280;
				end
			 79 : begin
				 _real = -22'd377377;
				 _imaginary = -22'd978313;
				end
			 80 : begin
				 _real = -22'd401272;
				 _imaginary = -22'd968757;
				end
			 81 : begin
				 _real = -22'd424926;
				 _imaginary = -22'd958618;
				end
			 82 : begin
				 _real = -22'd448324;
				 _imaginary = -22'd947901;
				end
			 83 : begin
				 _real = -22'd471451;
				 _imaginary = -22'd936613;
				end
			 84 : begin
				 _real = -22'd494295;
				 _imaginary = -22'd924761;
				end
			 85 : begin
				 _real = -22'd516841;
				 _imaginary = -22'd912352;
				end
			 86 : begin
				 _real = -22'd539075;
				 _imaginary = -22'd899393;
				end
			 87 : begin
				 _real = -22'd560985;
				 _imaginary = -22'd885893;
				end
			 88 : begin
				 _real = -22'd582557;
				 _imaginary = -22'd871859;
				end
			 89 : begin
				 _real = -22'd603778;
				 _imaginary = -22'd857299;
				end
			 90 : begin
				 _real = -22'd624635;
				 _imaginary = -22'd842224;
				end
			 91 : begin
				 _real = -22'd645117;
				 _imaginary = -22'd826641;
				end
			 92 : begin
				 _real = -22'd665209;
				 _imaginary = -22'd810560;
				end
			 93 : begin
				 _real = -22'd684901;
				 _imaginary = -22'd793991;
				end
			 94 : begin
				 _real = -22'd704180;
				 _imaginary = -22'd776943;
				end
			 95 : begin
				 _real = -22'd723035;
				 _imaginary = -22'd759428;
				end
			 96 : begin
				 _real = -22'd741455;
				 _imaginary = -22'd741455;
				end
			 97 : begin
				 _real = -22'd759428;
				 _imaginary = -22'd723035;
				end
			 98 : begin
				 _real = -22'd776943;
				 _imaginary = -22'd704180;
				end
			 99 : begin
				 _real = -22'd793991;
				 _imaginary = -22'd684901;
				end
			 100 : begin
				 _real = -22'd810560;
				 _imaginary = -22'd665209;
				end
			 101 : begin
				 _real = -22'd826641;
				 _imaginary = -22'd645117;
				end
			 102 : begin
				 _real = -22'd842224;
				 _imaginary = -22'd624635;
				end
			 103 : begin
				 _real = -22'd857299;
				 _imaginary = -22'd603778;
				end
			 104 : begin
				 _real = -22'd871859;
				 _imaginary = -22'd582557;
				end
			 105 : begin
				 _real = -22'd885893;
				 _imaginary = -22'd560985;
				end
			 106 : begin
				 _real = -22'd899393;
				 _imaginary = -22'd539075;
				end
			 107 : begin
				 _real = -22'd912352;
				 _imaginary = -22'd516841;
				end
			 108 : begin
				 _real = -22'd924761;
				 _imaginary = -22'd494295;
				end
			 109 : begin
				 _real = -22'd936613;
				 _imaginary = -22'd471451;
				end
			 110 : begin
				 _real = -22'd947901;
				 _imaginary = -22'd448324;
				end
			 111 : begin
				 _real = -22'd958618;
				 _imaginary = -22'd424926;
				end
			 112 : begin
				 _real = -22'd968757;
				 _imaginary = -22'd401272;
				end
			 113 : begin
				 _real = -22'd978313;
				 _imaginary = -22'd377377;
				end
			 114 : begin
				 _real = -22'd987280;
				 _imaginary = -22'd353254;
				end
			 115 : begin
				 _real = -22'd995652;
				 _imaginary = -22'd328919;
				end
			 116 : begin
				 _real = -22'd1003424;
				 _imaginary = -22'd304385;
				end
			 117 : begin
				 _real = -22'd1010592;
				 _imaginary = -22'd279668;
				end
			 118 : begin
				 _real = -22'd1017151;
				 _imaginary = -22'd254783;
				end
			 119 : begin
				 _real = -22'd1023097;
				 _imaginary = -22'd229744;
				end
			 120 : begin
				 _real = -22'd1028427;
				 _imaginary = -22'd204567;
				end
			 121 : begin
				 _real = -22'd1033138;
				 _imaginary = -22'd179266;
				end
			 122 : begin
				 _real = -22'd1037226;
				 _imaginary = -22'd153858;
				end
			 123 : begin
				 _real = -22'd1040690;
				 _imaginary = -22'd128356;
				end
			 124 : begin
				 _real = -22'd1043526;
				 _imaginary = -22'd102778;
				end
			 125 : begin
				 _real = -22'd1045734;
				 _imaginary = -22'd77138;
				end
			 126 : begin
				 _real = -22'd1047312;
				 _imaginary = -22'd51451;
				end
			 127 : begin
				 _real = -22'd1048260;
				 _imaginary = -22'd25733;
				end
		endcase
 	end


complex_mul M1 (.A_real(input2_real_ff), 
	        .A_imaginary(input2_imaginary_ff), 
		.B_real(twiddle_real_ff), 
		.B_imaginary(twiddle_imaginary_ff), 
		.product_real(input2_twiddle_real), 
		.product_imaginary(input2_twiddle_imaginary),.clock(clock),.reset(reset));

reg signed [29:0] input2_twiddle_real_reg,input2_twiddle_imaginary_reg;
reg signed [29:0] register1_real,register2_real,register3_real,register4_real,input1_real_reg;
reg signed [29:0] register1_img,register2_img,register3_img,register4_img,input1_img_reg;

	always @(posedge clock or posedge reset)
	begin	
	if (reset)
		begin
			input2_twiddle_real_reg <= 30'b0;
			input2_twiddle_imaginary_reg <= 30'b0;
		end
	else
		begin
			input2_twiddle_real_reg <= #1 input2_twiddle_real ;
			input2_twiddle_imaginary_reg <= #1 input2_twiddle_imaginary;
		end
	end

	always @(posedge clock or posedge reset)
	begin
		if (reset)
		begin
			//register1_real <= 30'b0;
			register2_real <= 30'b0;
			register3_real <= 30'b0;
			register4_real <= 30'b0;
			input1_real_reg <= 30'b0;	
		end
		else
		begin
			//register1_real <=  input1_real;
			register2_real <= #1 input1_real_ff;
			register3_real <= #1 register2_real;
			register4_real <= #1 register3_real;
			input1_real_reg <= #1 register4_real;
		end
	end

	always @(posedge clock or posedge reset)
	begin
		if (reset)
		begin
			//register1_img <= 30'b0;
			register2_img <= 30'b0;
			register3_img <= 30'b0;
			register4_img <= 30'b0;
			input1_img_reg <= 30'b0;

		end
		else
		begin
			//register1_img <= #1  input1_imaginary;
			register2_img <= #1 input1_imaginary_ff;
			register3_img <= #1 register2_img;
			register4_img <= #1 register3_img;
			input1_img_reg <= #1 register4_img;
		end
	end

assign output1_real = input1_real_reg + input2_twiddle_real_reg;
assign output1_imaginary = input1_img_reg + input2_twiddle_imaginary_reg;

assign output2_real = input1_real_reg - input2_twiddle_real_reg;
assign output2_imaginary = input1_img_reg - input2_twiddle_imaginary_reg;

endmodule






