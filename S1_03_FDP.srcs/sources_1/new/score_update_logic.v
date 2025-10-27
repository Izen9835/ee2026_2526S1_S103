`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2025 07:15:47 AM
// Design Name: 
// Module Name: score_update_logic
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


module score_update_logic(
    input [7:0] state,
    input [32:0] score,
    output reg [32:0] score_end
    );
    
    parameter start_game = 7'd0,
              victory = 7'd1,
              loss = 7'd2,
              game_over = 7'd3,
              next_game = 7'd4;
    
    always@(*)begin 
        score_end = score;
            case(state)
                victory: score_end = score +1;
                game_over: score_end = 0;
                start_game: score_end = 0;
            endcase 
        end 
endmodule
