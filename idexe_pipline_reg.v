`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2021 03:34:17 PM
// Design Name: 
// Module Name: idexe_pipline_reg
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


module idexe_pipline_reg(
input wreg,
input m2reg,
input wmem,
input [3:0] aluc,
input aluimm,
input [4:0] destReg,
input [31:0] qa,
input [31:0] qb,
input [31:0] imm32,
input clk,

input jal,
input shift,
input [31:0] dpc4,

output reg ewreg,
output reg  em2reg,
output reg ewmem,
output reg [3:0] ealuc,
output reg ealuimm,
output reg [4:0] edestReg,
output reg [31:0] eqa,
output reg [31:0] eqb,
output reg [31:0] eimm32,

output reg ejal,
output reg eshift,
output reg [31:0] epc4
    );
    
always @(posedge clk)
    begin
    ewreg = wreg;
    em2reg = m2reg;
    ewmem = wmem;
    ealuc = aluc;
    ealuimm = aluimm;
    edestReg = destReg;
    eqa <= qa;
    eqb <= qb;
    eimm32 = imm32;
    ejal = jal;
    eshift = shift;
    epc4 = dpc4;
    
    end
endmodule
