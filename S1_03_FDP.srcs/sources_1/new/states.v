`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2025 12:28:43 AM
// Design Name: 
// Module Name: states
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


module states( 
input wire complete_flag,
input clk,
input wire start_game_flag, 
input wire [7:0] random_number,
input [32:0]score, 
input [2:0]lives,
input wire reset,
output reg [7:0] state 
  );
  reg[7:0] next_state;
  reg[31:0] timer;
  parameter clk_freq = 100_000_000;
  parameter waiting_time = 3*clk_freq;
  parameter VICTORY_TIME = 2*clk_freq;
  parameter LOSS_TIME = 2*clk_freq;
  parameter number_of_games = 21;
  //IDLE state == begining 
  parameter start_game = 7'd0,
            victory = 7'd1,
            loss = 7'd2,
            game_over = 7'd3,
            next_game = 7'd4,
            switch_0 = 7'd5,
            switch_1 = 7'd6,
            switch_2 = 7'd7,
            switch_3 = 7'd8,
            switch_4 = 7'd9,
            switch_5 = 7'd10,
            switch_6 = 7'd11,
            switch_7 = 7'd12,
            switch_8 = 7'd13,
            switch_9 = 7'd14,
            switch_10 = 7'd15,
            switch_11 = 7'd16,
            switch_12 = 7'd17,
            switch_13 = 7'd18,
            switch_14 = 7'd19,
            switch_15 = 7'd20,
            buttonC = 7'd21,
            buttonL = 7'd22,
            buttonD = 7'd23,
            buttonR = 7'd24,
            buttonU = 7'd25;
            
    // sequential logic 
    always @(posedge clk or negedge reset ) begin
        if (!reset)
            state <= start_game;
        else 
            state <= next_state;
        end 
    // timer logic
    always @(posedge clk or negedge reset) begin 
        if (!reset) begin
            timer <= 0;
        end
        else if ((state == next_game) || (state == start_game))
               timer <= 0;
       else
           timer <= timer + 1;
    end
    
    //next-state logic
    always @(*) begin 
    next_state = state;
    case ( state )
        start_game:if (start_game_flag)next_state = next_game;
        
        victory:  if (timer >= VICTORY_TIME) next_state = next_game;
        
        loss: begin 
                if(lives == 1) next_state = game_over;
                else if (timer >= LOSS_TIME) next_state = next_game;
              end
        
        game_over: if (timer >= LOSS_TIME) next_state = start_game;
        
        next_game: begin 
                    case(random_number%number_of_games)
                        0: next_state = switch_0;
                        1: next_state = switch_1;
                        2: next_state = switch_2;
                        3: next_state = switch_3;
                        4: next_state = switch_4;
                        5: next_state = switch_5;
                        6: next_state = switch_6;
                        7: next_state = switch_7;
                        8: next_state = switch_8;
                        9: next_state = switch_9;
                        10: next_state = switch_10;
                        11: next_state = switch_11;    
                        12: next_state = switch_12;
                        13: next_state = switch_13;
                        14: next_state = switch_14;
                        15: next_state = switch_15;
                        16: next_state = buttonC;
                        17: next_state = buttonL;
                        18: next_state = buttonD;
                        19: next_state = buttonR;
                        20: next_state = buttonU;
                    endcase
                end 
        endcase
        if ((state >= switch_0) && (state<=buttonU))begin 
            if (complete_flag)
                next_state = victory;
            else if ( timer >= waiting_time )
                next_state = loss;
        end
    end
endmodule
