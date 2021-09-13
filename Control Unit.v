`timescale 1ns / 1ps
module control_unit(
input [5:0] op,
input [5:0] func,

input [4:0] rs,
input [4:0] rt, 
input [4:0] mdestReg, 
input mm2reg,
input mwreg,
input [4:0] edestReg,
input em2reg,
input ewreg,

input rsrtequ,

output reg wreg,
output reg m2reg,
output reg wmem,
output reg [3:0] aluc,
output reg aluimm,
output reg regrt,

output reg [1:0] fwda,
output reg [1:0] fwdb,
output reg wpcir,

output reg jal,
output reg shift,
output reg sext,
output reg [1:0] pcsrc
);

reg regusage;

   initial begin
    pcsrc = 2'b00;
    wreg = 0;
    regusage = 1;
   end
always@(*)
    begin
        case(op)
            6'b000000:
            begin 
                case (func)
                    6'b100000: //add
                    begin
                        wreg = 1'b1; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0001;
                        
                        jal = 1'b0;
                        shift = 1'b0;
                        sext = 1'b1;
                        pcsrc = 2'b00;
                    end
                    6'b100010: //sub
                    begin
                        wreg = 1'b1; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0010;
                        
                        jal = 1'b0;
                        shift = 1'b0;
                        sext = 1'b1;
                        pcsrc = 2'b00;
                    end
                    6'b100100: //and
                    begin
                        wreg = 1'b1; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0011;
                        
                        jal = 1'b0;
                        shift = 1'b0;
                        sext = 1'b1;
                        pcsrc = 2'b00;
                    end
                    6'b100110: //xor
                    begin
                        wreg = 1'b1; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0100;
                        
                        jal = 1'b0;
                        shift = 1'b0;
                        sext = 1'b1;
                        pcsrc = 2'b00;
                    end    
                    6'b100101: //or
                    begin
                        wreg = 1'b1; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0101;
                        
                        jal = 1'b0;
                        shift = 1'b0;
                        sext = 1'b1;
                        pcsrc = 2'b00;
                    end
                    6'b000000: //sll
                    begin
                        wreg = 1'b1; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0110;
                        
                        jal = 1'b0;
                        shift = 1'b1;
                        sext = 1'b1;
                        pcsrc = 2'b00;
                    end
                    6'b000010: //srl
                    begin
                        wreg = 1'b1; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b0111;
                        
                        jal = 1'b0;
                        shift = 1'b1;
                        sext = 1'b1;
                        pcsrc = 2'b00;
                    end
                    6'b000011: //sra
                    begin
                        wreg = 1'b1; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b1000;
                        
                        jal = 1'b0;
                        shift = 1'b1;
                        sext = 1'b1;
                        pcsrc = 2'b00;
                    end
                    6'b001000: //jr
                    begin
                        wreg = 1'b0; 
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = 4'b1001;
                        
                        jal = 1'b0;
                        shift = 1'b0;
                        sext = 1'b1;
                        pcsrc = 2'b10;
                    end
                endcase
            end
            6'b100011: //lw
            begin
                wreg = 1'b1; 
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0001;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b1;
                pcsrc = 2'b00;
            end
            6'b001000: //addi
            begin
                wreg = 1'b1; 
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0001;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b1;
                pcsrc = 2'b00;
            end
            6'b001100: //andi
            begin
                wreg = 1'b1; 
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0011;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b0;
                pcsrc = 2'b00;
            end   
            6'b001101: //ori
            begin
                wreg = 1'b1; 
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0101;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b0;
                pcsrc = 2'b00;
            end    
            6'b001110: //xori
            begin
                wreg = 1'b1; 
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0100;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b0;
                pcsrc = 2'b00;
            end    
            6'b101011: //sw
            begin
                wreg = 1'b0; 
                m2reg = 1'b1;
                wmem = 1'b1;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0001;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b1;
                pcsrc = 2'b00;
            end 
            6'b000100: //beq
            begin
                wreg = 1'b0; 
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0010;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b1;
                if(rsrtequ == 1)
                begin
                    pcsrc = 2'b01;
                end
                else 
                begin
                    pcsrc = 2'b00;
                end     
            end 
            6'b000101: //bne
            begin
                wreg = 1'b0; 
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0010;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b1;
                if(rsrtequ == 0)
                begin
                    pcsrc = 2'b01;
                end
                else 
                begin
                    pcsrc = 2'b00;
                end 
            end 
            6'b001111: //lui
            begin
                wreg = 1'b1; 
                m2reg = 1'b0;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b1001;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b0;
                pcsrc = 2'b00;
            end      
            6'b000010: //j
            begin
                wreg = 1'b0; 
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0001;
                
                jal = 1'b0;
                shift = 1'b0;
                sext = 1'b1;
                pcsrc = 2'b11;
            end
            6'b000011: //jal
            begin
                wreg = 1'b1; 
                m2reg = 1'b0;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = 4'b0001;
                
                jal = 1'b1;
                shift = 1'b0;
                sext = 1'b1;
                pcsrc = 2'b11;
            end
        endcase
    if(ewreg == 1 && em2reg == 1 && edestReg != 0 && regusage == 1 && (edestReg == rs || edestReg == rt))
        begin
            wreg = 0;
            wmem = 0;
            wpcir = 0;
        end
    else
        begin
            wpcir = 1;
        end
    
    if( ewreg == 1 && edestReg != 0 && edestReg == rs && em2reg ==0)
        begin
        fwda = 1;
        end
    else if (mwreg == 1 && mdestReg != 0 && mdestReg == rs && mm2reg == 0) 
        begin
        fwda = 2;
        end
    else if (mwreg ==1 && mdestReg != 0 && mdestReg == rs && mm2reg == 1)
        begin
        fwda = 3;
        end
    else 
        begin
        fwda = 0;
        end
       
    if( ewreg == 1 && edestReg != 0 && edestReg == rt && em2reg ==0)
        begin
        fwdb = 1;
        end
    else if (mwreg == 1 && mdestReg != 0 && mdestReg == rt && mm2reg == 0) 
        begin
        fwdb = 2;
        end
    else if (mwreg ==1 && mdestReg != 0 && mdestReg == rt && mm2reg == 1)
        begin
        fwdb = 3;
        end
    else 
        begin
        fwdb = 0;
        end
end
endmodule