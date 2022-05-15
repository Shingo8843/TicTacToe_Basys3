`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2022 09:23:46 AM
// Design Name: 
// Module Name: Top
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


module Top(
    input CLK,
    input RESET,
    input [8:0] InputNum,
    output reg [3:0] Anode_Activate, // anode signals of the 7-segment LED display
    output reg [6:0] LED_out// cathode patterns of the 7-segment LED display

    );
    reg [1:0] CurrentState = 2'b00;
    wire [1:0] Winner;
    reg [1:0] Board [8:0];
    reg InValidIn = 1'b1;
    parameter Initial = 2'b00;
    parameter Player1 = 2'b01;
    parameter Player2 = 2'b10;
    parameter CleanUp = 2'b11;
    reg END = 1'b0;
    reg [6:0] LED1;
    wire [6:0] LED2,LED3,LED4;
    reg [3:0] COUNT;
    wire [1:0] LED_activating_counter;
    reg [19:0] refresh_counter = 0; 
    //00 => initial 
    //01 => Player1
    //10 => Player2
    reg LEDState;//2 state so it can flash the light
    LED LED00(
    .CLK(CLK),
    .Winner(Winner),
    .ZERO(Board[0]),.ONE(Board[1]),.TWO(Board[2]),.THREE(Board[3]),.FOUR(Board[4]),.FIVE(Board[5]),.SIX(Board[6]),.SEVEN(Board[7]),.EIGHT(Board[8]),
    .LED2(LED2),
    .LED3(LED3),
    .LED4(LED4)
    );
    
    assign LED_activating_counter = refresh_counter[18:17];         
    always @(*) //Change which display is shown
    begin
        case(LED_activating_counter)
        2'b00: begin
            Anode_Activate = 4'b0111; 
              end
        2'b01: begin
            Anode_Activate = 4'b1011; 
              end
        2'b10: begin
            Anode_Activate = 4'b1101; 
                end
        2'b11: begin
            Anode_Activate = 4'b1110; 
               end
        endcase
    end
    always@(*) begin
        case(Winner)
        2'b00:
            if(COUNT < 9)begin
                case(LED_activating_counter)
                2'b00: begin
                    LED_out <= LED1;
                      end
                2'b01: begin
                    LED_out <= LED2;
                      end
                2'b10: begin
                    LED_out <= LED3;
                        end
                2'b11: begin
                    LED_out <= LED4;
                       end
                endcase
            end
            else LED_out <= 7'b0000001;
        2'b01:
            LED_out <= 7'b1001111;
        2'b10:
            LED_out <= 7'b0010010;
    endcase
    end
    CheckWin CW00(.ZERO(Board[0]),.ONE(Board[1]),.TWO(Board[2]),.THREE(Board[3]),.FOUR(Board[4]),.FIVE(Board[5]),.SIX(Board[6]),.SEVEN(Board[7]),.EIGHT(Board[8]),.Winner(Winner));
    always @(posedge CLK) begin//Main Game 
        if(RESET) begin//RESET Sigal
            CurrentState <= Initial;
        end
        else begin
            case(CurrentState)
                Initial:begin
                
                    COUNT <= 4'b0;
                    refresh_counter <= 0;
                    Board[0] <= Initial;
                    Board[1] <= Initial;
                    Board[2] <= Initial;
                    Board[3] <= Initial;
                    Board[4] <= Initial;
                    Board[5] <= Initial;
                    Board[6] <= Initial;
                    Board[7] <= Initial;
                    Board[8] <= Initial;
                    LEDState <= 0;
                    LED1 <= 7'b0000001;
                    CurrentState <= Player1;
                end
                Player1:begin
                    LED1 <= 7'b1001111;
                    //Check if the The cell is already filled
                    //if filled, do nothing and loop again
                    //else get another input
                        case(InputNum)
                            9'b100000000:begin//0
                                if(Board[0] == 2'b00) begin
                                    Board[0] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                            9'b010000000:begin//1
                                if(Board[1] == 2'b00) begin
                                    Board[1] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                            9'b001000000:begin//2
                                if(Board[2] == 2'b00) begin
                                    Board[2] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                            9'b000100000:begin//3
                                if(Board[3] == 2'b00) begin
                                    Board[3] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                            9'b000010000:begin//4
                                if(Board[4] == 2'b00) begin
                                    Board[4] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                            9'b000001000:begin//5
                                if(Board[5] == 2'b00) begin
                                    Board[5] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                            9'b000000100:begin//6
                                if(Board[6] == 2'b00) begin
                                    Board[6] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                            9'b000000010:begin//7
                                if(Board[7] == 2'b00) begin
                                    Board[7] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                            9'b000000001:begin//8
                                if(Board[8] == 2'b00) begin
                                    Board[8] <= Player1;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player2;
                                end
                            end
                        endcase
                end
                Player2:begin
                    LED1 <= 7'b0010010;
                        case(InputNum)
                            9'b100000000:begin//0
                                if(Board[0] == 2'b00) begin
                                    Board[0] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                            9'b010000000:begin//1
                                if(Board[1] == 2'b00) begin
                                    Board[1] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                            9'b001000000:begin//2
                                if(Board[2] == 2'b00) begin
                                    Board[2] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                            9'b000100000:begin//3
                                if(Board[3] == 2'b00) begin
                                    Board[3] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                            9'b000010000:begin//4
                                if(Board[4] == 2'b00) begin
                                    Board[4] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                            9'b000001000:begin//5
                                if(Board[5] == 2'b00) begin
                                    Board[5] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                            9'b000000100:begin//6
                                if(Board[6] == 2'b00) begin
                                    Board[6] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                            9'b000000010:begin//7
                                if(Board[7] == 2'b00) begin
                                    Board[7] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                            9'b000000001:begin//8
                                if(Board[8] == 2'b00) begin
                                    Board[8] <= Player2;
                                    COUNT <= COUNT + 1;
                                    if(Winner !== 2'b00) CurrentState <= CleanUp;
                                    else CurrentState <= Player1;
                                end
                            end
                        endcase
                end
                CleanUp:begin
                    
                end
            endcase
            refresh_counter <= refresh_counter + 1;  
        end
        
        
    end
endmodule
