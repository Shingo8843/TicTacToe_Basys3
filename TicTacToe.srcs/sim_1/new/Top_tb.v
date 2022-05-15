`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 09:14:22 AM
// Design Name: 
// Module Name: Check_Win_tb
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


module Top_tb;
parameter Period = 10;
    reg CLK = 1'b0;
    reg RESET = 1'b0;
    reg [8:0] InputNum = 9'b000000000;
    wire [3:0] Anode_Activate; // anode signals of the 7-segment LED display
    wire [6:0] LED_out;
    Top Top00(.CLK(CLK),.RESET(RESET),.InputNum(InputNum),.Anode_Activate(Anode_Activate),.LED_out(LED_out));
    always begin
        #5;CLK <= ~CLK;
        end
    initial begin
        InputNum <= 9'b100000000;//1
        #100;InputNum <= 9'b010000000;//2
        #100;InputNum <= 9'b001000000;//3
        #100;InputNum <= 9'b000100000;//4
        #100;InputNum <= 9'b000010000;//5
        #100;InputNum <= 9'b000000100;//7
        #100;InputNum <= 9'b000001000;//6
        #100;InputNum <= 9'b000000001;//9
        #100;InputNum <= 9'b000000010;//8
        
        #100;$finish;
    end

endmodule