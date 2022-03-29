`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 14:14:34
// Design Name: 
// Module Name: normalize
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


module normalize(prenormalize_pre, normalize_amt, right_shift, rounded);

`include "parameters.v"

input [SIG_WIDTH*2+2:0] prenormalize_pre;
input [5:0] normalize_amt;
input right_shift;

output [SIG_WIDTH-1:0] rounded;

//normalize
wire [SIG_WIDTH*2+2:0] pre_normalized;

assign pre_normalized = right_shift ? prenormalize_pre >> normalize_amt : prenormalize_pre << normalize_amt;

//rounding 
wire G,L,R,T;

assign L = pre_normalized[SIG_WIDTH*2-22];
assign G = pre_normalized[SIG_WIDTH*2-23];
assign R = pre_normalized[SIG_WIDTH*2-24];
assign T = |pre_normalized[SIG_WIDTH*2-25:0];

assign rounded = (G&(T|L|R))?pre_normalized[SIG_WIDTH*2+1:SIG_WIDTH*2-22]+1'b1:pre_normalized[SIG_WIDTH*2+1:SIG_WIDTH*2-22]+1'b0;

endmodule
