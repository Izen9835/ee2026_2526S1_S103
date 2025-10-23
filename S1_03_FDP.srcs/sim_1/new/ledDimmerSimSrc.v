`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2025 14:08:46
// Design Name: 
// Module Name: ledDimmerSimSrc
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


module ledDimmerSimSrc(

    );
    
    reg clk;
    reg [5:0] currentTick;
    reg [5:0] maxTick;
    initial maxTick = 6'd60;
    
    wire signal;
    
    ledDimmer dut (clk, currentTick, maxTick, signal);
    
    initial begin
        clk = 0;
        forever #1 clk = ~clk;  // Toggle clk every 5 time units for a 10-unit clock period
    end
    
    initial begin
        currentTick = 6'd50;
        #2000;
        currentTick = 6'd20;
        #2000;
    end
    
    always @(dut.dutyCycle) begin
        $display("Time=%0t dutyCycle=%d", $time, dut.dutyCycle);
    end
    
endmodule
