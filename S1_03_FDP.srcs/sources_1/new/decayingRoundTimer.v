`timescale 1ns / 1ps

// Expected behaviour
// score = 0, all 16 LEDs remain lit
// score = 1 and above, LEDs will decrement
// hence to reset, just set score = 0
// each time score increments, LEDs will reset to all 16 lit
// as score increases, round time decreases
// as of now, takes 125 points to reach minimum round time
// LEDs fade instead of just turning off (power of PWM)

module decayingRoundTimer(
    input         clk,
    input  [7:0]  score,
    output [15:0] led,
    output reg    isAlive
    );
    
    // parameters for setting game speed
    //
    // MAX_TICKS: totalTicksInRound for when score = 0
    //
    // MIN_TICKS: minimum possible totalTicksInRound 
    //            round decay is capped to this amount
    //
    // SPEED_MULTIPLIER: determines how quickly rounds decay as 
    //                   score increments
    //                   higher number means faster decay
    //
    // since counter frequency is 5k hz
    // this translates to
    // round duration at score = 0 is
    //      MAX_TICKS * (1/ ctrfreq) = 10000 * (1/ 5000) = 2 second
    //
    // round duration at score = inf is
    //      MIN_TICKS * (1/ ctrfreq) = 2500 * (1/ 5000) = 0.5 second
    //
    // score needed to reach MIN_TICKS
    //      so, score s.t. MAX_TICKS - score * SPEED_MULTIPLIER <= MIN_TICKS
    //      therefore, min score needed = (MAX_TICKS - MIN_TICKS) / SPEED_MULTIPLIER
    //      in this case, min score = 125 (more than enough...)
    //
    // max value for 17 bit MAX_TICKS/MIN_TICKS = 131071
    // which is 26 seconds (more than enough...)
    parameter [15:0] MAX_TICKS = 16'd10000;
    parameter [15:0] MIN_TICKS = 16'd2500;
    parameter [7:0] SPEED_MULTIPLIER = 8'd60;
    
    // clock used for decrementing count (affects game speed)
    wire _5khz;
    clk_5khz _5khzclk (clk, _5khz);

    reg [15:0] totalTicksInRound; // total ticks across all LEDs
    reg [15:0] ticksPerLED;       // ticks to count for each LED (before moving to the next)
    reg [15:0] ticksLeft;         // ticks left for the MSB LED
    reg [4:0]  LEDsLeft;          // number of LEDs still turned on (including MSB LED)
    reg [7:0]  prevScore;         // track previous score (for detecting score changes)
    
    // PWM brightness controller for MSB LED
    // takes (ticksLeft / ticksPerLED) to determine dutyCycle
    wire firstLEDPWM;
    ledDimmer _leddimmer (clk, ticksLeft, ticksPerLED, firstLEDPWM);

    // reg for writing synchronously to output [15:0] led
    reg [15:0] ledarr;
    assign led = ledarr;

    always @(posedge _5khz) begin

        if (score == 0) begin
            // score is set to 0 (i.e. resetted)
            totalTicksInRound <= MAX_TICKS;
            ticksPerLED <= MAX_TICKS / 16;
            ticksLeft <= MAX_TICKS / 16;
            LEDsLeft <= 5'd16;
            isAlive <= 1'b1;
            prevScore <= 8'd0;
        end 
        
        else if (isAlive && score != prevScore) begin
            // if score is updated
            if (score * SPEED_MULTIPLIER >= MAX_TICKS || MAX_TICKS - score * SPEED_MULTIPLIER <= MIN_TICKS)
                totalTicksInRound <= MIN_TICKS;
            else
                totalTicksInRound <= MAX_TICKS - (score * SPEED_MULTIPLIER);

            LEDsLeft <= 5'd16;
            ticksPerLED <= (totalTicksInRound) / 16;
            ticksLeft <= ticksPerLED;
            prevScore <= score;
            
        end 
        
        else if (ticksLeft == 0 && LEDsLeft == 1)
            // if ticks run out on last LED, player loses
            isAlive <= 0;
            
        else if (ticksLeft == 0) begin
            // if ticks run out on MSB LED, move on to the next
            LEDsLeft <= LEDsLeft - 1;
            ticksLeft <= ticksPerLED;
            
        end else 
            // otherwise, continue decrementing ticksLeft
            ticksLeft <= ticksLeft - 1;

    end

    // assigning LEDs based on LEDsLeft
    // can consider reducing frequency if need to reduce computation...
    integer i;
    always @(posedge clk) begin
        for (i = 0; i < 16; i = i + 1) begin
            if (i < LEDsLeft - 1)
                ledarr[i] <= 1'b1;
            else if (i == LEDsLeft - 1)
                ledarr[i] <= isAlive ? firstLEDPWM // MSB LED is assigned to PWM signal
                                     : 1'b0;       // MSB LED is assigned OFF (if game ended)
            else
                ledarr[i] <= 1'b0;
        end
    end

endmodule
