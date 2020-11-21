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
       input  score,
       output [6:0] seg
    );
    reg [6:0] seg_tmp;
    always @(score)
    begin
        /*case(score%10)
            0 : seg_tmp = 7'b1111110;
            1 : seg_tmp = 7'b0110000;
            2 : seg_tmp = 7'b1101101;
            3 : seg_tmp = 7'b1111001;
            4 : seg_tmp = 7'b0110011;
            5 : seg_tmp = 7'b1011011;
            6 : seg_tmp = 7'b1011111;
            7 : seg_tmp = 7'b1110010;
            8 : seg_tmp = 7'b1111111;
            9 : seg_tmp = 7'b1111011; 
        default : seg_tmp = 7'b1111110;
        endcase*/
   end
   assign seg = 7'b1111110;
    
    
endmodule
