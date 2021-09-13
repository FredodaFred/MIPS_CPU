`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:58:16 PM
// Design Name: 
// Module Name: bitshifter1
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


module bitshifter1(
input [29:0] addr,
output reg [31:0] jpc
    );
    
    always@(*)
    begin
        jpc = addr << 2;
    end
endmodule
