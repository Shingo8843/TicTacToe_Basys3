`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2022 03:18:53 PM
// Design Name: 
// Module Name: LED
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


module LED(
    input CLK,
    input [1:0] Winner,
    input [1:0] ZERO,
    input [1:0] ONE,
    input [1:0] TWO,
    input [1:0] THREE,
    input [1:0] FOUR,
    input [1:0] FIVE,
    input [1:0] SIX,
    input [1:0] SEVEN,
    input [1:0] EIGHT,
    output reg [6:0] LED2,
    output reg [6:0] LED3,
    output reg [6:0] LED4
    );
    reg LEDState = 1'b0;
    reg [27:0] LEDCOUNT = 0;
    parameter FLASH = 10000000;
    always @(posedge CLK) begin
        if(LEDCOUNT < FLASH) LEDCOUNT <= LEDCOUNT + 1;
        else begin
            LEDCOUNT <= 0;
            LEDState <= ~LEDState;
        end
    end
    always @(*) begin
        case(Winner)
            2'b01:begin
                LED2 = 7'b1001111;
                LED3 = 7'b1001111;
                LED4 = 7'b1001111;
            end
            2'b10:begin
                LED2 = 7'b0010010;
                LED3 = 7'b0010010;
                LED4 = 7'b0010010;
            end          
            default:begin
                LED2 = 7'b1111111;
                LED3 = 7'b1111111;
                LED4 = 7'b1111111;
                case(ZERO)
                    2'b01:begin
                        LED2[6] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED2[6] = 1'b0;
                        else LED2[6] = 1'b1;
                    end
                endcase
                case(ONE)
                    2'b01:begin
                        LED3[6] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED3[6] = 1'b0;
                        else LED3[6] = 1'b1;
                    end
                endcase
                case(TWO)
                    2'b01:begin
                        LED4[6] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED4[6] = 1'b0;
                        else LED4[6] = 1'b1;
                    end
                endcase
                case(THREE)
                    2'b01:begin
                        LED2[0] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED2[0] = 1'b0;
                        else LED2[0] = 1'b1;
                    end
                endcase
                case(FOUR)
                    2'b01:begin
                        LED3[0] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED3[0] = 1'b0;
                        else LED3[0] = 1'b1;
                    end
                endcase
                case(FIVE)
                    2'b01:begin
                        LED4[0] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED4[0] = 1'b0;
                        else LED4[0] = 1'b1;
                    end
                endcase
                case(SIX)
                    2'b01:begin
                        LED2[3] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED2[3] = 1'b0;
                        else LED2[3] = 1'b1;
                    end
                endcase
                case(SEVEN)
                    2'b01:begin
                        LED3[3] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED3[3] = 1'b0;
                        else LED3[3] = 1'b1;
                    end
                endcase
                case(EIGHT)
                    2'b01:begin
                        LED4[3] = 1'b0;
                    end
                    2'b10:begin
                        if(LEDState)LED4[3] = 1'b0;
                        else LED4[3] = 1'b1;
                    end
                endcase
            end
        endcase
    end
endmodule
