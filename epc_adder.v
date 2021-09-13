`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:31:13 PM
// Design Name: 
// Module Name: epc_adder
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


module epc_adder(
input [31:0] epc4,
output reg [31:0] epc8
    );
    always@(*)
    begin
        epc8 = epc4+32'd4;
    end
endmodule
