`timescale 1ns / 1ps
module immediate_extender(
input [15:0] imm,
input sext,
output reg [31:0] imm32
);

always@(*)
begin
//slide 60 of the power point 
if(sext == 1)
    begin
         imm32[31:0] = { {16{imm[15]}}, imm[15:0] };
    end 
    else
    begin
        imm32 = { 16'd0, imm[15:0]};
    end
end
endmodule