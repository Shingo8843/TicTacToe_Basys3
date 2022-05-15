`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2022 10:53:55 AM
// Design Name: 
// Module Name: Top_tb
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


module Check_Win_tb;
    parameter Period = 10;
    reg CLK = 1'b0;
    reg RESET = 1'b0;
    reg [8:0] InputNum = 9'b000000000;
    reg [1:0] ZERO,ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT;
    wire [1:0] Winner;
    CheckWin CW00(.ZERO(ZERO),.ONE(ONE),.TWO(TWO),.THREE(THREE),.FOUR(FOUR),.FIVE(FIVE),.SIX(SIX),.SEVEN(SEVEN),.EIGHT(EIGHT),.Winner(Winner));
    always begin
        #5;CLK <= ~CLK;
        end
    initial begin
        ZERO = 2'b00;ONE=2'b00;TWO=2'b00;THREE=2'b00;FOUR=2'b00;FIVE=2'b00;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b00;
        //Horizontal
        #20;ZERO = 2'b01;ONE=2'b01;TWO=2'b01;THREE=2'b00;FOUR=2'b00;FIVE=2'b00;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b00;
        #20;ZERO = 2'b00;ONE=2'b00;TWO=2'b00;THREE=2'b01;FOUR=2'b01;FIVE=2'b01;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b00;
        #20;ZERO = 2'b01;ONE=2'b00;TWO=2'b00;THREE=2'b00;FOUR=2'b00;FIVE=2'b00;SIX=2'b01;SEVEN=2'b01;EIGHT=2'b01;
        //Veritical
        #20;ZERO = 2'b01;ONE=2'b00;TWO=2'b00;THREE=2'b01;FOUR=2'b00;FIVE=2'b00;SIX=2'b01;SEVEN=2'b00;EIGHT=2'b00;
        #20;ZERO = 2'b00;ONE=2'b01;TWO=2'b00;THREE=2'b00;FOUR=2'b01;FIVE=2'b00;SIX=2'b00;SEVEN=2'b01;EIGHT=2'b00;
        #20;ZERO = 2'b00;ONE=2'b00;TWO=2'b10;THREE=2'b00;FOUR=2'b00;FIVE=2'b10;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b10;
        //Cross
        #20;ZERO = 2'b10;ONE=2'b00;TWO=2'b00;THREE=2'b00;FOUR=2'b10;FIVE=2'b00;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b10;
        //#20;ZERO = 2'b00;ONE=2'b00;TWO=2'b01;THREE=2'b00;FOUR=2'b01;FIVE=2'b00;SIX=2'b01;SEVEN=2'b00;EIGHT=2'b00;
        #100;$finish;
    end
endmodule
