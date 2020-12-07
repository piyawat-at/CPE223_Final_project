`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2020 05:10:40 PM
// Design Name: 
// Module Name: score_show
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


module score_show(
       input  [6:0] score,
       input  [6:0] score_high,
       output reg [13:0] seg,
       output reg [13:0] seg_high
    );
    
    always @(score)
    begin
        case(score%10)
            0 : seg[6:0] = 7'b1111110;
            1 : seg[6:0] = 7'b0110000;
            2 : seg[6:0] = 7'b1101101;
            3 : seg[6:0] = 7'b1111001;
            4 : seg[6:0] = 7'b0110011;
            5 : seg[6:0] = 7'b1011011;
            6 : seg[6:0] = 7'b1011111;
            7 : seg[6:0] = 7'b1110010;
            8 : seg[6:0] = 7'b1111111;
            9 : seg[6:0] = 7'b1111011; 
        endcase
        
        case(score_high%10)
            0 : seg_high[6:0] = 7'b1111110;
            1 : seg_high[6:0] = 7'b0110000;
            2 : seg_high[6:0] = 7'b1101101;
            3 : seg_high[6:0] = 7'b1111001;
            4 : seg_high[6:0] = 7'b0110011;
            5 : seg_high[6:0] = 7'b1011011;
            6 : seg_high[6:0] = 7'b1011111;
            7 : seg_high[6:0] = 7'b1110010;
            8 : seg_high[6:0] = 7'b1111111;
            9 : seg_high[6:0] = 7'b1111011; 
        endcase
        
         if(score < 10)
            seg[13:7] = 7'b1111110;
    else if(score < 20)
            seg[13:7] = 7'b0110000;
    else if(score < 30)
             seg[13:7] = 7'b1101101;
    else if(score < 40)
             seg[13:7] = 7'b1111001;
    else if(score < 50)
             seg[13:7] = 7'b0110011;
    else if(score < 60)
             seg[13:7] = 7'b1011011;
    else if(score < 80)
             seg[13:7] = 7'b1011111;
    else if(score < 70)
             seg[13:7] = 7'b1110010;
    else if(score < 90)
             seg[13:7] = 7'b1111111;
    else if(score < 100)
             seg[13:7] = 7'b1111011;
             
             
              if(score_high < 10)
            seg_high[13:7] = 7'b1111110;
    else if(score_high < 20)
            seg_high[13:7] = 7'b0110000;
    else if(score_high < 30)
             seg_high[13:7] = 7'b1101101;
    else if(score_high < 40)
             seg_high[13:7] = 7'b1111001;
    else if(score_high < 50)
             seg_high[13:7] = 7'b0110011;
    else if(score_high < 60)
             seg_high[13:7] = 7'b1011011;
    else if(score_high < 80)
             seg_high[13:7] = 7'b1011111;
    else if(score_high < 70)
             seg_high[13:7] = 7'b1110010;
    else if(score_high < 90)
             seg_high[13:7] = 7'b1111111;
    else if(score_high < 100)
             seg_high[13:7] = 7'b1111011;
            
   end
    
 
    
    
endmodule
