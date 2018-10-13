module output_buffer (clock, reset, startout_d, read, write_enable, addr0, addr1, addr2, addr3, addr4, addr5, addr6, addr7, data_in_0, data_in_1, data_in_2, data_in_3, data_in_4, data_in_5, data_in_6, data_in_7, out, startout);

input clock, reset;
input startout_d;
input read,write_enable;
input [7:0]addr0,addr1,addr2,addr3,addr4,addr5,addr6,addr7;
input signed [29:0] data_in_0, data_in_1, data_in_2, data_in_3, data_in_4, data_in_5, data_in_6, data_in_7;

output signed [19:0] out;
output startout;

assign startout = startout_d;

reg signed [29:0] output_buffer [0:255];
integer a,b,c,d;

reg begin_output_q;
reg [7:0]count;

wire signed [29:0] out30;

wire begin_output;

//write from FSM to output buffer
always @ (posedge clock or posedge reset) 
begin
	if (reset)
       	begin
		for (a=0; a<256; a=a+1) 
		begin
			output_buffer[a] <= #1 30'b0;
		end
	end 
	else if (write_enable) 
	begin
		output_buffer[addr0] <= #1 data_in_0;
		output_buffer[addr1] <= #1 data_in_1;
		output_buffer[addr2] <= #1 data_in_2;
		output_buffer[addr3] <= #1 data_in_3;
		output_buffer[addr4] <= #1 data_in_4;
		output_buffer[addr5] <= #1 data_in_5;
		output_buffer[addr6] <= #1 data_in_6;
		output_buffer[addr7] <= #1 data_in_7;
	end

	else
	begin
		output_buffer[addr0] <= #1 output_buffer[addr0] ; 
		output_buffer[addr1] <= #1 output_buffer[addr1] ;
		output_buffer[addr2] <= #1 output_buffer[addr2] ;
		output_buffer[addr3] <= #1 output_buffer[addr3] ;
		output_buffer[addr4] <= #1 output_buffer[addr4] ;
		output_buffer[addr5] <= #1 output_buffer[addr5] ;
		output_buffer[addr6] <= #1 output_buffer[addr6] ;
		output_buffer[addr7] <= #1 output_buffer[addr7] ;
	
	end

end

// to delay begin_output for 1 clock cycle (high for count 1 to 255)
always @ (posedge clock or posedge reset)
begin
	if (reset) 
		begin_output_q <= #1 0;
	else
		begin_output_q <= #1 begin_output;

end

// count logic
always @ (posedge clock or posedge reset)
begin
	if (reset) begin
		count <= #1 0;
	end else if (startout_d) begin
		count <= #1 8'b00000001;
	end else if (begin_output) begin
		count <= #1 count + 1;
	end else begin
		count <= #1 0;
	end
end


//logic for begin_output
assign begin_output = reset ? 0 : (startout_d|| (count>0 && count<255)) ? 1 : count == 255 ? 0 : 0;

//logic for output
assign out30 = reset ? 0 : ((begin_output_q == 1) || (startout_d == 1)) ? output_buffer[count] : 30'b0;
assign out = out30 [29:10];

endmodule



