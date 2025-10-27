`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2025 12:08:11 AM
// Design Name: 
// Module Name: Game_logic
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


module Game_logic( input clk, input [15:0] sw, input btnC,btnU,btnL,btnR,btnD, output [6:0]seg, output [15:0]led, output [3:0]an,
output [7:0]JB, output [7:0] JC
    );
    
    parameter initial_lives = 3'd5;
    
    reg [7:0]random_number; 
    reg [7:0] state; 
    
    reg [32:0]score; 
    reg [32:0] score_end;
    
    wire [15:0] oled_data_left;
    wire [15:0] oled_data_right; 
    
    reg complete_flag;
    reg start_game_flag;
    
    reg [2:0] lives;
    reg[2:0] lives_out;
    
    reg reset;
    
    
    // random number generator module 
    
    // states logic module
    states U1 (
        .complete_flag(complete_flag),
        .clk(clk),
        .start_game_flag(start_game_flag),
        .random_number(random_number),
        .score(score),
        .lives(lives), 
        .reset(reset),
        .state(state));
    // complete flag logic module 
    flag_logic U2 (
        .clk(clk),
        .sw(sw),
        .reset(reset),
        .btnC(btnC),
        .btnU(btnU),
        .btnL(btnL),
        .btnR(btnR),
        .btnD(btnD),
        .state(state),
        .complete_flag(complete_flag));
    // lives update logic module 
    lives_update_logic U3 ( 
        .state(state),
        .lives(lives),
        .lives_output(lives_out));
    // score update logic module
    score_update_logic U4 (
        .state(state),
        .score(score),
        .score_end(score_end));
    //oled_data_display module 
    
    
    //update logic     
    always @(posedge clk ) begin 
        if (!reset) begin 
            score <=0;
            lives <= initial_lives;
        end 
        else begin
        score <= score_end;
        lives <= lives_out;
        end
    end
    
endmodule
