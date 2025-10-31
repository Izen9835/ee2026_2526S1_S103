module clk_5khz (
    input CLOCK,
    output reg SLOW_CLOCK
    );
    
     // log2(50,000,000) ? 26
     // basys 3 is 100Mhz
     // need 1khz = 0.001Mhz
     // divide by 10000
    reg [26:0] COUNT = 0;
    parameter DIV = 27'd10_000;
    
    initial SLOW_CLOCK = 0;
    
    always @ (posedge CLOCK) begin
        if (COUNT == DIV - 1) begin
            COUNT <= 0;
            SLOW_CLOCK <= ~SLOW_CLOCK;
        end else begin
            COUNT <= COUNT + 1;
        end
    end
    
endmodule