module carry_look_ahead_adder(
    input [3:0] a, b,
    input cin,
    output reg [3:0] sum,
    output reg carry
);
    wire [3:0] g; // Generate signals
    wire [3:0] p; // Propagate signals
    wire [3:0] c; // Carry signals

    assign g = a & b;
    assign p = a ^ b;

    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);

    always @(*) begin
        carry = g[3] | (p[3] & c[3]);

        sum = p ^ c;
    end
endmodule
