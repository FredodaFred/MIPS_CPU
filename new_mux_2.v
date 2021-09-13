`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:35:18 PM
// Design Name: 
// Module Name: new_mux_2
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


module new_mux_2(
input [31:0] sa, input [31:0] eqa,
input eshift,
output reg [31:0] a
    );
    always @(*)
    begin
        if(eshift == 0)
        begin
            a = sa;
        end
        if(eshift == 1)
        begin
            a =  eqa;
        end
    end
endmodule
