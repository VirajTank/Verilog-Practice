// overlapping 1010 sequence detector
//A 0 -> A 0
//A 1 -> B 0
//B 0 -> C 0
//B 1 -> B 0
//C 0 -> A 0
//C 1 -> D 0
//D 0 -> C 1
//D 1 -> B 0



module mealy_1010_sequence(
	input clk,rst,
	input inp,
	output reg outp
);

reg [1:0]state;

always @( posedge clk, posedge rst )
	begin
	if( rst ) begin
		state <= 2'b00;
		outp <= 0;
	end
	else
	begin
		case( state )
		2'b00:
		begin
			if( inp ) begin 
			state <= 2'b01; 
			outp <= 0;
			end
			else begin 
			state <= 2'b00; 
			outp <= 0;
			end
		end
		
		2'b01:
		begin
			if( inp ) begin 
			state <= 2'b01; 
			outp <= 0;
			end 
			else begin 
			state <= 2'b10; 
			outp <= 0;
			end
		end
		
		2'b10:
		begin
			if( inp ) begin 
			state <= 2'b11; 
			outp <= 0;
			end 
			else begin 
			state <= 2'b00; 
			outp <= 0;
			end 
		end
		
		2'b11:
		begin
			if( inp ) begin 
			state <= 2'b01;
			outp <= 0;
			end
			else begin 
			state <= 2'b10; 
			outp <= 1;
			end
		end

		endcase
	end
end
endmodule 