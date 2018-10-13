`timescale 1ns/10ps

module input_int_buffer ( clock, reset, read, startin, write_to_int, startFSM, realin, imagin, read_addr0, read_addr1, read_addr2, read_addr3, read_addr4, read_addr5, read_addr6, read_addr7, r_data0, r_data1, r_data2, r_data3, r_data4, r_data5, r_data6, r_data7, i_data0, i_data1, i_data2, i_data3, i_data4, i_data5, i_data6, i_data7, rin0, rin1, rin2, rin3, rin4, rin5, rin6, rin7, iin0, iin1, iin2, iin3, iin4, iin5, iin6, iin7, w_addr0, w_addr1, w_addr2, w_addr3, w_addr4, w_addr5, w_addr6, w_addr7);

input clock, reset, read, startin, write_to_int;

input signed [19:0] realin, imagin;
input signed [29:0] rin0, rin1, rin2, rin3, rin4, rin5, rin6, rin7, iin0, iin1, iin2, iin3, iin4, iin5, iin6, iin7;

input [7:0] read_addr0, read_addr1, read_addr2, read_addr3, read_addr4, read_addr5, read_addr6, read_addr7;
input [7:0] w_addr0, w_addr1, w_addr2, w_addr3, w_addr4, w_addr5, w_addr6, w_addr7;

output signed [29:0] r_data0, r_data1, r_data2, r_data3, r_data4, r_data5, r_data6, r_data7, i_data0, i_data1, i_data2, i_data3, i_data4, i_data5, i_data6, i_data7;
output startFSM;

wire [7:0] address;
wire write, _start_FSM;

assign startFSM = _start_FSM;

bit_reversal BR (.reset(reset), .clock(clock), .startin(startin), .address(address), .write(write));

buffer BUF (.clock(clock), .reset(reset), .realin(realin), .imagin(imagin), .address(address), .write_to_input_buffer(write), 
.read_to_intermediate_buffer(read), .read_addr0(read_addr0), .read_addr1(read_addr1), .read_addr2(read_addr2), .read_addr3(read_addr3),
 .read_addr4(read_addr4), .read_addr5(read_addr5), .read_addr6(read_addr6), .read_addr7(read_addr7), .r_data0(r_data0), .r_data1(r_data1), 
 .r_data2(r_data2), .r_data3(r_data3), .r_data4(r_data4), .r_data5(r_data5), .r_data6(r_data6), .r_data7(r_data7), .i_data0(i_data0), 
 .i_data1(i_data1), .i_data2(i_data2), .i_data3(i_data3), .i_data4(i_data4), .i_data5(i_data5), .i_data6(i_data6), .i_data7(i_data7), 
 .start_FSM(_start_FSM), .write_from_FSM(write_to_int), .real_in0(rin0), .real_in1(rin1), .real_in2(rin2), .real_in3(rin3), .real_in4(rin4), 
 .real_in5(rin5), .real_in6(rin6), .real_in7(rin7), .imag_in0(iin0), .imag_in1(iin1), .imag_in2(iin2), .imag_in3(iin3), .imag_in4(iin4), 
 .imag_in5(iin5), .imag_in6(iin6), .imag_in7(iin7), .write_addr0(w_addr0), .write_addr1(w_addr1), .write_addr2(w_addr2), .write_addr3(w_addr3), 
 .write_addr4(w_addr4), .write_addr5(w_addr5), .write_addr6(w_addr6), .write_addr7(w_addr7));




endmodule

module bit_reversal (reset, clock, startin, address, write);

input reset,clock,startin;
output reg [7:0]address; 
output reg write;

reg [7:0] counter;

always@(posedge clock or posedge reset)
begin
	if(reset) begin
		counter<= #1 8'b0;
	end 
	else if (startin) begin
		counter<= #1 8'b00000001;
	end 
	else if (counter > 0 && counter <= 255) begin
		counter<= #1 counter+1;
	end 
	else begin
		counter <= #1 8'b0;
	end

end

always @ (*) begin
	
	address={counter[0],counter[1],counter[2],counter[3],counter[4],counter[5],counter[6],counter[7]};

	if ((startin == 1)) begin
		write = 1;
	end 
	else if (counter != 0 ) begin
		write =1;
	end 
	else begin
		write = 0;
	end
end

endmodule


module buffer (clock, reset, realin, imagin, address, write_to_input_buffer, read_to_intermediate_buffer, read_addr0, read_addr1, read_addr2, read_addr3, read_addr4, read_addr5, read_addr6, read_addr7, r_data0, r_data1, r_data2, r_data3, r_data4, r_data5, r_data6, r_data7, i_data0, i_data1, i_data2, i_data3, i_data4, i_data5, i_data6, i_data7, start_FSM, write_from_FSM, real_in0, real_in1, real_in2, real_in3, real_in4, real_in5, real_in6, real_in7, imag_in0, imag_in1, imag_in2, imag_in3, imag_in4, imag_in5, imag_in6, imag_in7, write_addr0, write_addr1, write_addr2, write_addr3, write_addr4, write_addr5, write_addr6, write_addr7 );

input clock, reset, write_to_input_buffer, read_to_intermediate_buffer, write_from_FSM;
input signed [19:0] realin, imagin;
input [7:0] address;
input [7:0] read_addr0, read_addr1, read_addr2, read_addr3, read_addr4, read_addr5, read_addr6, read_addr7;
input signed [29:0] real_in0, real_in1, real_in2, real_in3, real_in4, real_in5, real_in6, real_in7, imag_in0, imag_in1, imag_in2, imag_in3, imag_in4, imag_in5, imag_in6, imag_in7;
output signed [29:0] r_data0, r_data1, r_data2, r_data3, r_data4, r_data5, r_data6, r_data7, i_data0, i_data1, i_data2, i_data3, i_data4, i_data5, i_data6, i_data7;
input [7:0] write_addr0, write_addr1, write_addr2, write_addr3, write_addr4, write_addr5, write_addr6, write_addr7;

output start_FSM;

reg signed [29:0] real_input_buffer [0:255];
reg signed [29:0] real_intermediate_buffer [0:255];
reg signed [29:0] imag_input_buffer [0:255];
reg signed [29:0] imag_intermediate_buffer [0:255];

reg write_to_int_buffer;

reg signed [29:0] realin30, imagin30;

always @ (*) begin
	realin30 = {{8{realin[19]}},realin, 2'b00};
	imagin30 = {{8{imagin[19]}},imagin, 2'b00};
end

integer i,j,k,l,m;

//write to input buffer
always @ (posedge clock or posedge reset) begin
	if (reset) begin
		for (i=0; i<256; i=i+1) begin
			real_input_buffer[i] <= #1 30'b0;
			imag_input_buffer[i] <= #1 30'b0;
		end
	end
	else if (write_to_input_buffer) begin
		real_input_buffer[address] <= #1 realin30;
		imag_input_buffer[address] <= #1 imagin30;
	end else begin
		for (j=0; j<256; j=j+1) begin
			real_input_buffer[j] <= #1 real_input_buffer[j];
			imag_input_buffer[j] <= #1 imag_input_buffer[j];	
		end
	end
end

//write enable to intermediate buffer
always @ (posedge clock or posedge reset) begin
	if (reset) begin
		write_to_int_buffer <= #1 0;
	end else if (address == 255) begin
		write_to_int_buffer <= #1 1;
	end else begin
		write_to_int_buffer <= #1 0;
	end
end

//passing write_to_int_buffer to fsm start
assign start_FSM = write_to_int_buffer;


//transfer from input buffer to intermediate buffer and 
// write back the butterfly result to intermediate buffer for 7 stages
always @ (posedge clock or posedge reset) begin
	
	if (reset) begin
		for (k=0; k<256; k=k+1) begin
			real_intermediate_buffer[k] <= #1 30'b0;
			imag_intermediate_buffer[k] <= #1 30'b0;
		end
	end else if ( write_to_int_buffer) begin
		for (l=0; l<256; l=l+1) begin
			real_intermediate_buffer[l] <= #1 real_input_buffer[l];
			imag_intermediate_buffer[l] <= #1 imag_input_buffer[l];
		end
	end
	else if (write_from_FSM)begin
		real_intermediate_buffer [write_addr0] <= #1 real_in0;
		real_intermediate_buffer [write_addr1] <= #1 real_in1;
		real_intermediate_buffer [write_addr2] <= #1 real_in2;
		real_intermediate_buffer [write_addr3] <= #1 real_in3;
		real_intermediate_buffer [write_addr4] <= #1 real_in4;
		real_intermediate_buffer [write_addr5] <= #1 real_in5;
		real_intermediate_buffer [write_addr6] <= #1 real_in6;
		real_intermediate_buffer [write_addr7] <= #1 real_in7;
		imag_intermediate_buffer [write_addr0] <= #1 imag_in0;
		imag_intermediate_buffer [write_addr1] <= #1 imag_in1;
		imag_intermediate_buffer [write_addr2] <= #1 imag_in2;
		imag_intermediate_buffer [write_addr3] <= #1 imag_in3;
		imag_intermediate_buffer [write_addr4] <= #1 imag_in4;
		imag_intermediate_buffer [write_addr5] <= #1 imag_in5;
		imag_intermediate_buffer [write_addr6] <= #1 imag_in6;
		imag_intermediate_buffer [write_addr7] <= #1 imag_in7;
	end 
	else begin
		for (m=0; m<256; m=m+1) begin
			real_intermediate_buffer[m] <= #1 real_intermediate_buffer[m];
			imag_intermediate_buffer[m] <= #1 imag_intermediate_buffer[m];
		end
	end

end

//read from intermediate buffer

assign r_data0 = read_to_intermediate_buffer ? real_intermediate_buffer [read_addr0] : 30'b0;
assign r_data1 = read_to_intermediate_buffer ? real_intermediate_buffer [read_addr1] : 30'b0;
assign r_data2 = read_to_intermediate_buffer ? real_intermediate_buffer [read_addr2] : 30'b0;
assign r_data3 = read_to_intermediate_buffer ? real_intermediate_buffer [read_addr3] : 30'b0;
assign r_data4 = read_to_intermediate_buffer ? real_intermediate_buffer [read_addr4] : 30'b0;
assign r_data5 = read_to_intermediate_buffer ? real_intermediate_buffer [read_addr5] : 30'b0;
assign r_data6 = read_to_intermediate_buffer ? real_intermediate_buffer [read_addr6] : 30'b0;
assign r_data7 = read_to_intermediate_buffer ? real_intermediate_buffer [read_addr7] : 30'b0;
assign i_data0 = read_to_intermediate_buffer ? imag_intermediate_buffer [read_addr0] : 30'b0;
assign i_data1 = read_to_intermediate_buffer ? imag_intermediate_buffer [read_addr1] : 30'b0;
assign i_data2 = read_to_intermediate_buffer ? imag_intermediate_buffer [read_addr2] : 30'b0;
assign i_data3 = read_to_intermediate_buffer ? imag_intermediate_buffer [read_addr3] : 30'b0;
assign i_data4 = read_to_intermediate_buffer ? imag_intermediate_buffer [read_addr4] : 30'b0;
assign i_data5 = read_to_intermediate_buffer ? imag_intermediate_buffer [read_addr5] : 30'b0;
assign i_data6 = read_to_intermediate_buffer ? imag_intermediate_buffer [read_addr6] : 30'b0;
assign i_data7 = read_to_intermediate_buffer ? imag_intermediate_buffer [read_addr7] : 30'b0;


endmodule



