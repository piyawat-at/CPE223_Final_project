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
    input wire clk,            
    input U,L,D,R,
    output wire VGA_HS_O,       
    output wire VGA_VS_O,      
    output reg [3:0] vgaRed,    
    output reg  [3:0] vgaGreen,   
    output reg [3:0] vgaBlue
    );
    wire pix_stb;
    reg [1:0] direction;
    
    divider d1(clk,pix_stb); //100 -> 25
   
    wire [9:0] x;  
    wire [9:0] y;            
    wire animate;
    
    vga640x480 display (
        .i_clk(clk), 
        .i_pix_stb(pix_stb),  
        .o_hs(VGA_HS_O),
        .o_vs(VGA_VS_O),
        .o_x(x), 
        .o_y(y),
        .animate(animate)
    ); 
    
    wire [13:0] seg ;
    wire [13:0] seg_high;     
    wire [6:0]seg_1;
    wire [6:0]seg_2;
    wire [6:0]segh_1;
    wire [6:0]segh_2;
    wire y_total;
     
    reg [4:0] div = 0; 
    integer len = 2;
    reg [6:0] size = 2;
    reg [6:0] score  ;
    reg [6:0] score_high;
    reg flag = 1; 
    reg foodeat = 0;
    integer speed = 4;
    
    score_show s1(.score(score),.score_high(score_high),.seg(seg),.seg_high(seg_high));   
    
    seven_seg ss1 (seg, seg_high, x, y, seg_1, seg_2, segh_1, segh_2,y_total);
    
    wire tmp;
    state_startandgameover v1 (x,y,tmp);
    
    reg play_area;
    reg square;
    reg food;
    reg border;
   
   
    reg seg_1_tmp;
    reg seg_2_tmp;
    reg segh_1_tmp;
    reg segh_2_tmp;
   
   
  
    reg [9:0] snakeX[0:50];
	reg [8:0] snakeY[0:50];
	reg snakeHead;
	reg snakeBody;
 
    reg [9:0] foodx = 300;
    reg [8:0] foody = 200;
   
    integer count1,count2,count3;
    reg found;
    reg self;
   
   
    
    reg start;
    reg [1:0]state;
    reg [1:0]next_state;
    localparam [1:0] playing = 2'b00,
                     gameover = 2'b01;
    
    always @(posedge clk)
        begin
            if(flag)                     //RIGHT
                begin direction = 1; flag = 0; end    
                        
            if (R && direction != 0  )  //RIGHT
                begin
                    direction=2'b01; 
                end
            if(D && direction != 2)     //DOWN
                begin
                    direction=2'b11;
                end
            if (L && direction != 1)   //LEFT
                begin
                    direction=2'b00;
                end
            if(U && direction != 3)    //UP
                begin
                    direction=2'b10;
                end       
        end
    
    always @(posedge animate)
        begin
            div <=div + 1; 
        end  

    always@(posedge div[speed]) // 0->4 Order by fastest
    begin
            for(count3 = 1; count3 < size  ; count3 = count3 + 1) //check hit border or itself
                begin
                    self = (snakeX[0] - snakeX[count3] == 0) && (snakeY[0] - snakeY[count3] == 0);
                    if(self|| (snakeX[0] <= 0 || snakeX[0] >= 620 || snakeY[0] <= 70 || snakeY[0] >= 450) || start )
                    begin
                        snakeX[0] = 320;
                        snakeY[0] = 240;
                        start = 0;
                        score = 0;
                        size = 2;
                        len = 2;
                        speed = 4;
                     end
                end
                
           case(len) //change speed
                8 : speed = 3;
                16 : speed = 2;
                30 : speed = 1;
                50 : speed = 0;
           endcase
            
            if((((snakeX[0] - foodx <= 20) & (snakeX[0]- foodx >= 0)) || ((foodx - snakeX[0] >= 0) & (foodx - snakeX[0] <= 20)))  
            & (((snakeY[0] - foody <= 20) & (snakeY[0] - foody >= 0)) || ((foody - snakeY[0] <= 20)) & (foody - snakeY[0] >= 0)))    
                begin  //hit food
                    if(size <= 50)
                        begin
                            len = len + 1;
                            size = size +1;
                        end 
                    foodeat = 1; 
                    score = score + 1;
                end            
                        
            if(foodeat) //generate new foo
                begin
                    foodx = 80 + (snakeX[0]*2 + snakeX[1]*2 + snakeY[1])%450;
                    foody = 80 + (snakeY[0]*2 + snakeX[1])%320;
                    foodeat = 0;
                end
         
            if(score > score_high) score_high = score ;
            
            for(count1 = 127; count1 > 0 ; count1 = count1 - 1) //generate body by head
                begin
                        if(count1 <= size - 1)
                        begin
                            snakeX[count1] = snakeX[count1 - 1];
                            snakeY[count1] = snakeY[count1 - 1];
                        end
                    end
                    
            case(direction) //direction
                0: snakeX[0] <=  snakeX[0] - 20;
                1: snakeX[0] <=  snakeX[0] + 20;
                2: snakeY[0] <=  snakeY[0] - 20;
                3: snakeY[0] <=  snakeY[0] + 20; 
            endcase           
    end   
        
    always @(*)
    begin
    //reduction
    seg_1_tmp = |seg_1;
    seg_2_tmp = |seg_2;
    segh_1_tmp = |segh_1;
    segh_2_tmp = |segh_2;
    //area
    square = (x>0) & (x<640) & ( ((y>60) & (y<70)) | ((y>470)&(y<480)))  ;
    border = (x <= 0) | (x >= 620) | (y <= 70) | (y >=450) ;
    play_area = ((x>0) & (x<640) &  (y>0) & (y<480));
    snakeHead = (x> snakeX[0] && x< (snakeX[0]+20)) && (y > snakeY[0] && y < (snakeY[0]+20));
    food = (x > foodx) & (x < foodx + 21) & (y> foody) & (y<foody + 21);  
     
    
    found = 0;
	for(count2 = 1; count2 < size  ; count2 = count2 + 1)
		begin
			if(~found)
			begin				
				snakeBody = ((x > snakeX[count2] && x < snakeX[count2]+20) && (y > snakeY[count2] && y < snakeY[count2]+20));
				found = snakeBody;
			end
	   end 
    end

   //gamestate
   always @(state or U or R or L or D)
        case (state)
            playing:
                 begin
                        vgaGreen[3] = food  ; // = 1000
                        vgaBlue[3] =  snakeHead | snakeBody;
                        vgaRed[3] =  seg_1_tmp | seg_2_tmp | segh_1_tmp | segh_2_tmp | y_total
                         | square & ~(food | snakeHead |snakeBody ) ; // = 10

                        if(self|| (snakeX[0] <= 0 || snakeX[0] >= 620 || snakeY[0] <= 70 || snakeY[0] >= 450)) 
                             begin  
                                 next_state = gameover;           
                            end
                        else next_state = playing;
                 end
            gameover: 
                begin
                   vgaGreen[3] = tmp;
                   vgaRed[3] = tmp;
                   vgaBlue[3] = tmp;
                   if(U|R|L|D)begin  
                            next_state = playing;
                            start = 1;
                        end
                        else next_state = gameover;
                end 
         endcase      
                    
    always @ (posedge clk)
    begin 
        state = next_state;
    end
endmodule