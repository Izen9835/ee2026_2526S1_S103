`timescale 1ns / 1ps

// module created to test round timer
// btnC: increment score
// btnL: reset score to 0

module decayTimerTest(
    input clk,
    input btnC,
    input btnL,
    output [15:0] led
    );
    
    reg [7:0] score;
    reg rst;

    // Debounce registers for btnC
    reg btnC_sync, btnC_last;
    reg btnC_pressed;
    
    wire isAlive;
    
    initial begin
        score = 0;
        rst = 0;
        btnC_sync = 0;
        btnC_last = 0;
        btnC_pressed = 0;
    end
        
    decayingRoundTimer _drTimer (clk, score, led, isAlive);
    
    always @(posedge clk) begin
        // Simple button debounce for btnC
        btnC_sync <= btnC;
        
        if (btnC_sync && !btnC_last)
            btnC_pressed <= 1;  // rising edge detected
        else
            btnC_pressed <= 0;
        
        btnC_last <= btnC_sync;
        
        if (btnC_pressed)
            score <= score + 1;
            
        if (btnL)
            score <= 0;

    end
    
endmodule

// code for testing brightness variation using PWM

//module decayTimerTest(
//    input clk,
//    output [15:0] led
//    );
    
//    reg [15:0] currentTick;
//    reg [15:0] maxTick = 255; // max brightness range
//    reg direction = 0; // 0: ramp up, 1: ramp down
    
//    wire ledSignal;
    
//    ledDimmer ledDut(clk, currentTick, maxTick, ledSignal);
    
//    assign led = {16{ledSignal}}; // drive all LEDs with same PWM signal
    
//    initial begin
//        currentTick = 0;
//    end
    
//    reg [19:0] slowCounter = 0;
//    wire slowEnable;
    
//    always @(posedge clk) begin
//        slowCounter <= slowCounter + 1;
//    end
//    assign slowEnable = (slowCounter == 0);
    
//    always @(posedge clk) begin
//        if (slowEnable) begin
//            if (direction == 0) begin
//                currentTick <= currentTick + 1;
//                if (currentTick == maxTick)
//                    direction <= 1;
//            end else begin
//                currentTick <= currentTick - 1;
//                if (currentTick == 0)
//                    direction <= 0;
//            end
//        end
//    end
    
//endmodule


