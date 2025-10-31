module clk_1khz (
    input CLOCK,
    output reg SLOW_CLOCK
    );
    
     // log2(50,000,000) ? 26
     // basys 3 is 100Mhz
     // need 1khz = 0.001Mhz
     // divide by 100000
    reg [26:0] COUNT = 0;
    parameter DIV = 27'd500; // Approx for 1kHz on 100MHz base clock

    
    // a way to set reg initial value easily?
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