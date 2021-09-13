`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:59:51 PM
// Design Name: 
// Module Name: bitshifter2
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


module bitshifter2(
input [29:0] imm,
output reg [31:0] imm18
    );
    
    always@(*)
    begin
       imm18 = imm << 2;
    end
endmodule
