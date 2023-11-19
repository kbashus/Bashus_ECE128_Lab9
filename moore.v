`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 01:42:58 PM
// Design Name: 
// Module Name: moore
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


module moore(input a, input clk, input reset, output reg z); //detect 1100
    parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 ;
    reg [1:0] current_state;
    reg [1:0] next_state;
    
    always@(posedge clk or posedge reset)
    begin
    if(reset)
    current_state <= S0;
    else
    current_state <= next_state ;
    end
    
    
    always@(current_state or a)
    begin
    case(current_state)
    S0: 
    begin z =1'b0;
    if(a)
      next_state = S1;
    else
    next_state = S0;
    end
    
    S1 : begin
    if (a)
    next_state = S2;
    else
    next_state = S0;
    end
    
    S2 : begin
    if(a)
    next_state = S2;
    else
    next_state = S3;
    end
    
    S3 : begin
    if(a)
    next_state = S1;
    else
    next_state = S0;
    end
    endcase
    end
    
    always @ (current_state)
    begin
    case (current_state)
    S0 : 
    z = 0 ;
    S1 : 
    z = 0 ;
    S2 : 
    z = 0 ;
    S3 :
    z = 1 ;
    endcase
    end


    
endmodule
