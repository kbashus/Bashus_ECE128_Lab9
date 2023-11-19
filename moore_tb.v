`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 02:12:44 PM
// Design Name: 
// Module Name: moore_tb
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


module moore_tb();
    reg a;
    reg clk;
    reg reset;
    wire z;

    moore UUT(.a(a), .clk(clk), .reset(reset), .z(z));
    
    
    initial
    begin
    clk = 1'b0;
    reset = 1'b1;
    
    #15 reset = 1'b0;
    
    end
    
    always #5 clk = ~clk;
    initial begin
    #10 a = 1; 
    #10 a = 1; 
    #10 a = 0; 
    #10 a = 0;
    #10 a = 1;
    #10 $finish;
    end
    
    

endmodule
