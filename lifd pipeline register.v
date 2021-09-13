`timescale 1ns / 1ps
module lfid_pipeline_reg(
input [31:0] instOut,
input clk,

input wpcir,
input [31:0] pc4,

output reg [31:0] dinstOut,
output reg [31:0] dpc4
);

always@(posedge clk)
    begin
    if( wpcir == 1)
        begin
            dinstOut = instOut;
            dpc4 = pc4;
        end
    end
endmodule