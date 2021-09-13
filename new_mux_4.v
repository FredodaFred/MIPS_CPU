`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:36:01 PM
// Design Name: 
// Module Name: new_mux_4
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


module new_mux_4(
input  ejal, 
input [4:0] edestReg0,
output reg [4:0] edestReg
);
    always @(*)
        begin
            if(ejal == 0)
            begin
                edestReg = edestReg0;
            end
            else if(ejal == 1)
            begin
                edestReg = 5'd31;
            end
        end
endmodule
