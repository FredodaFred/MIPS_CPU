`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2021 12:39:36 PM
// Design Name: 
// Module Name: memwb_pipeline_reg
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


module memwb_pipeline_reg(
input mwreg,
input mm2reg,
input [4:0] mdestReg,
input [31:0] mr,
input [31:0] mdo, 
input clk,
output reg wwreg,
output reg wm2reg,
output reg [4:0] wdestReg,
output reg [31:0] wr,
output reg [31:0] wdo
    );
    
    always @(posedge clk)
    begin
        wwreg = mwreg;
        wm2reg = mm2reg;
        wdestReg = mdestReg;
        wr = mr;
        wdo = mdo;
    end
endmodule
