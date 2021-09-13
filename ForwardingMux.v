`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2021 03:28:05 PM
// Design Name: 
// Module Name: ForwardingMux
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


module ForwardingMux(
input [31:0] regOut ,
input [31:0] r ,
input [31:0] mr ,
input [31:0] mdo ,
input [1:0] fwd ,
output reg[31:0] q
    );
    always @(*)
    begin
        if(fwd == 0)
            begin
                q = regOut;
            end
        else if(fwd == 1)
            begin
               q = r;
            end
        else if(fwd == 2)
            begin
                q = mr;
            end
       else if(fwd == 3)
            begin
                q = mdo;
             end
    end
endmodule
