`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/23 15:58:15
// Design Name: 
// Module Name: exp_adjust
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


module exp_adjust(exp_adjust_pre, normalizeAmt, right_shift, exp_adjust);

`include "parameters.v"

input [EXP_WIDTH-1:0] exp_adjust_pre;
input right_shift;
input [5:0] normalizeAmt;
output [EXP_WIDTH-1:0] exp_adjust;

assign exp_adjust = right_shift ? (exp_adjust_pre + normalizeAmt) : exp_adjust_pre - normalizeAmt;

endmodule
