`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 02:12:27 PM
// Design Name: 
// Module Name: mealy_tb
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


module mealy_tb();
    reg A, clk, reset;
    wire Y;
   
    mealy DUT (.A(A), .clk(clk), .reset(reset), .Y(Y));
   
    initial
    begin
        clk = 1'b0;
    end
   
    always
    begin
        #10 clk = ~clk;
    end
   
    initial
    begin
        A = 0; reset = 0;
        #5 reset = 1;
        #20 reset = 0; A = 1;
        #20 A = 1;
        #20 A = 0;
        #10 A = 1;
        #20 A = 1;
        #20 A = 0;
        #20 A = 1;
        #10 A = 0;
        #20 A = 1;
    end
endmodule
