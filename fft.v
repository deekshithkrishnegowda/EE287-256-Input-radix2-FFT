
`timescale 1ns/10ps
`include "butterfly.v"
`include "FSM.v"
`include "output_buffer.v"
`include "fixed_multiplication.v"
`include "complex_multiplication.v"
`include "input_int_buffer.v"


module fft (clk,reset,realin,imagin,startin,realout,imagout,startout);

input signed [19:0] realin, imagin;
input reset,clk,startin;
output startout;
output signed [19:0] realout,imagout;

wire read_en_int_buffer1,read_en_out_buffer1;

//address from fsm to input_int_buffer and output_buffer
wire [7:0] addr_0,addr_1,addr_2,addr_3,addr_4,addr_5,addr_6,addr_7;

//write address from fsm to input buffer and output buffer
wire [7:0] wr_addr_0,wr_addr_1,wr_addr_2,wr_addr_3,wr_addr_4,wr_addr_5,wr_addr_6,wr_addr_7;

//output of fsm to input of output buffer
wire [29:0] real_0,real_1,real_2,real_3,real_4,real_5,real_6,real_7;
wire [29:0] imag_0,imag_1,imag_2,imag_3,imag_4,imag_5,imag_6,imag_7;
wire start;

//output of inp_int_buffer ot mux
wire [29:0] r_data0_int, r_data1_int, r_data2_int, r_data3_int, r_data4_int, r_data5_int, r_data6_int, r_data7_int;
wire [29:0] i_data0_int, i_data1_int, i_data2_int, i_data3_int, i_data4_int, i_data5_int, i_data6_int, i_data7_int;

wire write_reg;
wire write_en_int_buffer_reg, write_en_out_buffer_reg;

wire start_out;
wire dummy;

input_int_buffer INP_INT_BUFFER ( .clock(clk), .reset(reset), .read(read_en_int_buffer1), .startin(startin), .write_to_int(write_en_int_buffer_reg), .startFSM(start), .realin(realin), .imagin(imagin), .read_addr0(addr_0), .read_addr1(addr_1), .read_addr2(addr_2), .read_addr3(addr_3), .read_addr4(addr_4), .read_addr5(addr_5), .read_addr6(addr_6), .read_addr7(addr_7), .r_data0(r_data0_int), .r_data1(r_data1_int), .r_data2(r_data2_int), .r_data3(r_data3_int), .r_data4(r_data4_int), .r_data5(r_data5_int), .r_data6(r_data6_int), .r_data7(r_data7_int), .i_data0(i_data0_int), .i_data1(i_data1_int), .i_data2(i_data2_int), .i_data3(i_data3_int), .i_data4(i_data4_int), .i_data5(i_data5_int), .i_data6(i_data6_int), .i_data7(i_data7_int),  .rin0(real_0), .rin1(real_1), .rin2(real_2), .rin3(real_3), .rin4(real_4), .rin5(real_5), .rin6(real_6), .rin7(real_7), .iin0(imag_0), .iin1(imag_1), .iin2(imag_2), .iin3(imag_3), .iin4(imag_4), .iin5(imag_5), .iin6(imag_6), .iin7(imag_7), .w_addr0(wr_addr_0), .w_addr1(wr_addr_1), .w_addr2(wr_addr_2), .w_addr3(wr_addr_3), .w_addr4(wr_addr_4), .w_addr5(wr_addr_5), .w_addr6(wr_addr_6), .w_addr7(wr_addr_7));

FSM FSM_DUT( .clock(clk), .start(start), .reset(reset), .real_data_in0(r_data0_int), .imaginary_data_in0(i_data0_int), .real_data_in1(r_data1_int), .imaginary_data_in1(i_data1_int), .real_data_in2(r_data2_int), .imaginary_data_in2(i_data2_int), .real_data_in3(r_data3_int), .imaginary_data_in3(i_data3_int), .real_data_in4(r_data4_int), .imaginary_data_in4(i_data4_int), .real_data_in5(r_data5_int), .imaginary_data_in5(i_data5_int), .real_data_in6(r_data6_int), .imaginary_data_in6(i_data6_int), .real_data_in7(r_data7_int), .imaginary_data_in7(i_data7_int), .real_data_out0(real_0),.imaginary_data_out0(imag_0),.real_data_out1(real_1),.imaginary_data_out1(imag_1),.real_data_out2(real_2),.imaginary_data_out2(imag_2),.real_data_out3(real_3),.imaginary_data_out3(imag_3),.real_data_out4(real_4),.imaginary_data_out4(imag_4),.real_data_out5(real_5),.imaginary_data_out5(imag_5),.real_data_out6(real_6),.imaginary_data_out6(imag_6),.real_data_out7(real_7),.imaginary_data_out7(imag_7), .read_en_int_buffer(read_en_int_buffer1),.read_en_out_buffer(read_en_out_buffer1), .write_en_int_buffer_out(write_en_int_buffer_reg), .write_en_out_buffer_out(write_en_out_buffer_reg), .startout_6(start_out),.addr0(addr_0), .addr1(addr_1), .addr2(addr_2),.addr3(addr_3), .addr4(addr_4), .addr5(addr_5), .addr6(addr_6), .addr7(addr_7), .wr_addr0(wr_addr_0), .wr_addr1(wr_addr_1), .wr_addr2(wr_addr_2), .wr_addr3(wr_addr_3), .wr_addr4(wr_addr_4), .wr_addr5(wr_addr_5), .wr_addr6(wr_addr_6), .wr_addr7(wr_addr_7));

output_buffer REAL_OUT_BUFFER (.clock(clk), .reset(reset), .startout_d(start_out), .read(read_en_out_buffer1), .write_enable(write_en_out_buffer_reg), .addr0(wr_addr_0), .addr1(wr_addr_1), .addr2(wr_addr_2), .addr3(wr_addr_3), .addr4(wr_addr_4), .addr5(wr_addr_5), .addr6(wr_addr_6), .addr7(wr_addr_7), .data_in_0(real_0), .data_in_1(real_1), .data_in_2(real_2), .data_in_3(real_3), .data_in_4(real_4), .data_in_5(real_5), .data_in_6(real_6), .data_in_7(real_7), .out(realout), .startout(startout));

output_buffer IMAG_OUT_BUFFER (.clock(clk), .reset(reset), .startout_d(start_out), .read(read_en_out_buffer1), .write_enable(write_en_out_buffer_reg), .addr0(wr_addr_0), .addr1(wr_addr_1), .addr2(wr_addr_2), .addr3(wr_addr_3), .addr4(wr_addr_4), .addr5(wr_addr_5), .addr6(wr_addr_6), .addr7(wr_addr_7), .data_in_0(imag_0), .data_in_1(imag_1), .data_in_2(imag_2), .data_in_3(imag_3), .data_in_4(imag_4), .data_in_5(imag_5), .data_in_6(imag_6), .data_in_7(imag_7), .out(imagout), .startout(dummy));

endmodule
