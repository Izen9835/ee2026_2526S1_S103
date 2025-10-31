module ledDimmer (
    input  clk,
    input  [15:0] currentTick,  // remember to add bits
    input  [15:0] maxTick,      // remember to add bits
    output signal
    );
    
    wire [7:0] dutyCycle;
    
    // multiply first, then divide (preserves precision)
    // can consider adding maxTick/2 for rounding up to nearest integer 
    // (instead of truncating like in the current method)
    wire [18:0] temp_mult;
    assign temp_mult = currentTick * 255;
    assign dutyCycle = (temp_mult) / maxTick;

    pwmGen _ (clk, dutyCycle, signal);
     
endmodule