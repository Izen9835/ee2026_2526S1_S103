`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2025 15:05:59
// Design Name: 
// Module Name: decayingRoundTimerSimSrc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decayingRoundTimerSimSrc(

    );
    
    reg clk;
    reg [7:0] score;
    reg reset;
    wire [15:0] led;
    wire isAlive;
    
    decayingRoundTimer dut (clk, reset, score, led, isAlive);
    
    initial begin
        clk = 0;
        forever #1 clk = ~clk;  // Toggle clk every 5 time units for a 10-unit clock period
    end
    
    initial begin
        reset = 1;
        score = 5;
        #10;
        reset = 0;
        score = 6;
        #3000;
        score = 10;
    end
        
//    always @(posedge clk) begin
//        $display("Time=%0t dutyCycle=%d", $time, dut._leddimmer.dutyCycle);
//    end
        
endmodule
