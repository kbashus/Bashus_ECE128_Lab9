`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 01:37:54 PM
// Design Name: 
// Module Name: Debouncer
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


module Debouncer(input raw, input clk, output reg clean);
    reg [2:0] counter;
    wire TC;
    
    always @ (posedge clk) begin
    if(~raw)
    counter <= 3'b000;
    else
    counter <= counter + 3'b001;
    end
    
    assign TC = (counter == 3'b111);
    
    always @ (posedge clk) begin
    if(~raw)
    clean <= 1'b0;
    else if (TC)
    clean <= 1'b1;
    end
endmodule
