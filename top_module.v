`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 10:56:36 AM
// Design Name: 
// Module Name: top_module
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


module top(
    input wire clk,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input U,L,D,R,
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output reg [3:0] vgaRed,    // 4-bit VGA red output
    output reg [3:0] vgaGreen,    // 4-bit VGA green output
    output reg [3:0] vgaBlue,     // 4-bit VGA blue output
    output reg [3:0] sw
    );
    

    // generate a 25 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    reg [1:0] direction;
    always @(posedge clk)//Clock input 100 MHz but we need 25 MHz 
    begin
        {pix_stb, cnt} <= cnt + 16'h4000;  //Connect oix_stb and cnt = 16 so divide by 4: (2^16)/4 = 0x4000
    end
    
   
    
    
    wire [9:0] x;  //vector signal[MSB:LSB] // current pixel x position: 10-bit value: 0-1023
                   // because x is a reg, when it reaches 1023, adding to it will set it to 0
    wire [9:0] y;  //vector signal[MSB:LSB] // current pixel y position:  9-bit value: 0-511
                  // similarly, y will come back to 0 after it is 511 
    wire animate; //scalar signal // active after every frame for one tick
    

    
    
    vga640x480 display (
        .i_clk(clk), //input Clock
        .i_rst(S),
        .i_pix_stb(pix_stb),  //input Clock that divide 25 MHz
        .o_hs(VGA_HS_O), //Output
        .o_vs(VGA_VS_O), //Output
        .o_x(x), //Output
        .o_y(y), //Output
        .animate(animate) //Output
    ); 
    
     // length of the snake
    
    wire seg_wire ;
    reg [6:0] seg ;
     

    
    // Printing Objects
     reg square; //background gamearea
     reg snake; //head of the snake
     reg snake1; // first block of snake's body
     reg snake2; // and so on
     reg snake3;
     reg snake4;
     reg snake5;
     reg snake6;
     reg snake7;
     reg snake8;
     reg snake9;
     reg snake10;
     reg snake11;
     reg snake12;
     reg snake13;
     reg snake14;
     reg snake15;
     reg snake16;
     reg snake17;
     reg snake18;
     reg snake19;
     reg snake20;
     reg snake21;
     reg snake22;
     reg snake23;
     reg snake24;
     reg snake25;
     reg food;
     
     
     reg sega;
     reg segb;
     reg segc;
     reg segd;
     reg sege;
     reg segf;
     reg segg;
     reg segh; 
     
     
     // coordinates for every block.  
    reg [9:0] headx = 200;
    reg [8:0] heady = 150;
    
   
    // headx and heady denote the coordinates of the top left corner of the snake's head
    // similarly for all 13 blocks. If length of snake hasn't reached a number, that block will be at 0,0
    //initial length of snake is 4
    
    
    reg [9:0] headx1 = -1;
    reg [8:0] heady1 = -1;
    reg [9:0] headx2 = -1;
    reg [8:0] heady2 = -1;
    reg [9:0] headx3 = -1;
    reg [8:0] heady3 = -1;
    reg [9:0] headx4 = -1;
    reg [8:0] heady4 = -1;
    reg [9:0] headx5 = -1;
    reg [8:0] heady5 = -1;
    reg [9:0] headx6 = -1;
    reg [8:0] heady6 = -1;
    reg [9:0] headx7 = -1;
    reg [8:0] heady7 = -1;
    reg [9:0] headx8 = -1;
    reg [8:0] heady8 = -1;
    reg [9:0] headx9 = -1;
    reg [8:0] heady9 = -1;
    reg [9:0] headx10 = -1;
    reg [8:0] heady10 = -1;
    reg [9:0] headx11 = -1;
    reg [8:0] heady11 = -1;
    reg [9:0] headx12 = -1;
    reg [8:0] heady12 = -1;
    reg [9:0] headx13 = -1;
    reg [8:0] heady13 = -1;
    reg [9:0] headx14 = -1;
    reg [8:0] heady14 = -1;
    reg [9:0] headx15 = -1;
    reg [8:0] heady15 = -1;
    reg [9:0] headx16 = -1;
    reg [8:0] heady16 = -1;
    reg [9:0] headx17 = -1;
    reg [8:0] heady17 = -1;
    reg [9:0] headx18 = -1;
    reg [8:0] heady18 = -1;
    reg [9:0] headx19 = -1;
    reg [8:0] heady19 = -1;
    reg [9:0] headx20 = -1;
    reg [8:0] heady20 = -1;
    reg [9:0] headx21 = -1;
    reg [8:0] heady21 = -1;
    reg [9:0] headx22 = -1;
    reg [8:0] heady22 = -1;
    reg [9:0] headx23 = -1;
    reg [8:0] heady23 = -1;
    reg [9:0] headx24 = -1;
    reg [8:0] heady24 = -1;
    reg [9:0] headx25 = -1;
    reg [8:0] heady25 = -1;

    
   
    // first food block will be at 300,200. next blocks will have pseudorandom coordinates
    reg [9:0] foodx = 300;
    reg [8:0] foody = 200;
    
     
    reg [4:0] div = 0; // controls the speed of snake. Rises to 16, then resets to 0.
    integer len = 2;
    reg [7:0] score= 0 ;
    reg flag = 1; // initial condition. Flag remains 0 throughout the code
    reg foodeat = 0; // checks whether food is being eaten. Triggers new block generation.
    integer speed = 4;
    
    
    
    
    
    
        
        
    // changing direction based on push-button input.
    always @(posedge clk)
    begin
 
        if(flag)
            begin direction = 1; flag = 0; end // sets initial direction to right.
        
        if (R && direction != 0  ) // if direction is left, the snake won't change direction if R is pressed.
            begin
                direction=2'b01; // if direction isn't left, change it to right.
            end
        if(D && direction != 2) // similarly for U, D, L
            begin
                direction=2'b11;
            end
        if (L && direction != 1)
            begin
                direction=2'b00;
            end
        if(U && direction != 3)
            begin
                direction=2'b10;
            end       
        
    end
    
    
    always @(posedge animate)
    begin
        div <=div + 1;   // div controls speed of snake. It increases till 16, then resets to 0 
    end  
   
    always@(posedge div[speed])
    begin
    
    //if ((score % 7 == 0) & (speed > 0))
    if (len==5)
    begin
        speed = 3;
    end
    else if (len==12)
    begin
        speed = 2;
    end
    else if (len==20)
    begin
        speed = 1;
    end
    
    if((((headx - foodx <= 20) & (headx - foodx >= 0)) || ((foodx - headx >= 0) & (foodx - headx <= 20))) 
    & (((heady - foody <= 20) & (heady - foody >= 0)) || ((foody - heady <= 20)) & (foody - heady >= 0))) // checks if block is being eaten, by comparing top left corner
                                                      // of food block and head of the snake.      
        begin
        len = len + 1; // increase length by 1 if food block is being eaten.
        foodeat = 1; // set foodeat=1 to triger new food block generation
        score = score + 1;
        
        
        
        end
        
    if(((headx - headx2 == 0) & (heady - heady2 == 0)) |
    ((headx - headx3 == 0) & (heady - heady3 == 0))  |
    ((headx - headx4 == 0) & (heady - heady4 == 0)) |
    ((headx - headx5 == 0) & (heady - heady5 == 0)) |
    ((headx - headx6 == 0) & (heady - heady6 == 0)) |
    ((headx - headx7 == 0) & (heady - heady7 == 0)) |
    ((headx - headx8 == 0) & (heady - heady8 == 0)) |
    ((headx - headx9 == 0) & (heady - heady9 == 0)) |
    ((headx - headx10 == 0) & (heady - heady10 == 0)) |
    ((headx - headx11 == 0) & (heady - heady11 == 0)) | 
    ((headx - headx12 == 0) & (heady - heady12 == 0)) | 
    ((headx - headx13 == 0) & (heady - heady13 == 0)) |
    ((headx - headx14 == 0) & (heady - heady14 == 0)) |
    ((headx - headx15 == 0) & (heady - heady15 == 0)) |
    ((headx - headx16 == 0) & (heady - heady16 == 0)) |
    ((headx - headx17 == 0) & (heady - heady17 == 0)) |
    ((headx - headx18 == 0) & (heady - heady18 == 0)) |
    ((headx - headx19 == 0) & (heady - heady19 == 0)) |
    ((headx - headx20 == 0) & (heady - heady20 == 0)) | 
    ((headx - headx21 == 0) & (heady - heady21 == 0)) | 
    ((headx - headx22 == 0) & (heady - heady22 == 0)) | 
    ((headx - headx23 == 0) & (heady - heady23 == 0)) |
    ((headx - headx24 == 0) & (heady - heady24 == 0)) |
    ((headx - headx25 == 0) & (heady - heady25 == 0)) |
    (headx <= 0 | headx >= 620 | heady <= 70 | heady >= 450)) //Collision border
        begin
            score = 0;
            len = 2;
            speed = 4;
            headx = 200;
            heady = 150;
            headx1 = 200;
            heady1 = 130;
            headx2 = -1;
            heady2 = -1;
            headx3 = -1;
            heady3 = -1;
            headx4 = -1;
            heady4 = -1;
            headx5 = -1;
            heady5 = -1;
            headx6 = -1;
            heady6 = -1;
            headx7 = -1;
            heady7 = -1;
            headx8 = -1;
            heady8 = -1;
            headx9 = -1;
            heady9 = -1;
            headx10 = -1;
            heady10 = -1;
            headx11 = -1;
            heady11 = -1;
            headx12 = -1;
            heady12 = -1;
            headx13 = -1;
            heady13 = -1;
            heady14 = -1;
            headx15 = -1;
            heady15 = -1;
            headx16 = -1;
            heady16 = -1;
            headx17 = -1;
            heady17 = -1;
            headx18 = -1;
            heady18 = -1;
            headx19 = -1;
            heady19 = -1;
            headx20 = -1;
            heady20 = -1;
            headx21 = -1;
            heady21 = -1;
            headx22 = -1;
            heady22 = -1;
            headx23 = -1;
            heady23 = -1;
            headx24 = -1;
            heady24 = -1;
            headx25 = -1;
            heady25 = -1;
            foodeat = 1;
            foodx = 300;
            foody = 200;
                end
     

   
                
    if(foodeat)
        begin
            foodx = 80 + (headx*2 + headx1*2 + headx2*1)%450 ; // new food block generated
            foody = 80 + (heady*2 + headx1)%320; 
            foodeat = 0;
        end
    
    
    heady1 <= heady; // when snake moves 1 block, block1 replaces the head.
    headx1 <= headx;
    if(len>2)       // if a block exists, it'll replace the next block
    begin
    heady2 <= heady1;
    headx2 <= headx1;
    end
    // similar checking of length and replacement for all valid blocks.
    if(len>3)
    begin
    heady3 <= heady2;
    headx3 <= headx2;
    end
    if(len>4)
    begin
    heady4 <= heady3;
    headx4 <= headx3;
    end
    if(len>5)
    begin
    heady5 <= heady4;
    headx5 <= headx4;
    end
    if(len>6)
    begin
    heady6 <= heady5;
    headx6 <= headx5;
    end
    if(len>7)
    begin
    heady7 <= heady6;
    headx7 <= headx6;
    end
    if(len>8)
    begin
    heady8 <= heady7;
    headx8 <= headx7;
    end
    if(len>9)
    begin
    heady9 <= heady8;
    headx9 <= headx8;
    end
    if(len>10)
    begin
    heady10 <= heady9;
    headx10 <= headx9;
    end
    if(len>11)
    begin
    heady11 <= heady10;
    headx11 <= headx10;
    end
    if(len>12)
    begin
    heady12 <= heady11;
    headx12 <= headx11;
    end
    if(len>13)
    begin
    heady13 <= heady12;
    headx13 <= headx12;
    end
    if(len>14)
    begin
    heady14 <= heady13;
    headx14 <= headx13;
    end

    if(len>15)
    begin
    heady15 <= heady14;
    headx15 <= headx14;
    end
    if(len>16)
    begin
    heady16 <= heady15;
    headx16 <= headx15;
    end
    if(len>17)
    begin
    heady17 <= heady16;
    headx17 <= headx16;
    end
    if(len>18)
    begin
    heady18 <= heady17;
    headx18 <= headx17;
    end
    if(len>19)
    begin
    heady19 <= heady18;
    headx19 <= headx18;
    end
    if(len>20)
    begin
    heady20 <= heady19;
    headx20 <= headx19;
    end
    if(len>21)
    begin
    heady21 <= heady20;
    headx21 <= headx20;
    end
    if(len>22)
    begin
    heady22 <= heady21;
    headx22 <= headx21;
    end
    if(len>23)
    begin
    heady23 <= heady22;
    headx23 <= headx22;
    end
    if(len>24)
    begin
    heady24 <= heady23;
    headx24 <= headx23;
    end
     if(len>25)
    begin
    heady25 <= heady24;
    headx25 <= headx24;
    end
    
    
    
    // displaying the movement of snake according to direction.
    if(direction == 0) // Left
        begin
        headx <= headx - 20; // snake head will move 20 pixels to the left in x direction 
        end
    if(direction == 1) // Right
        begin
        headx <= headx + 20; // snake head will move 20 pixels to the right in x direction
        end
    if(direction == 3) // Down
        begin
        heady <= heady + 20; // snake head will move 20 pixels below in y direction
        end
    if(direction == 2) // Up
        begin
        heady <= heady - 20; // snake head will move 20 pixels above in y direction
      
        end
        
    end   
    
    always@(*)
    begin
     case(score%10)
            0 : seg = 7'b1111110;
            1 : seg = 7'b0110000;
            2 : seg = 7'b1101101;
            3 : seg = 7'b1111001;
            4 : seg = 7'b0110011;
            5 : seg = 7'b1011011;
            6 : seg = 7'b1011111;
            7 : seg = 7'b1110010;
            8 : seg = 7'b1111111;
            9 : seg = 7'b1111011; 
        default : seg = 7'b1111110;
        endcase
    
    if(seg[6] == 1)
        sega = (((x>15) & (x<27)) & ((y>10) & (y<15)));
    else 
        sega = 0;
        
     if(seg[5] == 1)
        segb = (((x>27) & (x<32)) & ((y>15) & (y<27)));
    else 
        segb = 0;
        
     if(seg[4] == 1)
        segc = (((x>27) & (x<32)) & ((y>32) & (y<44)));
    else 
        segc = 0;
        
      if(seg[3] == 1)
        segd = (((x>15) & (x<27)) & ((y>44) & (y<49)));
    else 
        segd = 0;
        
     if(seg[2] == 1)
        sege = (((x>10) & (x<15)) & ((y>32) & (y<44)));
    else 
        sege = 0;
        
     if(seg[1] == 1)
        segf = (((x>10) & (x<15)) & ((y>15) & (y<27)));
    else 
        segf = 0;
        
     if(seg[0] == 1)
        segg = (((x>15) & (x<27)) & ((y>27) & (y<32)));
    else 
        segg = 0;
        
        
        
        
        
    

    
    
    square = (x>0) & (x<640) & ( ((y>60) & (y<70)) | ((y>470)&(y<480)))  ; // storing all the pixels within the gamearea background
    
    snake = (x > headx) & (x < headx + 20) & (y>heady) & (y<heady + 20); // storing all pixels inside 20x20 square
                                                                         // with top left corner headx,heady
    // similar statements for all the blocks from 1 to 13.
    snake1 = (x > headx1) & (x < headx1 + 20) & (y>heady1) & (y<heady1 + 20);
    snake2 = (x > headx2) & (x < headx2 + 20) & (y>heady2) & (y<heady2 + 20);
    snake3 = (x > headx3) & (x < headx3 + 20) & (y>heady3) & (y<heady3 + 20);
    snake4 = (x > headx4) & (x < headx4 + 20) & (y>heady4) & (y<heady4 + 20);
    snake5 = (x > headx5) & (x < headx5 + 20) & (y>heady5) & (y<heady5 + 20);
    snake6 = (x > headx6) & (x < headx6 + 20) & (y>heady6) & (y<heady6 + 20);
    snake7 = (x > headx7) & (x < headx7 + 20) & (y>heady7) & (y<heady7 + 20);
    snake8 = (x > headx8) & (x < headx8 + 20) & (y>heady8) & (y<heady8 + 20);
    snake9 = (x > headx9) & (x < headx9 + 20) & (y>heady9) & (y<heady9 + 20);
    snake10 = (x > headx10) & (x < headx10 + 20) & (y>heady10) & (y<heady10 + 20);
    snake11 = (x > headx11) & (x < headx11 + 20) & (y>heady11) & (y<heady11 + 20);
    snake12 = (x > headx12) & (x < headx12 + 20) & (y>heady12) & (y<heady12 + 20);
    snake13 = (x > headx13) & (x < headx13 + 20) & (y>heady13) & (y<heady13 + 20);
    snake14 = (x > headx14) & (x < headx14 + 20) & (y>heady14) & (y<heady14 + 20);
    snake15 = (x > headx15) & (x < headx15 + 20) & (y>heady15) & (y<heady15 + 20);
    snake16 = (x > headx16) & (x < headx16 + 20) & (y>heady16) & (y<heady16 + 20);
    snake17 = (x > headx17) & (x < headx17 + 20) & (y>heady17) & (y<heady17 + 20);
    snake18 = (x > headx18) & (x < headx18 + 20) & (y>heady18) & (y<heady18 + 20);
    snake19 = (x > headx19) & (x < headx19 + 20) & (y>heady19) & (y<heady19 + 20);
    snake20 = (x > headx20) & (x < headx20 + 20) & (y>heady20) & (y<heady20 + 20);
    snake21 = (x > headx21) & (x < headx21 + 20) & (y>heady21) & (y<heady21 + 20);
    snake22 = (x > headx22) & (x < headx22 + 20) & (y>heady22) & (y<heady22 + 20);
    snake23 = (x > headx23) & (x < headx23 + 20) & (y>heady23) & (y<heady23 + 20);
    snake24 = (x > headx24) & (x < headx24 + 20) & (y>heady24) & (y<heady24 + 20);
    snake25 = (x > headx25) & (x < headx25 + 20) & (y>heady25) & (y<heady25 + 20);
    
    // storing all the pixels within the food block
    food = (x > foodx) & (x < foodx + 20) & (y> foody) & (y<foody + 20); 
  
    end
    
    
  
    always@(*)
    begin 
        
        vgaGreen[3] = food ; // = 1000
        vgaBlue[3] =  snake | snake1 | snake2 | snake3 | snake4 | snake5 | snake6 | snake7 | snake8 | snake9 | snake10 | snake11 | snake12 | snake13 | snake14| snake15| snake16| snake17| snake18| snake19| snake20| snake21| snake22| snake23| snake24| snake25; // food will be blue
        vgaRed[3] =  sega | segb | segc | segd | sege | segf | segg | square & ~(food |snake | snake1 | snake2 | snake3 | snake4 | snake5 | snake6 | snake7 | snake8 | snake9 | snake10 | snake11 | snake12 | snake13 | snake14| snake15| snake16| snake17| snake18| snake19| snake20| snake21| snake22| snake23| snake24| snake25) ; // = 10
       
        // whole body of snake and food will be red
        
        // hence, body of snake except head will be green + red = yellow
        // snake head = red
        // food = blue + red = purple
        // rest of the gamearea = green  
    end
    

endmodule