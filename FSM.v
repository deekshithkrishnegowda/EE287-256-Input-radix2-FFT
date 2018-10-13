`timescale 1ns/10ps

module FSM ( clock, start, reset, real_data_in0, imaginary_data_in0, real_data_in1, imaginary_data_in1, real_data_in2, imaginary_data_in2, real_data_in3, imaginary_data_in3, real_data_in4, imaginary_data_in4 ,real_data_in5, imaginary_data_in5, real_data_in6, imaginary_data_in6, real_data_in7, imaginary_data_in7, real_data_out0, imaginary_data_out0, real_data_out1, imaginary_data_out1, real_data_out2, imaginary_data_out2, real_data_out3, imaginary_data_out3, real_data_out4, imaginary_data_out4, real_data_out5, imaginary_data_out5, real_data_out6, imaginary_data_out6, real_data_out7, imaginary_data_out7, read_en_int_buffer, read_en_out_buffer, write_en_int_buffer_out, write_en_out_buffer_out, startout_6, addr0, addr1, addr2, addr3, addr4, addr5, addr6, addr7, wr_addr0, wr_addr1, wr_addr2, wr_addr3, wr_addr4, wr_addr5, wr_addr6, wr_addr7);

input clock,start,reset;
input signed [29:0]real_data_in0, imaginary_data_in0 , real_data_in1, imaginary_data_in1 ,real_data_in2, imaginary_data_in2 ,real_data_in3, imaginary_data_in3 ,real_data_in4, imaginary_data_in4 ,real_data_in5, imaginary_data_in5 ,real_data_in6, imaginary_data_in6 ,real_data_in7, imaginary_data_in7;

output reg [7:0] addr0,addr1,addr2,addr3,addr4,addr5,addr6,addr7;
output signed [29:0] real_data_out0,imaginary_data_out0,real_data_out1,imaginary_data_out1,real_data_out2,imaginary_data_out2,real_data_out3,imaginary_data_out3,real_data_out4,imaginary_data_out4,real_data_out5,imaginary_data_out5,real_data_out6,imaginary_data_out6,real_data_out7,imaginary_data_out7;
output reg read_en_int_buffer,read_en_out_buffer, write_en_int_buffer_out, write_en_out_buffer_out;
output reg startout_6;
output reg [7:0] wr_addr0, wr_addr1, wr_addr2, wr_addr3, wr_addr4, wr_addr5, wr_addr6, wr_addr7;

reg [6:0] case_select0, case_select1, case_select2, case_select3;
reg [7:0] count;
reg [7:0] ns,ps;
reg start_1;

reg write_en;
reg startout_1, startout_2, startout_3, startout_4, startout_5;
reg [7:0] reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8, reg13,reg14,reg15,reg16, reg17,reg18,reg19,reg20, reg21,reg22,reg23,reg24,reg25, reg26,reg27,reg28,reg29,reg30,reg31,reg32,reg33,reg34,reg35,reg36;
reg write_en_int_buffer, write_reg0_int, write_reg1_int, write_reg2_int, write_reg3_int, write_reg4_int;
reg write_en_out_buffer, write_reg0_out, write_reg1_out, write_reg2_out, write_reg3_out, write_reg4_out;

assign read_en_out_buffer = 0;

 
parameter  S0 = 0,     S1 = 1,     S2 = 2,     S3 = 3,     S4 = 4,     S5 = 5,     S6 = 6,     S7 = 7, 
           S8 = 8,     S9 = 9,     S10 = 10,   S11 = 11,   S12 = 12,   S13 = 13,   S14 = 14,   S15 = 15, 
           S16 = 16,   S17 = 17,   S18 = 18,   S19 = 19,   S20 = 20,   S21 = 21,   S22 = 22,   S23 = 23, 
           S24 = 24,   S25 = 25,   S26 = 26,   S27 = 27,   S28 = 28,   S29 = 29,   S30 = 30,   S31 = 31, 
      	   S32 = 32,   S33 = 33,   S34 = 34,   S35 = 35,   S36 = 36,   S37 = 37,   S38 = 38,   S39 = 39, 
           S40 = 40,   S41 = 41,   S42 = 42,   S43 = 43,   S44 = 44,   S45 = 45,   S46 = 46,   S47 = 47, 
           S48 = 48,   S49 = 49,   S50 = 50,   S51 = 51,   S52 = 52,   S53 = 53,   S54 = 54,   S55 = 55, 
           S56 = 56,   S57 = 57,   S58 = 58,   S59 = 59,   S60 = 60,   S61 = 61,   S62 = 62,   S63 = 63, 
           S64 = 64,   S65 = 65,   S66 = 66,   S67 = 67,   S68 = 68,   S69 = 69,   S70 = 70,   S71 = 71, 
           S72 = 72,   S73 = 73,   S74 = 74,   S75 = 75,   S76 = 76,   S77 = 77,   S78 = 78,   S79 = 79, 
           S80 = 80,   S81 = 81,   S82 = 82,   S83 = 83,   S84 = 84,   S85 = 85,   S86 = 86,   S87 = 87, 
           S88 = 88,   S89 = 89,   S90 = 90,   S91 = 91,   S92 = 92,   S93 = 93,   S94 = 94,   S95 = 95,   
	   S96 = 96,   S97 = 97,   S98 = 98,   S99 = 99,   S100 = 100, S101 = 101, S102 = 102, S103 = 103, 
           S104 = 104, S105 = 105, S106 = 106, S107 = 107, S108 = 108, S109 = 109, S110 = 110, S111 = 111, 
           S112 = 112, S113 = 113, S114 = 114, S115 = 115, S116 = 116, S117 = 117, S118 = 118, S119 = 119, 
           S120 = 120, S121 = 121, S122 = 122, S123 = 123, S124 = 124, S125 = 125, S126 = 126, S127 = 127, 
           S128 = 128, S129 = 129, S130 = 130, S131 = 131, S132 = 132, S133 = 133, S134 = 134, S135 = 135, 
           S136 = 136, S137 = 137, S138 = 138, S139 = 139, S140 = 140, S141 = 141, S142 = 142, S143 = 143, 
           S144 = 144, S145 = 145, S146 = 146, S147 = 147, S148 = 148, S149 = 149, S150 = 150, S151 = 151, 
           S152 = 152, S153 = 153, S154 = 154, S155 = 155, S156 = 156, S157 = 157, S158 = 158, S159 = 159, 
           S160 = 160, S161 = 161, S162 = 162, S163 = 163, S164 = 164, S165 = 165, S166 = 166, S167 = 167, 
	   S168 = 168, S169 = 169, S170 = 170, S171 = 171, S172 = 172, S173 = 173, S174 = 174, S175 = 175, 
           S176 = 176, S177 = 177, S178 = 178, S179 = 179, S180 = 180, S181 = 181, S182 = 182, S183 = 183, 
           S184 = 184, S185 = 185, S186 = 186, S187 = 187, S188 = 188, S189 = 189, S190 = 190, S191 = 191, 
           S192 = 192, S193 = 193, S194 = 194, S195 = 195, S196 = 196, S197 = 197, S198 = 198, S199 = 199, 
           S200 = 200, S201 = 201, S202 = 202, S203 = 203, S204 = 204, S205 = 205, S206 = 206, S207 = 207, 
	   S208 = 208, S209 = 209, S210 = 210, S211 = 211, S212 = 212, S213 = 213, S214 = 214, S215 = 215, 
	   S216 = 216, S217 = 217, S218 = 218, S219 = 219, S220 = 220, S221 = 221, S222 = 222, S223 = 223, 
           S224 = 224, S225 = 225, S226 = 226, S227 = 227, S228 = 228, S229 = 229, S230 = 230, S231 = 231, 
           S232 = 232, S233 = 233, S234 = 234, S235 = 235, S236 = 236, S237 = 237, S238 = 238, S239 = 239, 
	   S240 = 240, S241 = 241, S242 = 242, S243 = 243, S244 = 244, S245 = 245, S246 = 246, S247 = 247, 
	   S248 = 248, S249 = 249, S250 = 250, S251 = 251, S252 = 252, S253 = 253, S254 = 254, S255 = 255;


wire temp;

//write_en_int_buffer pipline

always @(posedge clock or posedge reset)
begin
	if (reset) begin
		write_reg0_int <= 0;
		write_reg1_int <= 0;
		write_reg2_int <= 0;
		write_reg3_int <= 0;
		write_en_int_buffer_out <= 0;
	end else begin
		write_reg0_int <= write_en_int_buffer;
		write_reg1_int <= write_reg0_int;
		write_reg2_int <= write_reg1_int;
		write_reg3_int <= write_reg2_int;
		write_en_int_buffer_out <= write_reg3_int;
	end
end

//write_en_out_buffer pipline

always @(posedge clock or posedge reset)
begin
	if (reset) begin
		write_reg0_out <= 0;
		write_reg1_out <= 0;
		write_reg2_out <= 0;
		write_reg3_out <= 0;
		write_en_out_buffer_out <= 0;
	end else begin
		write_reg0_out <= write_en_out_buffer;
		write_reg1_out <= write_reg0_out;
		write_reg2_out <= write_reg1_out;
		write_reg3_out <= write_reg2_out;
		write_en_out_buffer_out <= write_reg3_out;
	end
end


//wr_addr pipeline

always @(posedge clock or posedge reset)
begin
	if (reset) begin
		reg1 <= 0;
		reg2 <= 0;
		reg3 <= 0;
		reg4 <= 0;
		wr_addr0 <= 0;
		reg5<= 0;
		reg6 <= 0;
		reg7 <= 0;
		reg8 <= 0;
		wr_addr1 <= 0;
		reg13 <= 0;
		reg14 <= 0;
		reg15 <= 0;
		reg16 <= 0;
		wr_addr2 <= 0;
		reg17 <= 0;
		reg18 <= 0;
		reg19 <= 0;
		reg20 <= 0;
		wr_addr3 <= 0;
		reg21 <= 0;
		reg22 <= 0;
		reg23 <= 0;
		reg24 <= 0;
		wr_addr4 <= 0;
		reg25 <= 0;
		reg26 <= 0;
		reg27 <= 0;
		reg28 <= 0;
		wr_addr5 <= 0;
		reg29 <= 0;
		reg30 <= 0;
		reg31 <= 0;
		reg32 <= 0;
		wr_addr6 <= 0;
		reg33 <= 0;
		reg34 <= 0;
		reg35 <= 0;
		reg36 <= 0;
		wr_addr7 <= 0;
	end else begin
		reg1 <= addr0;
		reg2 <= reg1;
		reg3 <= reg2;
		reg4 <= reg3;
		wr_addr0 <= reg4;
		reg5<= addr1;
		reg6 <= reg5;
		reg7 <= reg6;
		reg8 <= reg7;
		wr_addr1 <= reg8;
		reg13 <= addr2;
		reg14 <= reg13;
		reg15 <= reg14;
		reg16 <= reg15;
		wr_addr2 <= reg16;
		reg17 <= addr3;
		reg18 <= reg17;
		reg19 <= reg18;
		reg20 <= reg19;
		wr_addr3 <= reg20;
		reg21 <= addr4;
		reg22 <= reg21;
		reg23 <= reg22;
		reg24 <= reg23;
		wr_addr4 <= reg24;
		reg25 <= addr5;
		reg26 <= reg25;
		reg27 <= reg26;
		reg28 <= reg27;
		wr_addr5 <= reg28;
		reg29 <= addr6;
		reg30 <= reg29;
		reg31 <= reg30;
		reg32 <= reg31;
		wr_addr6 <= reg32;
		reg33 <= addr7;
		reg34 <= reg33;
		reg35 <= reg34;
		reg36 <= reg35;
		wr_addr7 <= reg36;
	end	

end

always @ (posedge clock or posedge reset)
begin
	if (reset) begin
		startout_2 <= #1 0;
		startout_3 <= #1 0;
		startout_4 <= #1 0;
		startout_5 <= #1 0;
		startout_6 <= #1 0;
	end else begin
		startout_2 <= #1 startout_1;
		startout_3 <= #1 startout_2;
		startout_4 <= #1 startout_3;
		startout_5 <= #1 startout_4;
		startout_6 <= #1 startout_5;
	end
end



//counter logic
always @ (posedge clock or posedge reset)
begin
	if(reset)
		count <= #1 0;
	else if(start)
		count <= #1 0;
	else if (temp)
		count <= #1 count+1;
	else
		count <= #1 0;
end

//logic for temp (to count) always @ (clk) is added to get rid of disabling
//arc error
assign temp = reset ? 0 : (start || start_1 || (count > 0 && count < 255 )) ? 1 : 0;

always @ (posedge clock or posedge reset)
begin
	if (reset)
		start_1 <= #1 0;
	else
		start_1 <= #1 start;
end


// logic for startout_1 to copy data from output_buffer_1 to output_buffer
always @ (posedge clock or posedge reset) 
begin
	if (reset)
		startout_1 <=  #1 1'b0;
	else if (count == 255)
		startout_1 <=  #1 1'b1;
	else 
		startout_1 <=  #1 1'b0;
end

// PRESENT STATE LOGIC
always @ (posedge clock or posedge reset)
begin
	if (reset)
		ps <= #1 S0;
	else if(start)
		ps <= #1 S0;
	else
		ps <= #1 ns;
end

// NEXT STATE LOGIC
always @ (*) begin
	case (ps)
		S0: begin 
 				if (count == 0) ns = S1;
				else ns = S0;
		end
		S1: begin 
 				if (count == 1) ns = S2;
				else ns = S1;
		end
		S2: begin 
 				if (count == 2) ns = S3;
				else ns = S2;
		end
		S3: begin 
 				if (count == 3) ns = S4;
				else ns = S3;
		end
		S4: begin 
 				if (count == 4) ns = S5;
				else ns = S4;
		end
		S5: begin 
 				if (count == 5) ns = S6;
				else ns = S5;
		end
		S6: begin 
 				if (count == 6) ns = S7;
				else ns = S6;
		end
		S7: begin 
 				if (count == 7) ns = S8;
				else ns = S7;
		end
		S8: begin 
 				if (count == 8) ns = S9;
				else ns = S8;
		end
		S9: begin 
 				if (count == 9) ns = S10;
				else ns = S9;
		end
		S10: begin 
 				if (count == 10) ns = S11;
				else ns = S10;
		end
		S11: begin 
 				if (count == 11) ns = S12;
				else ns = S11;
		end
		S12: begin 
 				if (count == 12) ns = S13;
				else ns = S12;
		end
		S13: begin 
 				if (count == 13) ns = S14;
				else ns = S13;
		end
		S14: begin 
 				if (count == 14) ns = S15;
				else ns = S14;
		end
		S15: begin 
 				if (count == 15) ns = S16;
				else ns = S15;
		end
		S16: begin 
 				if (count == 16) ns = S17;
				else ns = S16;
		end
		S17: begin 
 				if (count == 17) ns = S18;
				else ns = S17;
		end
		S18: begin 
 				if (count == 18) ns = S19;
				else ns = S18;
		end
		S19: begin 
 				if (count == 19) ns = S20;
				else ns = S19;
		end
		S20: begin 
 				if (count == 20) ns = S21;
				else ns = S20;
		end
		S21: begin 
 				if (count == 21) ns = S22;
				else ns = S21;
		end
		S22: begin 
 				if (count == 22) ns = S23;
				else ns = S22;
		end
		S23: begin 
 				if (count == 23) ns = S24;
				else ns = S23;
		end
		S24: begin 
 				if (count == 24) ns = S25;
				else ns = S24;
		end
		S25: begin 
 				if (count == 25) ns = S26;
				else ns = S25;
		end
		S26: begin 
 				if (count == 26) ns = S27;
				else ns = S26;
		end
		S27: begin 
 				if (count == 27) ns = S28;
				else ns = S27;
		end
		S28: begin 
 				if (count == 28) ns = S29;
				else ns = S28;
		end
		S29: begin 
 				if (count == 29) ns = S30;
				else ns = S29;
		end
		S30: begin 
 				if (count == 30) ns = S31;
				else ns = S30;
		end
		S31: begin 
 				if (count == 31) ns = S32;
				else ns = S31;
		end
		S32: begin 
 				if (count == 32) ns = S33;
				else ns = S32;
		end
		S33: begin 
 				if (count == 33) ns = S34;
				else ns = S33;
		end
		S34: begin 
 				if (count == 34) ns = S35;
				else ns = S34;
		end
		S35: begin 
 				if (count == 35) ns = S36;
				else ns = S35;
		end
		S36: begin 
 				if (count == 36) ns = S37;
				else ns = S36;
		end
		S37: begin 
 				if (count == 37) ns = S38;
				else ns = S37;
		end
		S38: begin 
 				if (count == 38) ns = S39;
				else ns = S38;
		end
		S39: begin 
 				if (count == 39) ns = S40;
				else ns = S39;
		end
		S40: begin 
 				if (count == 40) ns = S41;
				else ns = S40;
		end
		S41: begin 
 				if (count == 41) ns = S42;
				else ns = S41;
		end
		S42: begin 
 				if (count == 42) ns = S43;
				else ns = S42;
		end
		S43: begin 
 				if (count == 43) ns = S44;
				else ns = S43;
		end
		S44: begin 
 				if (count == 44) ns = S45;
				else ns = S44;
		end
		S45: begin 
 				if (count == 45) ns = S46;
				else ns = S45;
		end
		S46: begin 
 				if (count == 46) ns = S47;
				else ns = S46;
		end
		S47: begin 
 				if (count == 47) ns = S48;
				else ns = S47;
		end
		S48: begin 
 				if (count == 48) ns = S49;
				else ns = S48;
		end
		S49: begin 
 				if (count == 49) ns = S50;
				else ns = S49;
		end
		S50: begin 
 				if (count == 50) ns = S51;
				else ns = S50;
		end
		S51: begin 
 				if (count == 51) ns = S52;
				else ns = S51;
		end
		S52: begin 
 				if (count == 52) ns = S53;
				else ns = S52;
		end
		S53: begin 
 				if (count == 53) ns = S54;
				else ns = S53;
		end
		S54: begin 
 				if (count == 54) ns = S55;
				else ns = S54;
		end
		S55: begin 
 				if (count == 55) ns = S56;
				else ns = S55;
		end
		S56: begin 
 				if (count == 56) ns = S57;
				else ns = S56;
		end
		S57: begin 
 				if (count == 57) ns = S58;
				else ns = S57;
		end
		S58: begin 
 				if (count == 58) ns = S59;
				else ns = S58;
		end
		S59: begin 
 				if (count == 59) ns = S60;
				else ns = S59;
		end
		S60: begin 
 				if (count == 60) ns = S61;
				else ns = S60;
		end
		S61: begin 
 				if (count == 61) ns = S62;
				else ns = S61;
		end
		S62: begin 
 				if (count == 62) ns = S63;
				else ns = S62;
		end
		S63: begin 
 				if (count == 63) ns = S64;
				else ns = S63;
		end
		S64: begin 
 				if (count == 64) ns = S65;
				else ns = S64;
		end
		S65: begin 
 				if (count == 65) ns = S66;
				else ns = S65;
		end
		S66: begin 
 				if (count == 66) ns = S67;
				else ns = S66;
		end
		S67: begin 
 				if (count == 67) ns = S68;
				else ns = S67;
		end
		S68: begin 
 				if (count == 68) ns = S69;
				else ns = S68;
		end
		S69: begin 
 				if (count == 69) ns = S70;
				else ns = S69;
		end
		S70: begin 
 				if (count == 70) ns = S71;
				else ns = S70;
		end
		S71: begin 
 				if (count == 71) ns = S72;
				else ns = S71;
		end
		S72: begin 
 				if (count == 72) ns = S73;
				else ns = S72;
		end
		S73: begin 
 				if (count == 73) ns = S74;
				else ns = S73;
		end
		S74: begin 
 				if (count == 74) ns = S75;
				else ns = S74;
		end
		S75: begin 
 				if (count == 75) ns = S76;
				else ns = S75;
		end
		S76: begin 
 				if (count == 76) ns = S77;
				else ns = S76;
		end
		S77: begin 
 				if (count == 77) ns = S78;
				else ns = S77;
		end
		S78: begin 
 				if (count == 78) ns = S79;
				else ns = S78;
		end
		S79: begin 
 				if (count == 79) ns = S80;
				else ns = S79;
		end
		S80: begin 
 				if (count == 80) ns = S81;
				else ns = S80;
		end
		S81: begin 
 				if (count == 81) ns = S82;
				else ns = S81;
		end
		S82: begin 
 				if (count == 82) ns = S83;
				else ns = S82;
		end
		S83: begin 
 				if (count == 83) ns = S84;
				else ns = S83;
		end
		S84: begin 
 				if (count == 84) ns = S85;
				else ns = S84;
		end
		S85: begin 
 				if (count == 85) ns = S86;
				else ns = S85;
		end
		S86: begin 
 				if (count == 86) ns = S87;
				else ns = S86;
		end
		S87: begin 
 				if (count == 87) ns = S88;
				else ns = S87;
		end
		S88: begin 
 				if (count == 88) ns = S89;
				else ns = S88;
		end
		S89: begin 
 				if (count == 89) ns = S90;
				else ns = S89;
		end
		S90: begin 
 				if (count == 90) ns = S91;
				else ns = S90;
		end
		S91: begin 
 				if (count == 91) ns = S92;
				else ns = S91;
		end
		S92: begin 
 				if (count == 92) ns = S93;
				else ns = S92;
		end
		S93: begin 
 				if (count == 93) ns = S94;
				else ns = S93;
		end
		S94: begin 
 				if (count == 94) ns = S95;
				else ns = S94;
		end
		S95: begin 
 				if (count == 95) ns = S96;
				else ns = S95;
		end
		S96: begin 
 				if (count == 96) ns = S97;
				else ns = S96;
		end
		S97: begin 
 				if (count == 97) ns = S98;
				else ns = S97;
		end
		S98: begin 
 				if (count == 98) ns = S99;
				else ns = S98;
		end
		S99: begin 
 				if (count == 99) ns = S100;
				else ns = S99;
		end
		S100: begin 
 				if (count == 100) ns = S101;
				else ns = S100;
		end
		S101: begin 
 				if (count == 101) ns = S102;
				else ns = S101;
		end
		S102: begin 
 				if (count == 102) ns = S103;
				else ns = S102;
		end
		S103: begin 
 				if (count == 103) ns = S104;
				else ns = S103;
		end
		S104: begin 
 				if (count == 104) ns = S105;
				else ns = S104;
		end
		S105: begin 
 				if (count == 105) ns = S106;
				else ns = S105;
		end
		S106: begin 
 				if (count == 106) ns = S107;
				else ns = S106;
		end
		S107: begin 
 				if (count == 107) ns = S108;
				else ns = S107;
		end
		S108: begin 
 				if (count == 108) ns = S109;
				else ns = S108;
		end
		S109: begin 
 				if (count == 109) ns = S110;
				else ns = S109;
		end
		S110: begin 
 				if (count == 110) ns = S111;
				else ns = S110;
		end
		S111: begin 
 				if (count == 111) ns = S112;
				else ns = S111;
		end
		S112: begin 
 				if (count == 112) ns = S113;
				else ns = S112;
		end
		S113: begin 
 				if (count == 113) ns = S114;
				else ns = S113;
		end
		S114: begin 
 				if (count == 114) ns = S115;
				else ns = S114;
		end
		S115: begin 
 				if (count == 115) ns = S116;
				else ns = S115;
		end
		S116: begin 
 				if (count == 116) ns = S117;
				else ns = S116;
		end
		S117: begin 
 				if (count == 117) ns = S118;
				else ns = S117;
		end
		S118: begin 
 				if (count == 118) ns = S119;
				else ns = S118;
		end
		S119: begin 
 				if (count == 119) ns = S120;
				else ns = S119;
		end
		S120: begin 
 				if (count == 120) ns = S121;
				else ns = S120;
		end
		S121: begin 
 				if (count == 121) ns = S122;
				else ns = S121;
		end
		S122: begin 
 				if (count == 122) ns = S123;
				else ns = S122;
		end
		S123: begin 
 				if (count == 123) ns = S124;
				else ns = S123;
		end
		S124: begin 
 				if (count == 124) ns = S125;
				else ns = S124;
		end
		S125: begin 
 				if (count == 125) ns = S126;
				else ns = S125;
		end
		S126: begin 
 				if (count == 126) ns = S127;
				else ns = S126;
		end
		S127: begin 
 				if (count == 127) ns = S128;
				else ns = S127;
		end
		S128: begin 
 				if (count == 128) ns = S129;
				else ns = S128;
		end
		S129: begin 
 				if (count == 129) ns = S130;
				else ns = S129;
		end
		S130: begin 
 				if (count == 130) ns = S131;
				else ns = S130;
		end
		S131: begin 
 				if (count == 131) ns = S132;
				else ns = S131;
		end
		S132: begin 
 				if (count == 132) ns = S133;
				else ns = S132;
		end
		S133: begin 
 				if (count == 133) ns = S134;
				else ns = S133;
		end
		S134: begin 
 				if (count == 134) ns = S135;
				else ns = S134;
		end
		S135: begin 
 				if (count == 135) ns = S136;
				else ns = S135;
		end
		S136: begin 
 				if (count == 136) ns = S137;
				else ns = S136;
		end
		S137: begin 
 				if (count == 137) ns = S138;
				else ns = S137;
		end
		S138: begin 
 				if (count == 138) ns = S139;
				else ns = S138;
		end
		S139: begin 
 				if (count == 139) ns = S140;
				else ns = S139;
		end
		S140: begin 
 				if (count == 140) ns = S141;
				else ns = S140;
		end
		S141: begin 
 				if (count == 141) ns = S142;
				else ns = S141;
		end
		S142: begin 
 				if (count == 142) ns = S143;
				else ns = S142;
		end
		S143: begin 
 				if (count == 143) ns = S144;
				else ns = S143;
		end
		S144: begin 
 				if (count == 144) ns = S145;
				else ns = S144;
		end
		S145: begin 
 				if (count == 145) ns = S146;
				else ns = S145;
		end
		S146: begin 
 				if (count == 146) ns = S147;
				else ns = S146;
		end
		S147: begin 
 				if (count == 147) ns = S148;
				else ns = S147;
		end
		S148: begin 
 				if (count == 148) ns = S149;
				else ns = S148;
		end
		S149: begin 
 				if (count == 149) ns = S150;
				else ns = S149;
		end
		S150: begin 
 				if (count == 150) ns = S151;
				else ns = S150;
		end
		S151: begin 
 				if (count == 151) ns = S152;
				else ns = S151;
		end
		S152: begin 
 				if (count == 152) ns = S153;
				else ns = S152;
		end
		S153: begin 
 				if (count == 153) ns = S154;
				else ns = S153;
		end
		S154: begin 
 				if (count == 154) ns = S155;
				else ns = S154;
		end
		S155: begin 
 				if (count == 155) ns = S156;
				else ns = S155;
		end
		S156: begin 
 				if (count == 156) ns = S157;
				else ns = S156;
		end
		S157: begin 
 				if (count == 157) ns = S158;
				else ns = S157;
		end
		S158: begin 
 				if (count == 158) ns = S159;
				else ns = S158;
		end
		S159: begin 
 				if (count == 159) ns = S160;
				else ns = S159;
		end
		S160: begin 
 				if (count == 160) ns = S161;
				else ns = S160;
		end
		S161: begin 
 				if (count == 161) ns = S162;
				else ns = S161;
		end
		S162: begin 
 				if (count == 162) ns = S163;
				else ns = S162;
		end
		S163: begin 
 				if (count == 163) ns = S164;
				else ns = S163;
		end
		S164: begin 
 				if (count == 164) ns = S165;
				else ns = S164;
		end
		S165: begin 
 				if (count == 165) ns = S166;
				else ns = S165;
		end
		S166: begin 
 				if (count == 166) ns = S167;
				else ns = S166;
		end
		S167: begin 
 				if (count == 167) ns = S168;
				else ns = S167;
		end
		S168: begin 
 				if (count == 168) ns = S169;
				else ns = S168;
		end
		S169: begin 
 				if (count == 169) ns = S170;
				else ns = S169;
		end
		S170: begin 
 				if (count == 170) ns = S171;
				else ns = S170;
		end
		S171: begin 
 				if (count == 171) ns = S172;
				else ns = S171;
		end
		S172: begin 
 				if (count == 172) ns = S173;
				else ns = S172;
		end
		S173: begin 
 				if (count == 173) ns = S174;
				else ns = S173;
		end
		S174: begin 
 				if (count == 174) ns = S175;
				else ns = S174;
		end
		S175: begin 
 				if (count == 175) ns = S176;
				else ns = S175;
		end
		S176: begin 
 				if (count == 176) ns = S177;
				else ns = S176;
		end
		S177: begin 
 				if (count == 177) ns = S178;
				else ns = S177;
		end
		S178: begin 
 				if (count == 178) ns = S179;
				else ns = S178;
		end
		S179: begin 
 				if (count == 179) ns = S180;
				else ns = S179;
		end
		S180: begin 
 				if (count == 180) ns = S181;
				else ns = S180;
		end
		S181: begin 
 				if (count == 181) ns = S182;
				else ns = S181;
		end
		S182: begin 
 				if (count == 182) ns = S183;
				else ns = S182;
		end
		S183: begin 
 				if (count == 183) ns = S184;
				else ns = S183;
		end
		S184: begin 
 				if (count == 184) ns = S185;
				else ns = S184;
		end
		S185: begin 
 				if (count == 185) ns = S186;
				else ns = S185;
		end
		S186: begin 
 				if (count == 186) ns = S187;
				else ns = S186;
		end
		S187: begin 
 				if (count == 187) ns = S188;
				else ns = S187;
		end
		S188: begin 
 				if (count == 188) ns = S189;
				else ns = S188;
		end
		S189: begin 
 				if (count == 189) ns = S190;
				else ns = S189;
		end
		S190: begin 
 				if (count == 190) ns = S191;
				else ns = S190;
		end
		S191: begin 
 				if (count == 191) ns = S192;
				else ns = S191;
		end
		S192: begin 
 				if (count == 192) ns = S193;
				else ns = S192;
		end
		S193: begin 
 				if (count == 193) ns = S194;
				else ns = S193;
		end
		S194: begin 
 				if (count == 194) ns = S195;
				else ns = S194;
		end
		S195: begin 
 				if (count == 195) ns = S196;
				else ns = S195;
		end
		S196: begin 
 				if (count == 196) ns = S197;
				else ns = S196;
		end
		S197: begin 
 				if (count == 197) ns = S198;
				else ns = S197;
		end
		S198: begin 
 				if (count == 198) ns = S199;
				else ns = S198;
		end
		S199: begin 
 				if (count == 199) ns = S200;
				else ns = S199;
		end
		S200: begin 
 				if (count == 200) ns = S201;
				else ns = S200;
		end
		S201: begin 
 				if (count == 201) ns = S202;
				else ns = S201;
		end
		S202: begin 
 				if (count == 202) ns = S203;
				else ns = S202;
		end
		S203: begin 
 				if (count == 203) ns = S204;
				else ns = S203;
		end
		S204: begin 
 				if (count == 204) ns = S205;
				else ns = S204;
		end
		S205: begin 
 				if (count == 205) ns = S206;
				else ns = S205;
		end
		S206: begin 
 				if (count == 206) ns = S207;
				else ns = S206;
		end
		S207: begin 
 				if (count == 207) ns = S208;
				else ns = S207;
		end
		S208: begin 
 				if (count == 208) ns = S209;
				else ns = S208;
		end
		S209: begin 
 				if (count == 209) ns = S210;
				else ns = S209;
		end
		S210: begin 
 				if (count == 210) ns = S211;
				else ns = S210;
		end
		S211: begin 
 				if (count == 211) ns = S212;
				else ns = S211;
		end
		S212: begin 
 				if (count == 212) ns = S213;
				else ns = S212;
		end
		S213: begin 
 				if (count == 213) ns = S214;
				else ns = S213;
		end
		S214: begin 
 				if (count == 214) ns = S215;
				else ns = S214;
		end
		S215: begin 
 				if (count == 215) ns = S216;
				else ns = S215;
		end
		S216: begin 
 				if (count == 216) ns = S217;
				else ns = S216;
		end
		S217: begin 
 				if (count == 217) ns = S218;
				else ns = S217;
		end
		S218: begin 
 				if (count == 218) ns = S219;
				else ns = S218;
		end
		S219: begin 
 				if (count == 219) ns = S220;
				else ns = S219;
		end
		S220: begin 
 				if (count == 220) ns = S221;
				else ns = S220;
		end
		S221: begin 
 				if (count == 221) ns = S222;
				else ns = S221;
		end
		S222: begin 
 				if (count == 222) ns = S223;
				else ns = S222;
		end
		S223: begin 
 				if (count == 223) ns = S224;
				else ns = S223;
		end
		S224: begin 
 				if (count == 224) ns = S225;
				else ns = S224;
		end
		S225: begin 
 				if (count == 225) ns = S226;
				else ns = S225;
		end
		S226: begin 
 				if (count == 226) ns = S227;
				else ns = S226;
		end
		S227: begin 
 				if (count == 227) ns = S228;
				else ns = S227;
		end
		S228: begin 
 				if (count == 228) ns = S229;
				else ns = S228;
		end
		S229: begin 
 				if (count == 229) ns = S230;
				else ns = S229;
		end
		S230: begin 
 				if (count == 230) ns = S231;
				else ns = S230;
		end
		S231: begin 
 				if (count == 231) ns = S232;
				else ns = S231;
		end
		S232: begin 
 				if (count == 232) ns = S233;
				else ns = S232;
		end
		S233: begin 
 				if (count == 233) ns = S234;
				else ns = S233;
		end
		S234: begin 
 				if (count == 234) ns = S235;
				else ns = S234;
		end
		S235: begin 
 				if (count == 235) ns = S236;
				else ns = S235;
		end
		S236: begin 
 				if (count == 236) ns = S237;
				else ns = S236;
		end
		S237: begin 
 				if (count == 237) ns = S238;
				else ns = S237;
		end
		S238: begin 
 				if (count == 238) ns = S239;
				else ns = S238;
		end
		S239: begin 
 				if (count == 239) ns = S240;
				else ns = S239;
		end
		S240: begin 
 				if (count == 240) ns = S241;
				else ns = S240;
		end
		S241: begin 
 				if (count == 241) ns = S242;
				else ns = S241;
		end
		S242: begin 
 				if (count == 242) ns = S243;
				else ns = S242;
		end
		S243: begin 
 				if (count == 243) ns = S244;
				else ns = S243;
		end
		S244: begin 
 				if (count == 244) ns = S245;
				else ns = S244;
		end
		S245: begin 
 				if (count == 245) ns = S246;
				else ns = S245;
		end
		S246: begin 
 				if (count == 246) ns = S247;
				else ns = S246;
		end
		S247: begin 
 				if (count == 247) ns = S248;
				else ns = S247;
		end
		S248: begin 
 				if (count == 248) ns = S249;
				else ns = S248;
		end
		S249: begin 
 				if (count == 249) ns = S250;
				else ns = S249;
		end
		S250: begin 
 				if (count == 250) ns = S251;
				else ns = S250;
		end
		S251: begin 
 				if (count == 251) ns = S252;
				else ns = S251;
		end
		S252: begin 
 				if (count == 252) ns = S253;
				else ns = S252;
		end
		S253: begin 
 				if (count == 253) ns = S254;
				else ns = S253;
		end
		S254: begin 
 				if (count == 254) ns = S255;
				else ns = S254;
		end
		S255: begin 
 				if (count == 255) ns = S255;
				else ns = S255;
		end
	endcase
end

// BUTTER FLY MODULE INSTANTIATIONS
butterfly_single BF_MUL1(case_select0, real_data_in0, imaginary_data_in0, 
		  	 real_data_in1, imaginary_data_in1,
		      	 real_data_out0,imaginary_data_out0,
		  	 real_data_out1, imaginary_data_out1, clock, reset);

butterfly_single BF_MUL2(case_select1, real_data_in2, imaginary_data_in2, 
		  	 real_data_in3, imaginary_data_in3,
		      	 real_data_out2,imaginary_data_out2,
		  	 real_data_out3, imaginary_data_out3, clock, reset);

butterfly_single BF_MUL3(case_select2, real_data_in4, imaginary_data_in4, 
		  	 real_data_in5, imaginary_data_in5,
		      	 real_data_out4,imaginary_data_out4,
		  	 real_data_out5, imaginary_data_out5, clock, reset);

butterfly_single BF_MUL4(case_select3, real_data_in6, imaginary_data_in6, 
		  	 real_data_in7, imaginary_data_in7,
		      	 real_data_out6,imaginary_data_out6,
		  	 real_data_out7, imaginary_data_out7, clock, reset);

always @(*)

begin
	case (ps)
		
		//stage 0 
		// input from intermediate buffer
		// output to output buffer
		S0: begin
			addr0=0;addr1=1;addr2=2;addr3=3;addr4=4;addr5=5;addr6=6;addr7=7;
			case_select0=0; case_select1=0; case_select2=0; case_select3=0;
			read_en_int_buffer=1;
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end

		S1: begin
			addr0=8;addr1=9;addr2=10;addr3=11;addr4=12;addr5=13;addr6=14;addr7=15;
			case_select0=0; case_select1=0; case_select2=0; case_select3=0;
			read_en_int_buffer=1;
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end

		S2: begin
			addr0=16;addr1=17;addr2=18;addr3=19;addr4=20;addr5=21;addr6=22;addr7=23;
			case_select0=0; case_select1=0; case_select2=0; case_select3=0;
			read_en_int_buffer=1;
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S3: begin
			addr0=24;addr1=25;addr2=26;addr3=27;addr4=28;addr5=29;addr6=30;addr7=31;
			case_select0=0; case_select1=0; case_select2=0; case_select3=0;
			read_en_int_buffer=1;
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S4: begin
			addr0=32; addr1=33; addr2=34; addr3=35; addr4=36; addr5=37; addr6=38; addr7=39;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S5: begin
			addr0=40; addr1=41; addr2=42; addr3=43; addr4=44; addr5=45; addr6=46; addr7=47;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S6: begin
			addr0=48; addr1=49; addr2=50; addr3=51; addr4=52; addr5=53; addr6=54; addr7=55;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S7: begin
			addr0=56; addr1=57; addr2=58; addr3=59; addr4=60; addr5=61; addr6=62; addr7=63;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S8: begin
			addr0=64; addr1=65; addr2=66; addr3=67; addr4=68; addr5=69; addr6=70; addr7=71;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S9: begin
			addr0=72; addr1=73; addr2=74; addr3=75; addr4=76; addr5=77; addr6=78; addr7=79;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S10: begin
			addr0=80; addr1=81; addr2=82; addr3=83; addr4=84; addr5=85; addr6=86; addr7=87;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S11: begin
			addr0=88; addr1=89; addr2=90; addr3=91; addr4=92; addr5=93; addr6=94; addr7=95;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S12: begin
			addr0=96; addr1=97; addr2=98; addr3=99; addr4=100; addr5=101; addr6=102; addr7=103;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S13: begin
			addr0=104; addr1=105; addr2=106; addr3=107; addr4=108; addr5=109; addr6=110; addr7=111;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S14: begin
			addr0=112; addr1=113; addr2=114; addr3=115; addr4=116; addr5=117; addr6=118; addr7=119;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S15: begin
			addr0=120; addr1=121; addr2=122; addr3=123; addr4=124; addr5=125; addr6=126; addr7=127;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S16: begin
			addr0=128; addr1=129; addr2=130; addr3=131; addr4=132; addr5=133; addr6=134; addr7=135;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;		
		end
		S17: begin
			addr0=136; addr1=137; addr2=138; addr3=139; addr4=140; addr5=141; addr6=142; addr7=143;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S18: begin
			addr0=144; addr1=145; addr2=146; addr3=147; addr4=148; addr5=149; addr6=150; addr7=151;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S19: begin
			addr0=152; addr1=153; addr2=154; addr3=155; addr4=156; addr5=157; addr6=158; addr7=159;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S20: begin
			addr0=160; addr1=161; addr2=162; addr3=163; addr4=164; addr5=165; addr6=166; addr7=167;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S21: begin
			addr0=168; addr1=169; addr2=170; addr3=171; addr4=172; addr5=173; addr6=174; addr7=175;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S22: begin
			addr0=176; addr1=177; addr2=178; addr3=179; addr4=180; addr5=181; addr6=182; addr7=183;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S23: begin
			addr0=184; addr1=185; addr2=186; addr3=187; addr4=188; addr5=189; addr6=190; addr7=191;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S24: begin
			addr0=192; addr1=193; addr2=194; addr3=195; addr4=196; addr5=197; addr6=198; addr7=199;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S25: begin
			addr0=200; addr1=201; addr2=202; addr3=203; addr4=204; addr5=205; addr6=206; addr7=207;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S26: begin
			addr0=208; addr1=209; addr2=210; addr3=211; addr4=212; addr5=213; addr6=214; addr7=215;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S27: begin
			addr0=216; addr1=217; addr2=218; addr3=219; addr4=220; addr5=221; addr6=222; addr7=223;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S28: begin
			addr0=224; addr1=225; addr2=226; addr3=227; addr4=228; addr5=229; addr6=230; addr7=231;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S29: begin
			addr0=232; addr1=233; addr2=234; addr3=235; addr4=236; addr5=237; addr6=238; addr7=239;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S30: begin
			addr0=240; addr1=241; addr2=242; addr3=243; addr4=244; addr5=245; addr6=246; addr7=247;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S31: begin
			addr0=248; addr1=249; addr2=250; addr3=251; addr4=252; addr5=253; addr6=254; addr7=255;
			case_select0 = 0; case_select1 = 0; case_select2 = 0; case_select3 = 0;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		
		//stage 1 
		// input from output buffer
		// output to output buffer
		
		S32: begin
			addr0=0; addr1=2; addr2=1; addr3=3; addr4=4; addr5=6; addr6=5; addr7=7;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S33: begin
			addr0=8; addr1=10; addr2=9; addr3=11; addr4=12; addr5=14; addr6=13; addr7=15;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S34: begin
			addr0=16; addr1=18; addr2=17; addr3=19; addr4=20; addr5=22; addr6=21; addr7=23;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S35: begin
			addr0=24; addr1=26; addr2=25; addr3=27; addr4=28; addr5=30; addr6=29; addr7=31;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S36: begin
			addr0=32; addr1=34; addr2=33; addr3=35; addr4=36; addr5=38; addr6=37; addr7=39;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S37: begin
			addr0=40; addr1=42; addr2=41; addr3=43; addr4=44; addr5=46; addr6=45; addr7=47;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S38: begin
			addr0=48; addr1=50; addr2=49; addr3=51; addr4=52; addr5=54; addr6=53; addr7=55;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S39: begin
			addr0=56; addr1=58; addr2=57; addr3=59; addr4=60; addr5=62; addr6=61; addr7=63;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S40: begin
			addr0=64; addr1=66; addr2=65; addr3=67; addr4=68; addr5=70; addr6=69; addr7=71;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S41: begin
			addr0=72; addr1=74; addr2=73; addr3=75; addr4=76; addr5=78; addr6=77; addr7=79;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S42: begin
			addr0=80; addr1=82; addr2=81; addr3=83; addr4=84; addr5=86; addr6=85; addr7=87;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S43: begin
			addr0=88; addr1=90; addr2=89; addr3=91; addr4=92; addr5=94; addr6=93; addr7=95;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S44: begin
			addr0=96; addr1=98; addr2=97; addr3=99; addr4=100; addr5=102; addr6=101; addr7=103;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S45: begin
			addr0=104; addr1=106; addr2=105; addr3=107; addr4=108; addr5=110; addr6=109; addr7=111;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S46: begin
			addr0=112; addr1=114; addr2=113; addr3=115; addr4=116; addr5=118; addr6=117; addr7=119;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S47: begin
			addr0=120; addr1=122; addr2=121; addr3=123; addr4=124; addr5=126; addr6=125; addr7=127;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S48: begin
			addr0=128; addr1=130; addr2=129; addr3=131; addr4=132; addr5=134; addr6=133; addr7=135;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S49: begin
			addr0=136; addr1=138; addr2=137; addr3=139; addr4=140; addr5=142; addr6=141; addr7=143;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S50: begin
			addr0=144; addr1=146; addr2=145; addr3=147; addr4=148; addr5=150; addr6=149; addr7=151;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S51: begin
			addr0=152; addr1=154; addr2=153; addr3=155; addr4=156; addr5=158; addr6=157; addr7=159;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S52: begin
			addr0=160; addr1=162; addr2=161; addr3=163; addr4=164; addr5=166; addr6=165; addr7=167;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S53: begin
			addr0=168; addr1=170; addr2=169; addr3=171; addr4=172; addr5=174; addr6=173; addr7=175;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S54: begin
			addr0=176; addr1=178; addr2=177; addr3=179; addr4=180; addr5=182; addr6=181; addr7=183;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S55: begin
			addr0=184; addr1=186; addr2=185; addr3=187; addr4=188; addr5=190; addr6=189; addr7=191;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S56: begin
			addr0=192; addr1=194; addr2=193; addr3=195; addr4=196; addr5=198; addr6=197; addr7=199;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S57: begin
			addr0=200; addr1=202; addr2=201; addr3=203; addr4=204; addr5=206; addr6=205; addr7=207;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S58: begin
			addr0=208; addr1=210; addr2=209; addr3=211; addr4=212; addr5=214; addr6=213; addr7=215;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S59: begin
			addr0=216; addr1=218; addr2=217; addr3=219; addr4=220; addr5=222; addr6=221; addr7=223;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S60: begin
			addr0=224; addr1=226; addr2=225; addr3=227; addr4=228; addr5=230; addr6=229; addr7=231;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S61: begin
			addr0=232; addr1=234; addr2=233; addr3=235; addr4=236; addr5=238; addr6=237; addr7=239;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S62: begin
			addr0=240; addr1=242; addr2=241; addr3=243; addr4=244; addr5=246; addr6=245; addr7=247;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S63: begin
			addr0=248; addr1=250; addr2=249; addr3=251; addr4=252; addr5=254; addr6=253; addr7=255;
			case_select0 = 0; case_select1 = 64; case_select2 = 0; case_select3 = 64;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		
		//stage 2 
		// input from output buffer
		// output to output buffer
		
		S64: begin
			addr0=0; addr1=4; addr2=1; addr3=5; addr4=2; addr5=6; addr6=3; addr7=7;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S65: begin
			addr0=8; addr1=12; addr2=9; addr3=13; addr4=10; addr5=14; addr6=11; addr7=15;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S66: begin
			addr0=16; addr1=20; addr2=17; addr3=21; addr4=18; addr5=22; addr6=19; addr7=23;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S67: begin
			addr0=24; addr1=28; addr2=25; addr3=29; addr4=26; addr5=30; addr6=27; addr7=31;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S68: begin
			addr0=32; addr1=36; addr2=33; addr3=37; addr4=34; addr5=38; addr6=35; addr7=39;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S69: begin
			addr0=40; addr1=44; addr2=41; addr3=45; addr4=42; addr5=46; addr6=43; addr7=47;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S70: begin
			addr0=48; addr1=52; addr2=49; addr3=53; addr4=50; addr5=54; addr6=51; addr7=55;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S71: begin
			addr0=56; addr1=60; addr2=57; addr3=61; addr4=58; addr5=62; addr6=59; addr7=63;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S72: begin
			addr0=64; addr1=68; addr2=65; addr3=69; addr4=66; addr5=70; addr6=67; addr7=71;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S73: begin
			addr0=72; addr1=76; addr2=73; addr3=77; addr4=74; addr5=78; addr6=75; addr7=79;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S74: begin
			addr0=80; addr1=84; addr2=81; addr3=85; addr4=82; addr5=86; addr6=83; addr7=87;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S75: begin
			addr0=88; addr1=92; addr2=89; addr3=93; addr4=90; addr5=94; addr6=91; addr7=95;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S76: begin
			addr0=96; addr1=100; addr2=97; addr3=101; addr4=98; addr5=102; addr6=99; addr7=103;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S77: begin
			addr0=104; addr1=108; addr2=105; addr3=109; addr4=106; addr5=110; addr6=107; addr7=111;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S78: begin
			addr0=112; addr1=116; addr2=113; addr3=117; addr4=114; addr5=118; addr6=115; addr7=119;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S79: begin
			addr0=120; addr1=124; addr2=121; addr3=125; addr4=122; addr5=126; addr6=123; addr7=127;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S80: begin
			addr0=128; addr1=132; addr2=129; addr3=133; addr4=130; addr5=134; addr6=131; addr7=135;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S81: begin
			addr0=136; addr1=140; addr2=137; addr3=141; addr4=138; addr5=142; addr6=139; addr7=143;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S82: begin
			addr0=144; addr1=148; addr2=145; addr3=149; addr4=146; addr5=150; addr6=147; addr7=151;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S83: begin
			addr0=152; addr1=156; addr2=153; addr3=157; addr4=154; addr5=158; addr6=155; addr7=159;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S84: begin
			addr0=160; addr1=164; addr2=161; addr3=165; addr4=162; addr5=166; addr6=163; addr7=167;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S85: begin
			addr0=168; addr1=172; addr2=169; addr3=173; addr4=170; addr5=174; addr6=171; addr7=175;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S86: begin
			addr0=176; addr1=180; addr2=177; addr3=181; addr4=178; addr5=182; addr6=179; addr7=183;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S87: begin
			addr0=184; addr1=188; addr2=185; addr3=189; addr4=186; addr5=190; addr6=187; addr7=191;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S88: begin
			addr0=192; addr1=196; addr2=193; addr3=197; addr4=194; addr5=198; addr6=195; addr7=199;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S89: begin
			addr0=200; addr1=204; addr2=201; addr3=205; addr4=202; addr5=206; addr6=203; addr7=207;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S90: begin
			addr0=208; addr1=212; addr2=209; addr3=213; addr4=210; addr5=214; addr6=211; addr7=215;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S91: begin
			addr0=216; addr1=220; addr2=217; addr3=221; addr4=218; addr5=222; addr6=219; addr7=223;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S92: begin
			addr0=224; addr1=228; addr2=225; addr3=229; addr4=226; addr5=230; addr6=227; addr7=231;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S93: begin
			addr0=232; addr1=236; addr2=233; addr3=237; addr4=234; addr5=238; addr6=235; addr7=239;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S94: begin
			addr0=240; addr1=244; addr2=241; addr3=245; addr4=242; addr5=246; addr6=243; addr7=247;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S95: begin
			addr0=248; addr1=252; addr2=249; addr3=253; addr4=250; addr5=254; addr6=251; addr7=255;
			case_select0 = 0; case_select1 = 32; case_select2 = 64; case_select3 = 96;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		
		//stage 3 
		// input from output buffer
		// output to output buffer
		
		S96: begin
			addr0=0; addr1=8; addr2=1; addr3=9; addr4=2; addr5=10; addr6=3; addr7=11;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S97: begin
			addr0=4; addr1=12; addr2=5; addr3=13; addr4=6; addr5=14; addr6=7; addr7=15;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; // 1
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S98: begin
			addr0=16; addr1=24; addr2=17; addr3=25; addr4=18; addr5=26; addr6=19; addr7=27;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S99: begin
			addr0=20; addr1=28; addr2=21; addr3=29; addr4=22; addr5=30; addr6=23; addr7=31;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; // 2
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S100: begin
			addr0=32; addr1=40; addr2=33; addr3=41; addr4=34; addr5=42; addr6=35; addr7=43;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S101: begin
			addr0=36; addr1=44; addr2=37; addr3=45; addr4=38; addr5=46; addr6=39; addr7=47;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //3
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S102: begin
			addr0=48; addr1=56; addr2=49; addr3=57; addr4=50; addr5=58; addr6=51; addr7=59;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S103: begin
			addr0=52; addr1=60; addr2=53; addr3=61; addr4=54; addr5=62; addr6=55; addr7=63;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //4
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S104: begin
			addr0=64; addr1=72; addr2=65; addr3=73; addr4=66; addr5=74; addr6=67; addr7=75;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S105: begin
			addr0=68; addr1=76; addr2=69; addr3=77; addr4=70; addr5=78; addr6=71; addr7=79;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //5
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S106: begin
			addr0=80; addr1=88; addr2=81; addr3=89; addr4=82; addr5=90; addr6=83; addr7=91;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S107: begin
			addr0=84; addr1=92; addr2=85; addr3=93; addr4=86; addr5=94; addr6=87; addr7=95;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //6
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S108: begin
			addr0=96; addr1=104; addr2=97; addr3=105; addr4=98; addr5=106; addr6=99; addr7=107;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S109: begin
			addr0=100; addr1=108; addr2=101; addr3=109; addr4=102; addr5=110; addr6=103; addr7=111;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //7
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S110: begin
			addr0=112; addr1=120; addr2=113; addr3=121; addr4=114; addr5=122; addr6=115; addr7=123;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S111: begin
			addr0=116; addr1=124; addr2=117; addr3=125; addr4=118; addr5=126; addr6=119; addr7=127;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //8
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S112: begin
			addr0=128; addr1=136; addr2=129; addr3=137; addr4=130; addr5=138; addr6=131; addr7=139;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S113: begin
			addr0=132; addr1=140; addr2=133; addr3=141; addr4=134; addr5=142; addr6=135; addr7=143;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //9
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S114: begin
			addr0=144; addr1=152; addr2=145; addr3=153; addr4=146; addr5=154; addr6=147; addr7=155;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S115: begin
			addr0=148; addr1=156; addr2=149; addr3=157; addr4=150; addr5=158; addr6=151; addr7=159;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //10
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S116: begin
			addr0=160; addr1=168; addr2=161; addr3=169; addr4=162; addr5=170; addr6=163; addr7=171;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S117: begin
			addr0=164; addr1=172; addr2=165; addr3=173; addr4=166; addr5=174; addr6=167; addr7=175;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //11
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S118: begin
			addr0=176; addr1=184; addr2=177; addr3=185; addr4=178; addr5=186; addr6=179; addr7=187;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S119: begin
			addr0=180; addr1=188; addr2=181; addr3=189; addr4=182; addr5=190; addr6=183; addr7=191;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //12
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S120: begin
			addr0=192; addr1=200; addr2=193; addr3=201; addr4=194; addr5=202; addr6=195; addr7=203;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S121: begin
			addr0=196; addr1=204; addr2=197; addr3=205; addr4=198; addr5=206; addr6=199; addr7=207;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //13
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S122: begin
			addr0=208; addr1=216; addr2=209; addr3=217; addr4=210; addr5=218; addr6=211; addr7=219;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S123: begin
			addr0=212; addr1=220; addr2=213; addr3=221; addr4=214; addr5=222; addr6=215; addr7=223;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //14
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S124: begin
			addr0=224; addr1=232; addr2=225; addr3=233; addr4=226; addr5=234; addr6=227; addr7=235;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S125: begin
			addr0=228; addr1=236; addr2=229; addr3=237; addr4=230; addr5=238; addr6=231; addr7=239;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112; //15
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S126: begin
			addr0=240; addr1=248; addr2=241; addr3=249; addr4=242; addr5=250; addr6=243; addr7=251;
			case_select0 = 0; case_select1 = 16; case_select2 = 32; case_select3 = 48;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S127: begin
			addr0=244; addr1=252; addr2=245; addr3=253; addr4=246; addr5=254; addr6=247; addr7=255;
			case_select0 = 64; case_select1 = 80; case_select2 = 96; case_select3 = 112;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		
		//stage 4 
		// input from output buffer
		// output to output buffer
		
		S128: begin
			addr0=0; addr1=16; addr2=1; addr3=17; addr4=2; addr5=18; addr6=3; addr7=19;
			case_select0 = 0; case_select1 = 8; case_select2 = 16; case_select3 = 24;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S129: begin
			addr0=4; addr1=20; addr2=5; addr3=21; addr4=6; addr5=22; addr6=7; addr7=23;
			case_select0 = 32; case_select1 = 40; case_select2 = 48; case_select3 = 56; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S130: begin
			addr0=8; addr1=24; addr2=9; addr3=25; addr4=10; addr5=26; addr6=11; addr7=27;
			case_select0 = 64; case_select1 = 72; case_select2 = 80; case_select3 = 88;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S131: begin
			addr0=12; addr1=28; addr2=13; addr3=29; addr4=14; addr5=30; addr6=15; addr7=31;
			case_select0 = 96; case_select1 = 104; case_select2 = 112; case_select3 = 120; // 1
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S132: begin
			addr0=32; addr1=48; addr2=33; addr3=49; addr4=34; addr5=50; addr6=35; addr7=51;
			case_select0 = 0; case_select1 = 8; case_select2 = 16; case_select3 = 24;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S133: begin
			addr0=36; addr1=52; addr2=37; addr3=53; addr4=38; addr5=54; addr6=39; addr7=55;
			case_select0 = 32; case_select1 = 40; case_select2 = 48; case_select3 = 56;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S134: begin
			addr0=40; addr1=56; addr2=41; addr3=57; addr4=42; addr5=58; addr6=43; addr7=59;
			case_select0 = 64; case_select1 = 72; case_select2 = 80; case_select3 = 88;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S135: begin
			addr0=44; addr1=60; addr2=45; addr3=61; addr4=46; addr5=62; addr6=47; addr7=63;
			case_select0 = 96; case_select1 = 104; case_select2 = 112; case_select3 = 120; //2
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S136: begin
			addr0=64; addr1=80; addr2=65; addr3=81; addr4=66; addr5=82; addr6=67; addr7=83;
			case_select0 = 0; case_select1 = 8; case_select2 = 16; case_select3 = 24;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S137: begin
			addr0=68; addr1=84; addr2=69; addr3=85; addr4=70; addr5=86; addr6=71; addr7=87;
			case_select0 = 32; case_select1 = 40; case_select2 = 48; case_select3 = 56; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S138: begin
			addr0=72; addr1=88; addr2=73; addr3=89; addr4=74; addr5=90; addr6=75; addr7=91;
			case_select0 = 64; case_select1 = 72; case_select2 = 80; case_select3 = 88;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S139: begin
			addr0=76; addr1=92; addr2=77; addr3=93; addr4=78; addr5=94; addr6=79; addr7=95;
			case_select0 = 96; case_select1 = 104; case_select2 = 112; case_select3 = 120; //3
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S140: begin
			addr0=96; addr1=112; addr2=97; addr3=113; addr4=98; addr5=114; addr6=99; addr7=115;
			case_select0 = 0; case_select1 = 8; case_select2 = 16; case_select3 = 24;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S141: begin
			addr0=100; addr1=116; addr2=101; addr3=117; addr4=102; addr5=118; addr6=103; addr7=119;
			case_select0 = 32; case_select1 = 40; case_select2 = 48; case_select3 = 56;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S142: begin
			addr0=104; addr1=120; addr2=105; addr3=121; addr4=106; addr5=122; addr6=107; addr7=123;
			case_select0 = 64; case_select1 = 72; case_select2 = 80; case_select3 = 88;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S143: begin
			addr0=108; addr1=124; addr2=109; addr3=125; addr4=110; addr5=126; addr6=111; addr7=127;
			case_select0 = 96; case_select1 = 104; case_select2 = 112; case_select3 = 120; //4
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S144: begin
			addr0=128; addr1=144; addr2=129; addr3=145; addr4=130; addr5=146; addr6=131; addr7=147;
			case_select0 = 0; case_select1 = 8; case_select2 = 16; case_select3 = 24;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S145: begin
			addr0=132; addr1=148; addr2=133; addr3=149; addr4=134; addr5=150; addr6=135; addr7=151;
			case_select0 = 32; case_select1 = 40; case_select2 = 48; case_select3 = 56;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S146: begin
			addr0=136; addr1=152; addr2=137; addr3=153; addr4=138; addr5=154; addr6=139; addr7=155;
			case_select0 = 64; case_select1 = 72; case_select2 = 80; case_select3 = 88;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S147: begin
			addr0=140; addr1=156; addr2=141; addr3=157; addr4=142; addr5=158; addr6=143; addr7=159;
			case_select0 = 96; case_select1 = 104; case_select2 = 112; case_select3 = 120; //5
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S148: begin
			addr0=160; addr1=176; addr2=161; addr3=177; addr4=162; addr5=178; addr6=163; addr7=179;
			case_select0 = 0; case_select1 = 8; case_select2 = 16; case_select3 = 24;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S149: begin
			addr0=164; addr1=180; addr2=165; addr3=181; addr4=166; addr5=182; addr6=167; addr7=183;
			case_select0 = 32; case_select1 = 40; case_select2 = 48; case_select3 = 56; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S150: begin
			addr0=168; addr1=184; addr2=169; addr3=185; addr4=170; addr5=186; addr6=171; addr7=187;
			case_select0 = 64; case_select1 = 72; case_select2 = 80; case_select3 = 88;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S151: begin
			addr0=172; addr1=188; addr2=173; addr3=189; addr4=174; addr5=190; addr6=175; addr7=191;
			case_select0 = 96; case_select1 = 104; case_select2 = 112; case_select3 = 120; //6
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S152: begin
			addr0=192; addr1=208; addr2=193; addr3=209; addr4=194; addr5=210; addr6=195; addr7=211;
			case_select0 = 0; case_select1 = 8; case_select2 = 16; case_select3 = 24;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S153: begin
			addr0=196; addr1=212; addr2=197; addr3=213; addr4=198; addr5=214; addr6=199; addr7=215;
			case_select0 = 32; case_select1 = 40; case_select2 = 48; case_select3 = 56; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S154: begin
			addr0=200; addr1=216; addr2=201; addr3=217; addr4=202; addr5=218; addr6=203; addr7=219;
			case_select0 = 64; case_select1 = 72; case_select2 = 80; case_select3 = 88;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S155: begin
			addr0=204; addr1=220; addr2=205; addr3=221; addr4=206; addr5=222; addr6=207; addr7=223;
			case_select0 = 96; case_select1 = 104; case_select2 = 112; case_select3 = 120; //7
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S156: begin
			addr0=224; addr1=240; addr2=225; addr3=241; addr4=226; addr5=242; addr6=227; addr7=243;
			case_select0 = 0; case_select1 = 8; case_select2 = 16; case_select3 = 24;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S157: begin
			addr0=228; addr1=244; addr2=229; addr3=245; addr4=230; addr5=246; addr6=231; addr7=247;
			case_select0 = 32; case_select1 = 40; case_select2 = 48; case_select3 = 56; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S158: begin
			addr0=232; addr1=248; addr2=233; addr3=249; addr4=234; addr5=250; addr6=235; addr7=251;
			case_select0 = 64; case_select1 = 72; case_select2 = 80; case_select3 = 88;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S159: begin
			addr0=236; addr1=252; addr2=237; addr3=253; addr4=238; addr5=254; addr6=239; addr7=255;
			case_select0 = 96; case_select1 = 104; case_select2 = 112; case_select3 = 120; //8
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		
		//stage 5
		// input from output buffer
		// output to output buffer
		
		S160: begin
			addr0=0; addr1=32; addr2=1; addr3=33; addr4=2; addr5=34; addr6=3; addr7=35;
			case_select0 = 0; case_select1 = 4; case_select2 = 8; case_select3 = 12;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S161: begin
			addr0=4; addr1=36; addr2=5; addr3=37; addr4=6; addr5=38; addr6=7; addr7=39;
			case_select0 = 16; case_select1 = 20; case_select2 = 24; case_select3 = 28; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S162: begin
			addr0=8; addr1=40; addr2=9; addr3=41; addr4=10; addr5=42; addr6=11; addr7=43;
			case_select0 = 32; case_select1 = 36; case_select2 = 40; case_select3 = 44;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S163: begin
			addr0=12; addr1=44; addr2=13; addr3=45; addr4=14; addr5=46; addr6=15; addr7=47;
			case_select0 = 48; case_select1 = 52; case_select2 = 56; case_select3 = 60; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S164: begin
			addr0=16; addr1=48; addr2=17; addr3=49; addr4=18; addr5=50; addr6=19; addr7=51;
			case_select0 = 64; case_select1 = 68; case_select2 = 72; case_select3 = 76;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S165: begin
			addr0=20; addr1=52; addr2=21; addr3=53; addr4=22; addr5=54; addr6=23; addr7=55;
			case_select0 = 80; case_select1 = 84; case_select2 = 88; case_select3 = 92;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S166: begin
			addr0=24; addr1=56; addr2=25; addr3=57; addr4=26; addr5=58; addr6=27; addr7=59;
			case_select0 = 96; case_select1 = 100; case_select2 = 104; case_select3 = 108;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S167: begin
			addr0=28; addr1=60; addr2=29; addr3=61; addr4=30; addr5=62; addr6=31; addr7=63;
			case_select0 = 112; case_select1 = 116; case_select2 = 120; case_select3 = 124; //1
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S168: begin
			addr0=64; addr1=96; addr2=65; addr3=97; addr4=66; addr5=98; addr6=67; addr7=99;
			case_select0 = 0; case_select1 = 4; case_select2 = 8; case_select3 = 12;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S169: begin
			addr0=68; addr1=100; addr2=69; addr3=101; addr4=70; addr5=102; addr6=71; addr7=103;
			case_select0 = 16; case_select1 = 20; case_select2 = 24; case_select3 = 28; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S170: begin
			addr0=72; addr1=104; addr2=73; addr3=105; addr4=74; addr5=106; addr6=75; addr7=107;
			case_select0 = 32; case_select1 = 36; case_select2 = 40; case_select3 = 44;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S171: begin
			addr0=76; addr1=108; addr2=77; addr3=109; addr4=78; addr5=110; addr6=79; addr7=111;
			case_select0 = 48; case_select1 = 52; case_select2 = 56; case_select3 = 60; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S172: begin
			addr0=80; addr1=112; addr2=81; addr3=113; addr4=82; addr5=114; addr6=83; addr7=115;
			case_select0 = 64; case_select1 = 68; case_select2 = 72; case_select3 = 76;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S173: begin
			addr0=84; addr1=116; addr2=85; addr3=117; addr4=86; addr5=118; addr6=87; addr7=119;
			case_select0 = 80; case_select1 = 84; case_select2 = 88; case_select3 = 92;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S174: begin
			addr0=88; addr1=120; addr2=89; addr3=121; addr4=90; addr5=122; addr6=91; addr7=123;
			case_select0 = 96; case_select1 = 100; case_select2 = 104; case_select3 = 108;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S175: begin
			addr0=92; addr1=124; addr2=93; addr3=125; addr4=94; addr5=126; addr6=95; addr7=127;
			case_select0 = 112; case_select1 = 116; case_select2 = 120; case_select3 = 124; //2
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S176: begin
			addr0=128; addr1=160; addr2=129; addr3=161; addr4=130; addr5=162; addr6=131; addr7=163;
			case_select0 = 0; case_select1 = 4; case_select2 = 8; case_select3 = 12;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S177: begin
			addr0=132; addr1=164; addr2=133; addr3=165; addr4=134; addr5=166; addr6=135; addr7=167;
			case_select0 = 16; case_select1 = 20; case_select2 = 24; case_select3 = 28;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S178: begin
			addr0=136; addr1=168; addr2=137; addr3=169; addr4=138; addr5=170; addr6=139; addr7=171;
			case_select0 = 32; case_select1 = 36; case_select2 = 40; case_select3 = 44;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S179: begin
			addr0=140; addr1=172; addr2=141; addr3=173; addr4=142; addr5=174; addr6=143; addr7=175;
			case_select0 = 48; case_select1 = 52; case_select2 = 56; case_select3 = 60; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S180: begin
			addr0=144; addr1=176; addr2=145; addr3=177; addr4=146; addr5=178; addr6=147; addr7=179;
			case_select0 = 64; case_select1 = 68; case_select2 = 72; case_select3 = 76;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S181: begin
			addr0=148; addr1=180; addr2=149; addr3=181; addr4=150; addr5=182; addr6=151; addr7=183;
			case_select0 = 80; case_select1 = 84; case_select2 = 88; case_select3 = 92; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S182: begin
			addr0=152; addr1=184; addr2=153; addr3=185; addr4=154; addr5=186; addr6=155; addr7=187;
			case_select0 = 96; case_select1 = 100; case_select2 = 104; case_select3 = 108;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S183: begin
			addr0=156; addr1=188; addr2=157; addr3=189; addr4=158; addr5=190; addr6=159; addr7=191;
			case_select0 = 112; case_select1 = 116; case_select2 = 120; case_select3 = 124; //3
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S184: begin
			addr0=192; addr1=224; addr2=193; addr3=225; addr4=194; addr5=226; addr6=195; addr7=227;
			case_select0 = 0; case_select1 = 4; case_select2 = 8; case_select3 = 12;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S185: begin
			addr0=196; addr1=228; addr2=197; addr3=229; addr4=198; addr5=230; addr6=199; addr7=231;
			case_select0 = 16; case_select1 = 20; case_select2 = 24; case_select3 = 28; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S186: begin
			addr0=200; addr1=232; addr2=201; addr3=233; addr4=202; addr5=234; addr6=203; addr7=235;
			case_select0 = 32; case_select1 = 36; case_select2 = 40; case_select3 = 44;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S187: begin
			addr0=204; addr1=236; addr2=205; addr3=237; addr4=206; addr5=238; addr6=207; addr7=239;
			case_select0 = 48; case_select1 = 52; case_select2 = 56; case_select3 = 60; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S188: begin
			addr0=208; addr1=240; addr2=209; addr3=241; addr4=210; addr5=242; addr6=211; addr7=243;
			case_select0 = 64; case_select1 = 68; case_select2 = 72; case_select3 = 76;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S189: begin
			addr0=212; addr1=244; addr2=213; addr3=245; addr4=214; addr5=246; addr6=215; addr7=247;
			case_select0 = 80; case_select1 = 84; case_select2 = 88; case_select3 = 92; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S190: begin
			addr0=216; addr1=248; addr2=217; addr3=249; addr4=218; addr5=250; addr6=219; addr7=251;
			case_select0 = 96; case_select1 = 100; case_select2 = 104; case_select3 = 108;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S191: begin
			addr0=220; addr1=252; addr2=221; addr3=253; addr4=222; addr5=254; addr6=223; addr7=255;
			case_select0 = 112; case_select1 = 116; case_select2 = 120; case_select3 = 124; //4
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		
		//stage 6 
		// input from output buffer
		// output to output buffer
	
		S192: begin
			addr0=0; addr1=64; addr2=1; addr3=65; addr4=2; addr5=66; addr6=3; addr7=67;
			case_select0 = 0; case_select1 = 2; case_select2 = 4; case_select3 = 6;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S193: begin
			addr0=4; addr1=68; addr2=5; addr3=69; addr4=6; addr5=70; addr6=7; addr7=71;
			case_select0 = 8; case_select1 = 10; case_select2 = 12; case_select3 = 14; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S194: begin
			addr0=8; addr1=72; addr2=9; addr3=73; addr4=10; addr5=74; addr6=11; addr7=75;
			case_select0 = 16; case_select1 = 18; case_select2 = 20; case_select3 = 22;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S195: begin
			addr0=12; addr1=76; addr2=13; addr3=77; addr4=14; addr5=78; addr6=15; addr7=79;
			case_select0 = 24; case_select1 = 26; case_select2 = 28; case_select3 = 30; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S196: begin
			addr0=16; addr1=80; addr2=17; addr3=81; addr4=18; addr5=82; addr6=19; addr7=83;
			case_select0 = 32; case_select1 = 34; case_select2 = 36; case_select3 = 38;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S197: begin
			addr0=20; addr1=84; addr2=21; addr3=85; addr4=22; addr5=86; addr6=23; addr7=87;
			case_select0 = 40; case_select1 = 42; case_select2 = 44; case_select3 = 46;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S198: begin
			addr0=24; addr1=88; addr2=25; addr3=89; addr4=26; addr5=90; addr6=27; addr7=91;
			case_select0 = 48; case_select1 = 50; case_select2 = 52; case_select3 = 54;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S199: begin
			addr0=28; addr1=92; addr2=29; addr3=93; addr4=30; addr5=94; addr6=31; addr7=95;
			case_select0 = 56; case_select1 = 58; case_select2 = 60; case_select3 = 62; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S200: begin
			addr0=32; addr1=96; addr2=33; addr3=97; addr4=34; addr5=98; addr6=35; addr7=99;
			case_select0 = 64; case_select1 = 66; case_select2 = 68; case_select3 = 70;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S201: begin
			addr0=36; addr1=100; addr2=37; addr3=101; addr4=38; addr5=102; addr6=39; addr7=103;
			case_select0 = 72; case_select1 = 74; case_select2 = 76; case_select3 = 78; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S202: begin
			addr0=40; addr1=104; addr2=41; addr3=105; addr4=42; addr5=106; addr6=43; addr7=107;
			case_select0 = 80; case_select1 = 82; case_select2 = 84; case_select3 = 86;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S203: begin
			addr0=44; addr1=108; addr2=45; addr3=109; addr4=46; addr5=110; addr6=47; addr7=111;
			case_select0 = 88; case_select1 = 90; case_select2 = 92; case_select3 = 94; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S204: begin
			addr0=48; addr1=112; addr2=49; addr3=113; addr4=50; addr5=114; addr6=51; addr7=115;
			case_select0 = 96; case_select1 = 98; case_select2 = 100; case_select3 = 102;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S205: begin
			addr0=52; addr1=116; addr2=53; addr3=117; addr4=54; addr5=118; addr6=55; addr7=119;
			case_select0 = 104; case_select1 = 106; case_select2 = 108; case_select3 = 110;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S206: begin
			addr0=56; addr1=120; addr2=57; addr3=121; addr4=58; addr5=122; addr6=59; addr7=123;
			case_select0 = 112; case_select1 = 114; case_select2 = 116; case_select3 = 118;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S207: begin
			addr0=60; addr1=124; addr2=61; addr3=125; addr4=62; addr5=126; addr6=63; addr7=127;
			case_select0 = 120; case_select1 = 122; case_select2 = 124; case_select3 = 126; //1
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S208: begin
			addr0=128; addr1=192; addr2=129; addr3=193; addr4=130; addr5=194; addr6=131; addr7=195;
			case_select0 = 0; case_select1 = 2; case_select2 = 4; case_select3 = 6;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S209: begin
			addr0=132; addr1=196; addr2=133; addr3=197; addr4=134; addr5=198; addr6=135; addr7=199;
			case_select0 = 8; case_select1 = 10; case_select2 = 12; case_select3 = 14; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S210: begin
			addr0=136; addr1=200; addr2=137; addr3=201; addr4=138; addr5=202; addr6=139; addr7=203;
			case_select0 = 16; case_select1 = 18; case_select2 = 20; case_select3 = 22;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S211: begin
			addr0=140; addr1=204; addr2=141; addr3=205; addr4=142; addr5=206; addr6=143; addr7=207;
			case_select0 = 24; case_select1 = 26; case_select2 = 28; case_select3 = 30; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S212: begin
			addr0=144; addr1=208; addr2=145; addr3=209; addr4=146; addr5=210; addr6=147; addr7=211;
			case_select0 = 32; case_select1 = 34; case_select2 = 36; case_select3 = 38;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S213: begin
			addr0=148; addr1=212; addr2=149; addr3=213; addr4=150; addr5=214; addr6=151; addr7=215;
			case_select0 = 40; case_select1 = 42; case_select2 = 44; case_select3 = 46;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S214: begin
			addr0=152; addr1=216; addr2=153; addr3=217; addr4=154; addr5=218; addr6=155; addr7=219;
			case_select0 = 48; case_select1 = 50; case_select2 = 52; case_select3 = 54;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S215: begin
			addr0=156; addr1=220; addr2=157; addr3=221; addr4=158; addr5=222; addr6=159; addr7=223;
			case_select0 = 56; case_select1 = 58; case_select2 = 60; case_select3 = 62; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S216: begin
			addr0=160; addr1=224; addr2=161; addr3=225; addr4=162; addr5=226; addr6=163; addr7=227;
			case_select0 = 64; case_select1 = 66; case_select2 = 68; case_select3 = 70;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S217: begin
			addr0=164; addr1=228; addr2=165; addr3=229; addr4=166; addr5=230; addr6=167; addr7=231;
			case_select0 = 72; case_select1 = 74; case_select2 = 76; case_select3 = 78;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S218: begin
			addr0=168; addr1=232; addr2=169; addr3=233; addr4=170; addr5=234; addr6=171; addr7=235;
			case_select0 = 80; case_select1 = 82; case_select2 = 84; case_select3 = 86;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S219: begin
			addr0=172; addr1=236; addr2=173; addr3=237; addr4=174; addr5=238; addr6=175; addr7=239;
			case_select0 = 88; case_select1 = 90; case_select2 = 92; case_select3 = 94; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S220: begin
			addr0=176; addr1=240; addr2=177; addr3=241; addr4=178; addr5=242; addr6=179; addr7=243;
			case_select0 = 96; case_select1 = 98; case_select2 = 100; case_select3 = 102;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S221: begin
			addr0=180; addr1=244; addr2=181; addr3=245; addr4=182; addr5=246; addr6=183; addr7=247;
			case_select0 = 104; case_select1 = 106; case_select2 = 108; case_select3 = 110;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S222: begin
			addr0=184; addr1=248; addr2=185; addr3=249; addr4=186; addr5=250; addr6=187; addr7=251;
			case_select0 = 112; case_select1 = 114; case_select2 = 116; case_select3 = 118;
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		S223: begin
			addr0=188; addr1=252; addr2=189; addr3=253; addr4=190; addr5=254; addr6=191; addr7=255;
			case_select0 = 120; case_select1 = 122; case_select2 = 124; case_select3 = 126; //2
			read_en_int_buffer=1;
			
			write_en_int_buffer=1;
			write_en_out_buffer=0;
		end
		
		//stage 7 
		// input from output buffer
		// output to output buffer
		
		S224: begin
			addr0=0; addr1=128; addr2=1; addr3=129; addr4=2; addr5=130; addr6=3; addr7=131;
			case_select0 = 0; case_select1 = 1; case_select2 = 2; case_select3 = 3;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S225: begin
			addr0=4; addr1=132; addr2=5; addr3=133; addr4=6; addr5=134; addr6=7; addr7=135;
			case_select0 = 4; case_select1 = 5; case_select2 = 6; case_select3 = 7; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S226: begin
			addr0=8; addr1=136; addr2=9; addr3=137; addr4=10; addr5=138; addr6=11; addr7=139;
			case_select0 = 8; case_select1 = 9; case_select2 = 10; case_select3 = 11;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S227: begin
			addr0=12; addr1=140; addr2=13; addr3=141; addr4=14; addr5=142; addr6=15; addr7=143;
			case_select0 = 12; case_select1 = 13; case_select2 = 14; case_select3 = 15; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S228: begin
			addr0=16; addr1=144; addr2=17; addr3=145; addr4=18; addr5=146; addr6=19; addr7=147;
			case_select0 = 16; case_select1 = 17; case_select2 = 18; case_select3 = 19;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S229: begin
			addr0=20; addr1=148; addr2=21; addr3=149; addr4=22; addr5=150; addr6=23; addr7=151;
			case_select0 = 20; case_select1 = 21; case_select2 = 22; case_select3 = 23;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S230: begin
			addr0=24; addr1=152; addr2=25; addr3=153; addr4=26; addr5=154; addr6=27; addr7=155;
			case_select0 = 24; case_select1 = 25; case_select2 = 26; case_select3 = 27;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S231: begin
			addr0=28; addr1=156; addr2=29; addr3=157; addr4=30; addr5=158; addr6=31; addr7=159;
			case_select0 = 28; case_select1 = 29; case_select2 = 30; case_select3 = 31; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S232: begin
			addr0=32; addr1=160; addr2=33; addr3=161; addr4=34; addr5=162; addr6=35; addr7=163;
			case_select0 = 32; case_select1 = 33; case_select2 = 34; case_select3 = 35;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S233: begin
			addr0=36; addr1=164; addr2=37; addr3=165; addr4=38; addr5=166; addr6=39; addr7=167;
			case_select0 = 36; case_select1 = 37; case_select2 = 38; case_select3 = 39; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S234: begin
			addr0=40; addr1=168; addr2=41; addr3=169; addr4=42; addr5=170; addr6=43; addr7=171;
			case_select0 = 40; case_select1 = 41; case_select2 = 42; case_select3 = 43;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S235: begin
			addr0=44; addr1=172; addr2=45; addr3=173; addr4=46; addr5=174; addr6=47; addr7=175;
			case_select0 = 44; case_select1 = 45; case_select2 = 46; case_select3 = 47; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S236: begin
			addr0=48; addr1=176; addr2=49; addr3=177; addr4=50; addr5=178; addr6=51; addr7=179;
			case_select0 = 48; case_select1 = 49; case_select2 = 50; case_select3 = 51;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S237: begin
			addr0=52; addr1=180; addr2=53; addr3=181; addr4=54; addr5=182; addr6=55; addr7=183;
			case_select0 = 52; case_select1 = 53; case_select2 = 54; case_select3 = 55;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S238: begin
			addr0=56; addr1=184; addr2=57; addr3=185; addr4=58; addr5=186; addr6=59; addr7=187;
			case_select0 = 56; case_select1 = 57; case_select2 = 58; case_select3 = 59;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S239: begin
			addr0=60; addr1=188; addr2=61; addr3=189; addr4=62; addr5=190; addr6=63; addr7=191;
			case_select0 = 60; case_select1 = 61; case_select2 = 62; case_select3 = 63; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S240: begin
			addr0=64; addr1=192; addr2=65; addr3=193; addr4=66; addr5=194; addr6=67; addr7=195;
			case_select0 = 64; case_select1 = 65; case_select2 = 66; case_select3 = 67;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S241: begin
			addr0=68; addr1=196; addr2=69; addr3=197; addr4=70; addr5=198; addr6=71; addr7=199;
			case_select0 = 68; case_select1 = 69; case_select2 = 70; case_select3 = 71; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S242: begin
			addr0=72; addr1=200; addr2=73; addr3=201; addr4=74; addr5=202; addr6=75; addr7=203;
			case_select0 = 72; case_select1 = 73; case_select2 = 74; case_select3 = 75;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S243: begin
			addr0=76; addr1=204; addr2=77; addr3=205; addr4=78; addr5=206; addr6=79; addr7=207;
			case_select0 = 76; case_select1 = 77; case_select2 = 78; case_select3 = 79; 
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S244: begin
			addr0=80; addr1=208; addr2=81; addr3=209; addr4=82; addr5=210; addr6=83; addr7=211;
			case_select0 = 80; case_select1 = 81; case_select2 = 82; case_select3 = 83;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S245: begin
			addr0=84; addr1=212; addr2=85; addr3=213; addr4=86; addr5=214; addr6=87; addr7=215;
			case_select0 = 84; case_select1 = 85; case_select2 = 86; case_select3 = 87;  
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S246: begin
			addr0=88; addr1=216; addr2=89; addr3=217; addr4=90; addr5=218; addr6=91; addr7=219;
			case_select0 = 88; case_select1 = 89; case_select2 = 90; case_select3 = 91;
			read_en_int_buffer=1;
			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S247: begin
			addr0=92; addr1=220; addr2=93; addr3=221; addr4=94; addr5=222; addr6=95; addr7=223;
			case_select0 = 92; case_select1 = 93; case_select2 = 94; case_select3 = 95; 
			read_en_int_buffer=1;			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S248: begin
			addr0=96; addr1=224; addr2=97; addr3=225; addr4=98; addr5=226; addr6=99; addr7=227;
			case_select0 = 96; case_select1 = 97; case_select2 = 98; case_select3 = 99;
			read_en_int_buffer=1;			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S249: begin
			addr0=100; addr1=228; addr2=101; addr3=229; addr4=102; addr5=230; addr6=103; addr7=231;
			case_select0 = 100; case_select1 = 101; case_select2 = 102; case_select3 = 103;
			read_en_int_buffer=1;			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S250: begin
			addr0=104; addr1=232; addr2=105; addr3=233; addr4=106; addr5=234; addr6=107; addr7=235;
			case_select0 = 104; case_select1 = 105; case_select2 = 106; case_select3 = 107;
			read_en_int_buffer=1;			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S251: begin
			addr0=108; addr1=236; addr2=109; addr3=237; addr4=110; addr5=238; addr6=111; addr7=239;
			case_select0 = 108; case_select1 = 109; case_select2 = 110; case_select3 = 111; 
			read_en_int_buffer=1;			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S252: begin
			addr0=112; addr1=240; addr2=113; addr3=241; addr4=114; addr5=242; addr6=115; addr7=243;
			case_select0 = 112; case_select1 = 113; case_select2 = 114; case_select3 = 115;
			read_en_int_buffer=1;			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S253: begin
			addr0=116; addr1=244; addr2=117; addr3=245; addr4=118; addr5=246; addr6=119; addr7=247;
			case_select0 = 116; case_select1 = 117; case_select2 = 118; case_select3 = 119;  
			read_en_int_buffer=1;			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S254: begin
			addr0=120; addr1=248; addr2=121; addr3=249; addr4=122; addr5=250; addr6=123; addr7=251;
			case_select0 = 120; case_select1 = 121; case_select2 = 122; case_select3 = 123;
			read_en_int_buffer=1;			
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
		S255: begin
			addr0=124; addr1=252; addr2=125; addr3=253; addr4=126; addr5=254; addr6=127; addr7=255;
			case_select0 = 124; case_select1 = 125; case_select2 = 126; case_select3 = 127; //1
			read_en_int_buffer=1;	
			write_en_int_buffer=0;
			write_en_out_buffer=1;
		end
	endcase
end
		 
endmodule

