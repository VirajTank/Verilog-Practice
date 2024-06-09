// overlapping 1010 sequence detector
//A 0 -> A
//A 1 -> B
//B 0 -> C
//B 1 -> B
//C 0 -> A
//C 1 -> D
//D 0 -> E
//D 1 -> B
//E 0 -> A
//E 1 -> D



module moore_1010_sequence(
	input clk,rst,
	input inp,
	output reg outp
);

reg [2:0]state;

always @( posedge clk, posedge rst )
	begin
	if( rst )
		state <= 3'b000;
	else
	begin
		case( state )
		3'b000:
		begin
		if( inp ) state <= 3'b001;
		else state <= 3'b000;
		end
		
		3'b001:
		begin
		if( inp ) state <= 3'b001;
		else state <= 3'b010;
		end
		
		3'b010:
		begin
		if( inp ) state <= 3'b011;
		else state <= 3'b000;
		end
		
		3'b011:
		begin
		if( inp ) state <= 3'b001;
		else state <= 3'b101;
		end
		
		3'b101:
		begin
		if( inp ) state <= 3'b011;
		else state <= 3'b000;
		end
		
		endcase
	end
end
always @(posedge clk, posedge rst)
	begin
	if( rst )
		outp <= 0;
	else if( state == 3'b101 )
		outp <= 1;
	else 
		outp <= 0;
	end
endmodule 