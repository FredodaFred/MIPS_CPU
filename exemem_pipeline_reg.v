`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2021 12:18:54 PM
// Design Name: 
// Module Name: exemem_pipeline_reg
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


module exemem_pipeline_reg(
input ewreg,
input em2reg,
input ewmem,
input [4:0] edestReg,
input [31:0] er,
input [31:0] eqb,
input clk,
output reg mwreg,
output reg mm2reg, 
output reg mwmem,
output reg [4:0] mdestReg,
output reg [31:0] mr,
output reg [31:0] mqb
    );
    
    always @(posedge clk)
    begin
        mwreg = ewreg;
        mm2reg = em2reg;
        mwmem = ewmem;
        mdestReg = edestReg;
        mr = er;
        mqb = eqb;
    end
endmodule
