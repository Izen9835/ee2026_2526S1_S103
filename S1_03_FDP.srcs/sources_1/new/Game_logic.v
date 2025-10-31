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
output [7:0]JA, output [7:0] JB
    );
    
    parameter initial_lives = 3'd5;
    
    wire [7:0] random_number; 
    wire [7:0] state; 
    //wire [7:0] state_out;
    
    wire [9:0] score; 
    //reg [9:0] score_end;
    
    wire [15:0] oled_data_left;
    wire [15:0] oled_data_right; 
    
    wire complete_flag;
    wire start_game_flag = 1'b1;
    
    wire [1:0] lives;
   // reg [1:0] lives_out;
    
    wire frame_begin;
    wire sending_pixels;
    wire sample_pixel;
    wire [12:0] pixel_index;
    wire [15:0] oled_data;
    
    wire reset;
    wire isalive;
    
    
    // random number generator module 
    
    // states logic module
    states U1 (
        .complete_flag(complete_flag),
        .clk(clk),
        .isalive(isalive),
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
    OLED_Display_Score score_screen(
        .pixel_index(pixel_index),
        .score(score),
        .lives(lives),
        .oled_data(oled_data)
    ); 
    
    // Instantiate Oled_Display module
    Oled_Display oled_unit (
        .clk(clk),
        .reset(1'b0),
        .frame_begin(frame_begin),
        .sending_pixels(sending_pixels),
        .sample_pixel(sample_pixel),
        .pixel_index(pixel_index),
        .pixel_data(oled_data),
        .cs(JA[0]),
        .sdin(JA[1]),
        .sclk(JA[3]),
        .d_cn(JA[4]),
        .resn(JA[5]),
        .vccen(JA[6]),
        .pmoden(JA[7])
    );
    
    // Instantiate decaying round timer 
    decayingRoundTimer U5(
        .clk(clk),
        .score(score),
        .led(led),
        .isAlive(isalive)
    );
    
    // Instantiate RNG Module
    RNG_Generator U6 ( 
        .clk(clk),
        .random_number(random_number)
    );
    
//    //update logic     
//    always @(posedge clk ) begin 
//        if (!reset) begin 
//            score <=0;
//            lives <= initial_lives;
// //           state <= 0;
//        end 
//        else begin
//        score <= score_end;
//        lives <= lives_out;
//  //      state <= state_out;
//        end
 //   end
    
endmodule