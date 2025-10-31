`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2025 07:15:28 AM
// Design Name: 
// Module Name: lives_update_logc
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


module lives_update_logic(
    input [7:0] state,
    input [2:0] lives,
    output reg [2:0] lives_output
    );
    parameter initial_lives = 3'd5;
   parameter start_game = 7'd0,
                    victory = 7'd1,
                    loss = 7'd2,
                    game_over = 7'd3,
                    next_game = 7'd4;
    always@(*)begin 
        lives_output = lives;
        case(state)
            loss: begin 
            if (lives >3'd0)
                lives_output = lives -1;
            else 
                lives_output = 3'd0;
            end
            start_game: lives_output = initial_lives;
            game_over:  lives_output = 0;
        endcase 
    end 
endmodule