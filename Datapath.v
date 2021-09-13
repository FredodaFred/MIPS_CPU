`timescale 1ns / 1ps

module datapath(
input clk,

output wire [31:0] pc, //idexe output

output wire ewreg,
output wire em2reg,
output wire ewmem,
output wire [3:0] ealuc,
output wire ealuimm,
output wire [4:0] edestReg,
output wire [31:0] eqa,
output wire [31:0] eqb,
output wire [31:0] eimm32,

output wire [31:0] dinstOut, 

//exemem
output wire mwreg,
output wire mm2reg, 
output wire mwmem,
output wire [4:0] mdestReg,
output wire [31:0] mr,
output wire [31:0] mqb,


//memwb
output wire wwreg,
output wire wm2reg,
output wire [4:0] wdestReg,
output wire [31:0] wr,
output wire [31:0] wdo
);

wire [31:0] nextPc;
wire [31:0] instOut;
wire [15:0] imm;
wire [31:0] imm32;
wire [4:0] destReg;
wire [31:0] qa;
wire [31:0] qb;
wire wreg;
wire m2reg;
wire wmem;
wire [3:0] aluc;
wire aluimm;
wire regrt;

wire [31:0] b;
wire [31:0] r; //i think this is the same thing as ealu
wire [31:0] mdo;

wire [31:0] wbData;

wire [1:0] fwda;
wire [1:0] fwdb;
wire wpcir;
wire jal;
wire shift;
wire sext;
wire [1:0] pcsrc;

wire rsrtequ;
wire [31:0] epc8;
wire [31:0] bpc;
wire [31:0] imm18;
wire [31:0] pc4;
wire [31:0] rqa;
wire [31:0] rqb;
wire [31:0] jpc;
wire [31:0] a;
wire [31:0] edestReg0;
wire [31:0] er;
wire  ejal;
wire  eshift;
wire [31:0] epc4;
wire [31:0] dpc4; //ifid out

//connect everything, essentially assembling the datapath
pc_adder nextPCAdder(pc, pc4);
program_counter myPc(nextPc, clk, wpcir, pc);
instruction_memory im(pc, instOut);

lfid_pipeline_reg if_id(instOut, clk, wpcir, pc4, dinstOut, dpc4); //
control_unit control(dinstOut[31:26], dinstOut[5:0], dinstOut[25:21], dinstOut[20:16], mdestReg, mm2reg, mwreg, edestReg, em2reg,
ewreg,  rsrtequ, wreg, m2reg, wmem, aluc, aluimm, regrt, fwda, fwdb, wpcir, jal, shift,sext, pcsrc); //op and func from dinstOut, given week7 slide 24

reg_file registers(dinstOut[25:21], dinstOut[20:16], wdestReg, wbData, wwreg, clk, qa, qb); //rs and rt
regrt_multiplexer mux_r(dinstOut[20:16], dinstOut[15:11], regrt, destReg); //rd and rt
idexe_pipline_reg idexe(wreg, m2reg, wmem, aluc, aluimm, destReg, rqa, rqb, imm32, clk, jal, shift, dpc4, ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg0, eqa, eqb, eimm32, ejal, eshift, epc4);

immediate_extender e(dinstOut[15:0], sext, imm32);

//LAB 4
alu_mux mux_a(eqb, eimm32, ealuimm, b);
alu myalu(a, b, ealuc, r); 
exemem_pipeline_reg exemem(ewreg, em2reg, ewmem, edestReg, er, eqb, clk, mwreg, mm2reg, mwmem, mdestReg, mr, mqb);
data_memory dmem(mr, mqb, mwmem, clk, mdo);
memwb_pipeline_reg memwb(mwreg, mm2reg, mdestReg, mr, mdo, clk, wwreg, wm2reg, wdestReg, wr, wdo);

//LAB 5
wb_mux wbmux(wr, wdo, wm2reg, wbData);

//project
ForwardingMux forwarda(qa, er, mr, mdo, fwda, rqa );
ForwardingMux forwardb(qb, er, mr, mdo, fwdb, rqb);  //rqa is switched with qa from the diagram

basic_adder immadder(imm18, dpc4, bpc); //imm18 comes from a shifte
epc_adder epcAdder(epc4, epc8);
eqaulity_checker eqc(rqa, rqb, rsrtequ);
new_mux1 nextPc_mux(pc4, bpc, rqa, {dpc4[31:28],jpc[27:0]}, pcsrc, nextPc);
new_mux_2 after_exe_mux(eimm32, eqa, eshift, a);
new_mux_3 after_alu_mux(epc8, r, ejal, er); // r = ealu
new_mux_4 f(ejal, edestReg0, edestReg);



bitshifter1 shifter1({4'b0000, dinstOut[25:0]}, jpc); 
bitshifter2 shifter2( {{14{dinstOut[15]}}, dinstOut[15:0]}, imm18);


endmodule