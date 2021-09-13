`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:28:45 PM
// Design Name: 
// Module Name: basic_adder
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


module basic_adder(
input [31:0] imm18,
input [31:0] dpc4,
output reg [31:0] bpc
    );
    
    always @(*)
    begin
      bpc = imm18+dpc4;
    end
endmodule
