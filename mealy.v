`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 01:40:47 PM
// Design Name: 
// Module Name: mealy
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


module mealy(input A, input clk, input reset, output Y); //detect 1101

    reg [2:0] current_state, next_state; // variables to hold current and next states
   
    assign Y = A & current_state[2] & ~current_state[1] & ~current_state[0]; // dataflow modeling for output

    always @ (posedge clk)  // next state logic calculation
    begin
        if (reset)  // if reset, set state to S0
            current_state = 3'b000;
        else
            current_state = next_state; // otherwise, assign next state as the current state
       
       
        // run through every possible state and input combination to update next state
        //input 0
        if (~A && current_state == 3'b000) // input 0, and state 0
            next_state = 3'b000; 
        else if (~A && current_state == 3'b001) //input 0, and state 1
            next_state = 3'b000; 
        else if (~A && current_state == 3'b010) //input 0, and state 2
            next_state = 3'b011;
        else if (~A && current_state == 3'b011) //input 0, and state 3
            next_state = 3'b001;
        else if (~A && current_state == 3'b100)
            next_state = 3'b000;
 
        // input 1    
        else if (A && current_state == 3'b000)
            next_state = 3'b001;      
        else if (A && current_state == 3'b001)
            next_state = 3'b010;
        else if (A && current_state == 3'b010)
            next_state = 3'b010;
        else if (A && current_state == 3'b011)
            next_state = 3'b100;
        else if (A && current_state == 3'b100)
            next_state = 3'b001;
        else
            next_state = 3'b000;  // default is the Reset state
                       
    end
endmodule

