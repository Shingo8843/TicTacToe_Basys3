`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2022 04:11:49 PM
// Design Name: 
// Module Name: LED_tb
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


module LED_tb;
    reg [1:0] Winner;
    reg [1:0] ZERO;
    reg [1:0] ONE;
    reg [1:0] TWO;
    reg [1:0] THREE;
    reg [1:0] FOUR;
    reg [1:0] FIVE;
    reg [1:0] SIX;
    reg [1:0] SEVEN;
    reg [1:0] EIGHT;
    wire [6:0] LED2;
    wire [6:0] LED3;
    wire [6:0] LED4;
    parameter Period = 10;
    reg CLK = 1'b0;
    always begin
        #5;CLK <= ~CLK;
        end
LED LED00(
    .CLK(CLK),
    .Winner(Winner),
    .ZERO(ZERO),
    .ONE(ONE),
    .TWO(TWO),
    .THREE(THREE),
    .FOUR(FOUR),
    .FIVE(FIVE),
    .SIX(SIX),
    .SEVEN(SEVEN),
    .EIGHT(EIGHT),
    .LED2(LED2),
    .LED3(LED3),
    .LED4(LED4)
    );
    initial begin
        ZERO = 2'b00;ONE=2'b00;TWO=2'b00;THREE=2'b00;FOUR=2'b00;FIVE=2'b00;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b00;
        //Horizontal
        #10;ZERO = 2'b01;ONE=2'b01;TWO=2'b01;THREE=2'b00;FOUR=2'b00;FIVE=2'b00;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b00;
        #10;ZERO = 2'b00;ONE=2'b00;TWO=2'b00;THREE=2'b01;FOUR=2'b01;FIVE=2'b01;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b00;
        #10;ZERO = 2'b01;ONE=2'b00;TWO=2'b00;THREE=2'b00;FOUR=2'b00;FIVE=2'b00;SIX=2'b01;SEVEN=2'b01;EIGHT=2'b01;
        //Veritical
        #10;ZERO = 2'b01;ONE=2'b00;TWO=2'b00;THREE=2'b01;FOUR=2'b00;FIVE=2'b00;SIX=2'b01;SEVEN=2'b00;EIGHT=2'b00;
        #10;ZERO = 2'b00;ONE=2'b01;TWO=2'b00;THREE=2'b00;FOUR=2'b01;FIVE=2'b00;SIX=2'b00;SEVEN=2'b01;EIGHT=2'b00;
        #10;ZERO = 2'b00;ONE=2'b00;TWO=2'b10;THREE=2'b00;FOUR=2'b00;FIVE=2'b10;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b10;
        //Cross
        #10;ZERO = 2'b10;ONE=2'b00;TWO=2'b00;THREE=2'b00;FOUR=2'b10;FIVE=2'b00;SIX=2'b00;SEVEN=2'b00;EIGHT=2'b10;
        //#10;ZERO = 2'b00;ONE=2'b00;TWO=2'b01;THREE=2'b00;FOUR=2'b01;FIVE=2'b00;SIX=2'b01;SEVEN=2'b00;EIGHT=2'b00;
        #100;$finish;
    end
endmodule
