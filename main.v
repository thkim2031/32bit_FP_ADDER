`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 10:19:06
// Design Name: 
// Module Name: main
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


module main(A,B,rnd,clk,rst,result);

`include "parameters.v"

input [WIDTH-1:0] A,B;
input [1:0] rnd;
input clk, rst;
output reg [WIDTH-1:0] result;

//special case handeling 
wire aIsPZero, bIsPZero, setResultNaN, setResultPInf, aIsNZero, bIsNZero, setResultNInf;
     
fpSpecialCases fpSpecialCases0(A,B,aIsPZero, aIsNZero, bIsPZero, bIsNZero, setResultNaN, setResultPInf, setResultNInf);

wire setResultZero = (aIsNZero | aIsPZero | bIsNZero |  bIsPZero );   

//unpacking
wire aIsSubnormal, bIsSubnormal;
wire aSign, bSign;
wire [EXP_WIDTH-1:0] aExp, bExp;
wire [SIG_WIDTH-1:0] aSig, bSig;

unpack unpack0(A,B, aIsSubnormal, aSign, aExp, aSig, bIsSubnormal, bSign, bExp, bSig);

//effective operation
wire eop;
assign eop = aSign^bSign;

//temp exponent
wire [EXP_WIDTH-1:0] exp_temp;
wire [EXP_WIDTH-1:0] shamt;
wire aExpIsSmall;

exp_comparison exp_comparison0(aExp, bExp, exp_temp, shamt, aExpIsSmall);

//adjust sig with shifting 
wire [SIG_WIDTH*2+2:0] A_SIG, B_SIG;
sig_shifter sig_shifter0(aSig, bSig, aExpIsSmall, shamt, A_SIG, B_SIG);


//add or sub (sig)
wire [SIG_WIDTH*2+2:0] sum;
adder_eac add_sub(A_SIG, B_SIG, aSign, eop, sum);



//sign
wire Sign;
sign sign0(eop, aSign, bSign, aExpIsSmall, Sign);


//register 
reg [EXP_WIDTH-1:0] expTemp;
reg [SIG_WIDTH*2+2:0] sigTemp;
reg signTemp;

always @(*)begin
//add sign value
signTemp = Sign;
expTemp = exp_temp;
sigTemp = sum;
end

//leading one detection
wire[5:0] normalizeAmt;
wire right_shift;
wire [SIG_WIDTH*2+2:0] prenormalize_pre;
assign prenormalize_pre = sigTemp;

lod lod0(prenormalize_pre, normalizeAmt, right_shift);

//exponent adjust
wire [EXP_WIDTH-1:0] exp_adjust_pre, exp_adjust;

assign exp_adjust_pre = expTemp;
exp_adjust exp_adjust0(exp_adjust_pre, normalizeAmt, right_shift, exp_adjust);


//normalize
wire [SIG_WIDTH-1:0] rounded;
normalize norm_round(prenormalize_pre, normalizeAmt, right_shift, rounded);

//final value///////////////////////////////////////////////////////////////////////////////////////////////////////
wire [WIDTH-1:0] result_pre;
//sign value
assign result_pre[WIDTH-1] = signTemp;


//exponent value
assign result_pre[WIDTH-2:WIDTH-1-EXP_WIDTH] = exp_adjust;

//sig value
assign result_pre[WIDTH-2-EXP_WIDTH:0] = rounded;





//Select result (setResultNaN, setResultPInf, setResultNInf)
always @ (*) begin
    casex({setResultZero, setResultNaN, setResultPInf, setResultNInf})
      4'b1xxx: //Zero 
              result = 0;
      4'b1xx: //NaN
              result = code_NaN;
      4'b01x: //Positive Infinity
              result = code_PINF;
      4'b001: //Negative Infinity
              result = code_NINF;
      default: //computed result 
              result = result_pre;
    endcase
  end





endmodule
