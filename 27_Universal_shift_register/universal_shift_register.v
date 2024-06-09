	module universal_shift_register(clk,reset,data_in,data_out,mode);
	  
	  input clk, reset;
	  input [3:0] data_in;
	  output reg [3:0] data_out;
	  input [1:0] mode;
	  
	  always @(posedge clk)
	  begin
		 if(!reset)
			data_out <= 0;
		 else
			begin
			  case(mode)
				 2'b00 : data_out <= data_out;      // do nothing
				 2'b01 : data_out <= {data_in[0], data_out[3:1]};// shift right
				 2'b10 : data_out <= {data_out[2:0], data_in[0]};// shift left
				 2'b11 : data_out <= data_in;       // parallel in parallel out
			  endcase
			end
	  end
	  
	endmodule 