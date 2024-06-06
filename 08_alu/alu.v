module alu(
    input [3:0] a,
    input [3:0] b,
    input [3:0] s,
    output reg [3:0] y
);
    integer i;

    always @(*) begin 
        case(s)
            4'b0000: 
                y = a + b; // addition
            4'b0001:
                y = a - b; // subtraction
            4'b0010:
                y = a * b; // multiplication
            4'b0011:
                if (b != 0)
                    y = a / b; // division
                else
                    y = 4'b0000; // handle division by zero
            4'b0100:
                if (b != 0)
                    y = a % b; // modulo
                else
                    y = 4'b0000; // handle division by zero
            4'b0101: begin
                y = 1;
                for (i = 0; i < b; i = i + 1) begin
                    y = y * a;
                end
            end
            4'b0110:
                y = ~a; // bitwise NOT a
            4'b0111:
                y = ~b; // bitwise NOT b
            4'b1000:
                y = a | b; // bitwise OR
            4'b1001:
                y = ~(a | b); // bitwise NOR
            4'b1010:
                y = a & b; // bitwise AND
            4'b1011:
                y = ~(a & b); // bitwise NAND
            4'b1100:
                y = a ^ b; // bitwise XOR
            4'b1101:
                y = ~(a ^ b); // bitwise XNOR
            4'b1110:
                y = a + 1; // increment 
            4'b1111:
                y = a - 1; // decrement
            default:
                y = 4'b0000; // default case
        endcase
    end 
endmodule 