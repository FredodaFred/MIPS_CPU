`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2021 12:23:35 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input [31:0] mr, 
input [31:0] mqb, 
input mwmem,
input clk, 
output reg [31:0] mdo
    );
    reg [31:0] memory [63:0]; 
    integer i;
    
   
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            memory[i] = 0;
        end
        
        memory[5'h14] = 32'h000000a3;  // (50) data[0]   0 +  a3 =  a3
        memory[5'h15] = 32'h00000027;  // (54) data[1]  a3 +  27 =  ca
        memory[5'h16] = 32'h00000079;  // (58) data[2]  ca +  79 = 143
        memory[5'h17] = 32'h00000115;   // (5c) data[3] 143 + 115 = 258
  
    end
    always @(*)
    begin
        mdo = memory[mr[6:2]];
    end
    always @(negedge clk)
    begin
        if(mwmem == 1'b1)
        begin
            memory[mr[6:2]] = mqb;
        end
    end
endmodule
