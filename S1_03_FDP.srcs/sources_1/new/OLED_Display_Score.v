`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2025 17:38:38
// Design Name: 
// Module Name: OLED_Display_Score
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


module OLED_Display_Score(
    input [12:0] pixel_index,
    input [9:0] score,
    input [1:0] lives,
    output reg [15:0] oled_data
);

    // Color definitions
    parameter BLACK = 16'h0000;
    parameter WHITE = 16'hFFFF;
    parameter GREEN = 16'h07E0;
    parameter RED = 16'hF800;
    
    // OLED dimensions
    parameter WIDTH = 96;
    parameter HEIGHT = 64;
    
    // Number dimensions
    parameter NUM_HEIGHT = 25;
    parameter NUM_WIDTH = 17;
    parameter LINE_THICKNESS = 4;
    
    // Pixel coordinates
    wire [6:0] x;
    wire [5:0] y;
    wire [6:0] x_raw;
    wire [5:0] y_raw;
    assign x_raw = pixel_index % WIDTH;
    assign y_raw = pixel_index / WIDTH;
    assign x = WIDTH - 1 - x_raw;
    assign y = HEIGHT - 1 - y_raw;
    
    // Extract individual digits
    wire [3:0] hundreds;
    wire [3:0] tens;
    wire [3:0] ones;
    assign hundreds = score / 100;
    assign tens = (score / 10) % 10;
    assign ones = score % 10;
    
    // Position calculations for centered 3-digit number (moved up)
    parameter DIGIT_SPACING = 20;
    parameter TOTAL_WIDTH = 3 * NUM_WIDTH + 2 * DIGIT_SPACING;
    parameter START_X = (WIDTH - TOTAL_WIDTH) / 2;
    parameter START_Y = 21;
    
    // Positions for each digit
    parameter HUNDREDS_X = START_X;
    parameter TENS_X = START_X + NUM_WIDTH + DIGIT_SPACING;
    parameter ONES_X = START_X + 2 * (NUM_WIDTH + DIGIT_SPACING);
    
    // Drawing wires
    wire header_pixel;
    wire hundreds_pixel;
    wire tens_pixel;
    wire ones_pixel;
    wire hearts_pixel;
    
    // Draw "SCORE" header
    assign header_pixel = draw_header(x, y);
    
    // Draw three digits
    wire [6:0] hundreds_rel_x = x - HUNDREDS_X;
    wire [5:0] hundreds_rel_y = y - START_Y;
    assign hundreds_pixel = (hundreds_rel_x < NUM_WIDTH && hundreds_rel_y < NUM_HEIGHT) && 
                            draw_digit(hundreds, hundreds_rel_x, hundreds_rel_y);
    
    wire [6:0] tens_rel_x = x - TENS_X;
    wire [5:0] tens_rel_y = y - START_Y;
    assign tens_pixel = (tens_rel_x < NUM_WIDTH && tens_rel_y < NUM_HEIGHT) && 
                        draw_digit(tens, tens_rel_x, tens_rel_y);
    
    wire [6:0] ones_rel_x = x - ONES_X;
    wire [5:0] ones_rel_y = y - START_Y;
    assign ones_pixel = (ones_rel_x < NUM_WIDTH && ones_rel_y < NUM_HEIGHT) && 
                        draw_digit(ones, ones_rel_x, ones_rel_y);
    
    // Draw hearts at bottom
    assign hearts_pixel = draw_hearts(x, y, lives);
    
    // Output pixel color
    always @(*) begin
        if (header_pixel)
            oled_data = GREEN;
        else if (hearts_pixel)
            oled_data = RED;
        else if (hundreds_pixel || tens_pixel || ones_pixel)
            oled_data = WHITE;
        else
            oled_data = BLACK;
    end
    
    // Function to draw "SCORE" header
    function draw_header;
            input [6:0] px;
            input [5:0] py;
            begin
                // "SCORE" at x=29 (was x=31)
                draw_header = (py >= 3 && py <= 10) && (
                    // S (x: 29-33, was 31-35)
                    ((px >= 29 && px <= 33) && (py >= 3 && py <= 4)) ||
                    ((px >= 29 && px <= 30) && (py >= 4 && py <= 6)) ||
                    ((px >= 29 && px <= 33) && (py >= 6 && py <= 7)) ||
                    ((px >= 32 && px <= 33) && (py >= 7 && py <= 9)) ||
                    ((px >= 29 && px <= 33) && (py >= 9 && py <= 10)) ||
                    
                    // C (x: 37-41, was 39-43)
                    ((px >= 37 && px <= 41) && (py >= 3 && py <= 4)) ||
                    ((px >= 37 && px <= 38) && (py >= 4 && py <= 9)) ||
                    ((px >= 37 && px <= 41) && (py >= 9 && py <= 10)) ||
                    
                    // O (x: 45-49, was 47-51)
                    ((px >= 45 && px <= 49) && (py >= 3 && py <= 4)) ||
                    ((px >= 45 && px <= 46) && (py >= 4 && py <= 9)) ||
                    ((px >= 48 && px <= 49) && (py >= 4 && py <= 9)) ||
                    ((px >= 45 && px <= 49) && (py >= 9 && py <= 10)) ||
                    
                    // R (x: 53-57, was 55-59)
                    ((px >= 53 && px <= 54) && (py >= 3 && py <= 10)) ||
                    ((px >= 53 && px <= 57) && (py >= 3 && py <= 4)) ||
                    ((px >= 56 && px <= 57) && (py >= 4 && py <= 6)) ||
                    ((px >= 53 && px <= 57) && (py >= 6 && py <= 7)) ||
                    ((px >= 55 && px <= 56) && (py >= 7 && py <= 8)) ||
                    ((px >= 56 && px <= 57) && (py >= 8 && py <= 10)) ||
                    
                    // E (x: 61-65, was 63-67)
                    ((px >= 61 && px <= 65) && (py >= 3 && py <= 4)) ||
                    ((px >= 61 && px <= 62) && (py >= 4 && py <= 9)) ||
                    ((px >= 61 && px <= 64) && (py >= 6 && py <= 7)) ||
                    ((px >= 61 && px <= 65) && (py >= 9 && py <= 10))
                );
            end
        endfunction
    
        // Function to draw hearts
        function draw_hearts;
                input [6:0] px;
                input [5:0] py;
                input [1:0] num_lives;
                reg heart1, heart2, heart3;
                begin
                    // Hearts moved 1 pixel left
                    // Heart 1: x=20-29 (was 21-30)
                    heart1 = (px >= 20 && px <= 29 && py >= 55 && py <= 63) && (
                        // Top left bump
                        ((px >= 20 && px <= 23) && (py >= 55 && py <= 57)) ||
                        // Top right bump
                        ((px >= 26 && px <= 29) && (py >= 55 && py <= 57)) ||
                        // Upper middle
                        ((px >= 20 && px <= 29) && (py >= 57 && py <= 58)) ||
                        // Middle
                        ((px >= 21 && px <= 28) && (py >= 58 && py <= 60)) ||
                        // Lower middle
                        ((px >= 22 && px <= 27) && (py >= 60 && py <= 61)) ||
                        // Bottom point
                        ((px >= 23 && px <= 26) && (py >= 61 && py <= 62)) ||
                        ((px >= 24 && px <= 25) && (py >= 62 && py <= 63))
                    );
                    
                    // Heart 2: x=42-51 (was 43-52)
                    heart2 = (px >= 42 && px <= 51 && py >= 55 && py <= 63) && (
                        ((px >= 42 && px <= 45) && (py >= 55 && py <= 57)) ||
                        ((px >= 48 && px <= 51) && (py >= 55 && py <= 57)) ||
                        ((px >= 42 && px <= 51) && (py >= 57 && py <= 58)) ||
                        ((px >= 43 && px <= 50) && (py >= 58 && py <= 60)) ||
                        ((px >= 44 && px <= 49) && (py >= 60 && py <= 61)) ||
                        ((px >= 45 && px <= 48) && (py >= 61 && py <= 62)) ||
                        ((px >= 46 && px <= 47) && (py >= 62 && py <= 63))
                    );
                    
                    // Heart 3: x=64-73 (was 65-74)
                    heart3 = (px >= 64 && px <= 73 && py >= 55 && py <= 63) && (
                        ((px >= 64 && px <= 67) && (py >= 55 && py <= 57)) ||
                        ((px >= 70 && px <= 73) && (py >= 55 && py <= 57)) ||
                        ((px >= 64 && px <= 73) && (py >= 57 && py <= 58)) ||
                        ((px >= 65 && px <= 72) && (py >= 58 && py <= 60)) ||
                        ((px >= 66 && px <= 71) && (py >= 60 && py <= 61)) ||
                        ((px >= 67 && px <= 70) && (py >= 61 && py <= 62)) ||
                        ((px >= 68 && px <= 69) && (py >= 62 && py <= 63))
                    );
                    
                    // Display hearts based on lives remaining
                    case (num_lives)
                        2'd3: draw_hearts = heart1 || heart2 || heart3;
                        2'd2: draw_hearts = heart1 || heart2;
                        2'd1: draw_hearts = heart1;
                        default: draw_hearts = 0;
                    endcase
                end
            endfunction

    
    // Function to draw a digit (0-9)
    function draw_digit;
        input [3:0] digit;
        input [6:0] rel_x;
        input [5:0] rel_y;
        begin
            case (digit)
                4'd0: draw_digit = draw_0(rel_x, rel_y);
                4'd1: draw_digit = draw_1(rel_x, rel_y);
                4'd2: draw_digit = draw_2(rel_x, rel_y);
                4'd3: draw_digit = draw_3(rel_x, rel_y);
                4'd4: draw_digit = draw_4(rel_x, rel_y);
                4'd5: draw_digit = draw_5(rel_x, rel_y);
                4'd6: draw_digit = draw_6(rel_x, rel_y);
                4'd7: draw_digit = draw_7(rel_x, rel_y);
                4'd8: draw_digit = draw_8(rel_x, rel_y);
                4'd9: draw_digit = draw_9(rel_x, rel_y);
                default: draw_digit = 0;
            endcase
        end
    endfunction
    
    // Drawing functions for digits 0-9
    function draw_0;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_0 = ((ry >= 0 && ry < 4) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 21 && ry < 25) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= 0 && rx < LINE_THICKNESS) && (ry >= 0 && ry < NUM_HEIGHT)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 0 && ry < NUM_HEIGHT));
        end
    endfunction
    
    function draw_1;
            input [6:0] rx;
            input [5:0] ry;
            begin
                draw_1 = 
                    // Top-left diagonal/bar (upper left corner)
                    ((rx >= 0 && rx < LINE_THICKNESS+2) && (ry >= 0 && ry < 4)) ||
                    
                    // Centered vertical bar (middle of the digit)
                    ((rx >= (NUM_WIDTH/2 - LINE_THICKNESS/2) && rx < (NUM_WIDTH/2 + LINE_THICKNESS/2)) && 
                     (ry >= 0 && ry < NUM_HEIGHT)) ||
                    
                    // Bottom bar (full width at bottom)
                    ((ry >= 21 && ry < 25) && (rx >= 0 && rx < NUM_WIDTH));
            end
        endfunction
    
    function draw_2;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_2 = ((ry >= 0 && ry < 4) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 4 && ry < 10)) ||
                     ((ry >= 10 && ry < 14) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= 0 && rx < LINE_THICKNESS) && (ry >= 14 && ry < 21)) ||
                     ((ry >= 21 && ry < 25) && (rx >= 0 && rx < NUM_WIDTH));
        end
    endfunction
    
    function draw_3;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_3 = ((ry >= 0 && ry < 4) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 10 && ry < 14) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 21 && ry < 25) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 0 && ry < NUM_HEIGHT));
        end
    endfunction
    
    function draw_4;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_4 = ((rx >= 0 && rx < LINE_THICKNESS) && (ry >= 0 && ry < 14)) ||
                     ((ry >= 10 && ry < 14) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 0 && ry < NUM_HEIGHT));
        end
    endfunction
    
    function draw_5;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_5 = ((ry >= 0 && ry < 4) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= 0 && rx < LINE_THICKNESS) && (ry >= 4 && ry < 10)) ||
                     ((ry >= 10 && ry < 14) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 14 && ry < 21)) ||
                     ((ry >= 21 && ry < 25) && (rx >= 0 && rx < NUM_WIDTH));
        end
    endfunction
    
    function draw_6;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_6 = ((ry >= 0 && ry < 4) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 10 && ry < 14) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 21 && ry < 25) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= 0 && rx < LINE_THICKNESS) && (ry >= 0 && ry < NUM_HEIGHT)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 14 && ry < 21));
        end
    endfunction
    
    function draw_7;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_7 = ((ry >= 0 && ry < 4) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 0 && ry < NUM_HEIGHT));
        end
    endfunction
    
    function draw_8;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_8 = ((ry >= 0 && ry < 4) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 10 && ry < 14) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 21 && ry < 25) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= 0 && rx < LINE_THICKNESS) && (ry >= 0 && ry < NUM_HEIGHT)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 0 && ry < NUM_HEIGHT));
        end
    endfunction
    
    function draw_9;
        input [6:0] rx;
        input [5:0] ry;
        begin
            draw_9 = ((ry >= 0 && ry < 4) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 10 && ry < 14) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((ry >= 21 && ry < 25) && (rx >= 0 && rx < NUM_WIDTH)) ||
                     ((rx >= 0 && rx < LINE_THICKNESS) && (ry >= 4 && ry < 10)) ||
                     ((rx >= (NUM_WIDTH-LINE_THICKNESS) && rx < NUM_WIDTH) && (ry >= 0 && ry < NUM_HEIGHT));
        end
    endfunction

endmodule