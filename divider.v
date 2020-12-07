`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 10:32:16 AM
// Design Name: 
// Module Name: divider
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


module divider(
    input clk,
    output reg pix_stb
    );
     reg [15:0] cnt;
     
     always @(posedge clk)//Clock input 100 MHz but we need 25 MHz 
     begin
        {pix_stb, cnt} <= cnt + 16'h4000;  //Connect oix_stb and cnt = 16 so divide by 4: (2^16)/4 = 0x4000
     end
endmodule
