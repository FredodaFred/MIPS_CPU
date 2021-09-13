`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:35:40 PM
// Design Name: 
// Module Name: new_mux_3
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


module new_mux_3(
input [31:0] epc8, 
input [31:0] ealu,
input ejal,
 
output reg [31:0] er
    );
    always@(*)
    begin
        if(ejal == 1)
        begin
            er = epc8;
        end
        if(ejal == 0)
        begin
            er = ealu;
        end
    end
endmodule
