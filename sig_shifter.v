`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 20:08:58
// Design Name: 
// Module Name: sig_shifter
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


module sig_shifter(a_sig, b_sig, aExpIsSmall, shamt, A_SIG, B_SIG);

`include "parameters.v"

input [SIG_WIDTH-1:0] a_sig, b_sig;
input [EXP_WIDTH-1:0] shamt;
input aExpIsSmall;
output [SIG_WIDTH*2+2:0] A_SIG, B_SIG;

assign A_SIG = (aExpIsSmall)?({2'b1, a_sig, {(SIG_WIDTH+1){1'b0}}} >> shamt):{2'b1, a_sig, {(SIG_WIDTH+1){1'b0}}};
assign B_SIG = (aExpIsSmall)?{2'b1, b_sig, {(SIG_WIDTH+1){1'b0}}}:({2'b1, b_sig, {(SIG_WIDTH+1){1'b0}}} >> shamt);


endmodule
