`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2022 11:28:39 AM
// Design Name: 
// Module Name: CheckWin
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


module CheckWin(
    input [1:0] ZERO,
    input [1:0] ONE,
    input [1:0] TWO,
    input [1:0] THREE,
    input [1:0] FOUR,
    input [1:0] FIVE,
    input [1:0] SIX,
    input [1:0] SEVEN,
    input [1:0] EIGHT,
    output reg [1:0] Winner
    );
    // 0 1 2
    // 3 4 5
    // 6 7 8
    always @(*) begin
        if(ZERO == ONE && ONE == TWO && ZERO !== 2'b00) Winner = ZERO;
        else if(THREE == FOUR && FOUR == FIVE && THREE !== 2'b00) Winner = THREE;
        else if(SIX == SEVEN && SEVEN == EIGHT && SIX !== 2'b00) Winner = SIX;
        else if(ZERO == THREE && THREE == SIX && ZERO !== 2'b00) Winner = ZERO;
        else if(ONE == FOUR && FOUR == SEVEN && ONE !== 2'b00) Winner = ONE;
        else if(TWO == FIVE && FIVE == EIGHT && TWO !== 2'b00) Winner = TWO;
        else if(ZERO == FOUR && FOUR == EIGHT && ZERO !== 2'b00) Winner = ZERO;
        else if(TWO == FOUR && FOUR == SIX && TWO !== 2'b00) Winner = TWO;
        else Winner = 2'b00;
    end
endmodule
