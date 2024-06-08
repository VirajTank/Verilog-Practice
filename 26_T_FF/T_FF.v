module T_FF (
  input clk, rst,
  input t,
  output reg q,
  output q_bar
  );
  
  always@(posedge clk) begin
    if(!rst) 
		q <= 0;
    else begin
      q <= (t?~q:q);
    end
  end
  assign q_bar = ~q;
endmodule 