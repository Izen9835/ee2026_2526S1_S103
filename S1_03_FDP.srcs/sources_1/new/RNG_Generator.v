module RNG_Generator    (
    input clk,
    output reg [7:0] random_number
);

    reg [7:0] lfsr = 8'b10101010; // initial value, non-zero
    wire feedback;

    // simple XOR feedback for 8-bit LFSR (using taps at bits 7 and 5)
    assign feedback = lfsr[7] ^ lfsr[5];

    always @(posedge clk) begin
        lfsr <= {lfsr[6:0], feedback};
        random_number <= lfsr;
    end

endmodule
