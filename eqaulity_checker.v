`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:55:27 PM
// Design Name: 
// Module Name: eqaulity_checker
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


module eqaulity_checker(
input [31:0] qa,
input [31:0] qb,
output reg rsrtequ
    );
    
    always@(*)
    begin
        if(qa == qb)
        begin
            rsrtequ = 1;
        end  
        else 
        begin
            rsrtequ = 0;
        end
    end
endmodule
