`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 19:53:58
// Design Name: 
// Module Name: exp_comparison
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


module exp_comparison(a_exp, b_exp, exp_temp, shamt, aExpIsSmall);
`include "parameters.v"

input [EXP_WIDTH-1:0] a_exp, b_exp;
output [EXP_WIDTH-1:0] exp_temp;
output [EXP_WIDTH-1:0] shamt;
output aExpIsSmall;
//if we dont need aexpissmall we can remove it

assign aExpIsSmall = (a_exp <= b_exp);
assign shamt = (aExpIsSmall)?(b_exp-a_exp):(a_exp-b_exp);
assign exp_temp = (aExpIsSmall)?(b_exp):(a_exp);

endmodule
