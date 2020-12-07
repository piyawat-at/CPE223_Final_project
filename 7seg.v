`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2020 12:28:47 PM
// Design Name: 
// Module Name: 7seg
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

module seven_seg(
      input [13:0] seg, //first digit
      input [13:0] seg_high,
      input [9:0] x, 
      input [9:0] y,
      
     output reg [6:0]seg_1,
     output reg [6:0]seg_2,
     output reg [6:0]segh_1,
     output reg [6:0]segh_2,
     output reg y_total
    );
    reg y1,y2,y3,y4;
    
    always @(*)
    begin
        
        if(seg[13] == 1)
            seg_2[0] = (((x>15) & (x<27)) & ((y>10) & (y<15)));
        else 
            seg_2[0] = 0;
            
         if(seg[12] == 1)
             seg_2[1] = (((x>27) & (x<32)) & ((y>15) & (y<27)));
        else 
             seg_2[1] = 0;
            
         if(seg[11] == 1)
             seg_2[2] = (((x>27) & (x<32)) & ((y>32) & (y<44)));
        else 
             seg_2[2] = 0;
            
          if(seg[10] == 1)
             seg_2[3] = (((x>15) & (x<27)) & ((y>44) & (y<49)));
        else 
             seg_2[3] = 0;
            
         if(seg[9] == 1)
             seg_2[4] = (((x>10) & (x<15)) & ((y>32) & (y<44)));
        else 
             seg_2[4]  = 0;
            
         if(seg[8] == 1)
             seg_2[5]  = (((x>10) & (x<15)) & ((y>15) & (y<27)));
        else 
             seg_2[5]  = 0;
            
         if(seg[7] == 1)
             seg_2[6]  = (((x>15) & (x<27)) & ((y>27) & (y<32)));
        else 
             seg_2[6]  = 0;
            
         
         //unit digit
        if(seg[6] == 1)
             seg_1[0]   = (((x>42) & (x<54)) & ((y>10) & (y<15)));
        else 
            seg_1[0] = 0;
            
         if(seg[5] == 1)
            seg_1[1] = (((x>54) & (x<59)) & ((y>15) & (y<27)));
        else 
            seg_1[1] = 0;
            
         if(seg[4] == 1)
            seg_1[2] = (((x>54) & (x<59)) & ((y>32) & (y<44)));
        else 
            seg_1[2] = 0;
            
          if(seg[3] == 1)
            seg_1[3] = (((x>42) & (x<54)) & ((y>44) & (y<49)));
        else 
            seg_1[3] = 0;
            
         if(seg[2] == 1)
            seg_1[4] = (((x>37) & (x<42)) & ((y>32) & (y<44)));
        else 
            seg_1[4] = 0;
            
         if(seg[1] == 1)
            seg_1[5] = (((x>37) & (x<42)) & ((y>15) & (y<27)));
        else 
            seg_1[5] = 0;
            
         if(seg[0] == 1)
            seg_1[6] = (((x>42) & (x<54)) & ((y>27) & (y<32)));
        else 
            seg_1[6] = 0;
        
        ////////////////////////////////////// high_score
        
        if(seg_high[13] == 1)
            segh_2[0] = (((x>15+566) & (x<27+566)) & ((y>10) & (y<15)));
        else 
             segh_2[0] = 0;
            
         if(seg_high[12] == 1)
             segh_2[1] = (((x>27+566) & (x<32+566)) & ((y>15) & (y<27)));
        else 
             segh_2[1] = 0;
            
         if(seg_high[11] == 1)
             segh_2[2] = (((x>27+566) & (x<32+566)) & ((y>32) & (y<44)));
        else 
             segh_2[2] = 0;
            
          if(seg_high[10] == 1)
             segh_2[3] = (((x>15+566) & (x<27+566)) & ((y>44) & (y<49)));
        else 
             segh_2[3] = 0;
            
         if(seg_high[9] == 1)
             segh_2[4] = (((x>10+566) & (x<15+566)) & ((y>32) & (y<44)));
        else 
             segh_2[4] = 0;
            
         if(seg_high[8] == 1)
             segh_2[5] = (((x>10+566) & (x<15+566)) & ((y>15) & (y<27)));
        else 
             segh_2[5] = 0;
            
         if(seg_high[7] == 1)
             segh_2[6] = (((x>15+566) & (x<27+566)) & ((y>27) & (y<32)));
        else 
             segh_2[6] = 0;
            
         
         //unit digit
        if(seg_high[6] == 1)
             segh_1[0]  = (((x>42+566) & (x<54+566)) & ((y>10) & (y<15)));
        else 
            segh_1[0] = 0;
            
         if(seg_high[5] == 1)
            segh_1[1] = (((x>54+566) & (x<59+566)) & ((y>15) & (y<27)));
        else 
            segh_1[1] = 0;
            
         if(seg_high[4] == 1)
            segh_1[2] = (((x>54+566) & (x<59+566)) & ((y>32) & (y<44)));
        else 
            segh_1[2] = 0;
            
          if(seg_high[3] == 1)
            segh_1[3] = (((x>42+566) & (x<54+566)) & ((y>44) & (y<49)));
        else
            segh_1[3] = 0;
            
         if(seg_high[2] == 1)
            segh_1[4] = (((x>37+566) & (x<42+566)) & ((y>32) & (y<44)));
        else 
            segh_1[4] = 0;
            
         if(seg_high[1] == 1)
            segh_1[5] = (((x>37+566) & (x<42+566)) & ((y>15) & (y<27)));
        else 
            segh_1[5] = 0;
            
         if(seg_high[0] == 1)
            segh_1[6] = (((x>42+566) & (x<54+566)) & ((y>27) & (y<32)));
        else 
            segh_1[6] = 0;
    
    y1 = ( ((x>=546) & (x<=570)) &  ((y>=11) &  (y<=23)) );
    y2 = ( ((x>=551) & (x<=565)) &  ((y>=24) &  (y<=35)) );
    y3 = ( ((x>=556) & (x<=560)) &  ((y>=36) &  (y<=49)) );
    y4 = ( ((x>=551) & (x<=565)) &  ((y>=45) &  (y<=49)) );
    
    y_total = y1 | y2 | y3 | y4;
    end 

    
        
endmodule
