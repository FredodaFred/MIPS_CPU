`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2021 03:10:46 PM
// Design Name: 
// Module Name: testbench
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


module testbench( );

reg clk;
wire [31:0] pc; //idexe output

wire ewreg;
wire em2reg;
wire ewmem;
wire [3:0] ealuc;
wire ealuimm;
wire [4:0] edestReg;
wire [31:0] eqa;
wire [31:0] eqb;
wire [31:0] eimm32;

wire [31:0] dinstOut;//ifid out

//exemem
wire mwreg;
wire  mm2reg; 
wire mwmem;
wire [4:0] mdestReg;
wire [31:0] mr;
wire [31:0] mq;

//memwb
wire wwreg;
wire wm2reg;
wire [4:0] wdestReg;
wire [31:0] wr;
wire [31:0] wdo;

datapath dp(clk, pc, ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32, dinstOut, mwreg, mm2reg, mwmem, mdestReg, mr, mq, wwreg,
wm2reg, wdestReg, wr, wdo);

initial begin
clk = 0;
end
always
begin
#5
clk = ~clk;
end

endmodule
