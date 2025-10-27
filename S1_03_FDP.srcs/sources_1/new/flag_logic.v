`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2025 06:40:27 AM
// Design Name: 
// Module Name: flag_logic
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


module flag_logic(
input clk, 
input [15:0] sw, 
input reset,
input btnC,btnU,btnL,btnR,btnD,
input wire [7:0] state,
output reg complete_flag

    );
    reg [15:0] sw_prev;
    wire[15:0] sw_changed;
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
                
        assign sw_changed = sw^sw_prev;
        
        always @(posedge clk or negedge reset) begin
                    if (!reset)
                        sw_prev <= 16'b0;
                    else
                        sw_prev <= sw;
                end    
                
        always @(posedge clk or negedge reset) begin 
            if (!reset) begin
                    complete_flag <= 1'b0;
                end
                else begin
                 case(state)
                    next_game: complete_flag <= 0;
                    victory, loss, game_over, start_game: complete_flag <= complete_flag;
                    switch_0: if(sw_changed[0])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_1: if(sw_changed[1])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_2: if(sw_changed[2])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_3: if(sw_changed[3])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_4: if(sw_changed[4])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_5: if(sw_changed[5])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_6: if(sw_changed[6])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_7: if(sw_changed[7])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_8: if(sw_changed[8])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_9: if(sw_changed[9])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_10: if(sw_changed[10])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_11: if(sw_changed[11])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_12: if(sw_changed[12])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_13: if(sw_changed[13])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_14: if(sw_changed[14])complete_flag <= 1;else complete_flag <= complete_flag;
                    switch_15: if(sw_changed[15])complete_flag <= 1;else complete_flag <= complete_flag;
                    buttonC: if(btnC)complete_flag <= 1;else complete_flag <= complete_flag;
                    buttonL: if(btnL)complete_flag <= 1;else complete_flag <= complete_flag;
                    buttonD: if (btnD)complete_flag <= 1;else complete_flag <= complete_flag;
                    buttonR: if (btnR) complete_flag <=1;else complete_flag <= complete_flag;
                    buttonU: if (btnU) complete_flag <=1;else complete_flag <= complete_flag;
                    default: complete_flag <= complete_flag;
                 endcase
            end 
        end
endmodule
