`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2025 13:16:01
// Design Name: 
// Module Name: clkVar
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


module clkVar(
    input clk,
    output reg newClk
    );
    
reg [31:0] COUNT;
parameter MAX = 7;
    
always @ (posedge clk) begin
    if (COUNT == MAX) begin
        newClk <= ~newClk;
        COUNT <= 0;
    end else begin
        COUNT <= COUNT + 1;
    end
end
    
endmodule
