`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2025 13:36:03
// Design Name: 
// Module Name: Instruction_Display_Output_Selector
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


module Instruction_Display_Output_Selector(
    input gameChoice,
    output [15:0] oled_data
    );
    
reg [15:0] oled_bop_it;
reg [15:0] oled_binary_converter;

// assign oled_data = gameChoice? oled_binary_converter : oled_bop_it;

endmodule
