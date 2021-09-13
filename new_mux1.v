`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:33:52 PM
// Design Name: 
// Module Name: new_mux1
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


module new_mux1(
input [31:0] pc4,
input [31:0] bpc, 
input [31:0] qa,
input [31:0] dpc4,
input [1:0] pcsrc, 

output reg [31:0] nextPc
    );
    
    always @(*)
    begin
    if (pcsrc == 0)
        begin
            nextPc = pc4;
        end
    if (pcsrc == 1)
       begin
           nextPc = bpc;
       end
    if ( pcsrc ==2)
        begin
            nextPc =qa;
        end
    if (pcsrc == 3)
        begin
            nextPc = dpc4;
        end
    end
endmodule
