`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 20:26:03
// Design Name: 
// Module Name: adder_eac
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


module adder_eac(aSig, bSig, aSign, eop, sum);
`include "parameters.v"

input [SIG_WIDTH*2+2:0] aSig, bSig;
input aSign, eop;

output [SIG_WIDTH*2+2:0] sum;

wire [SIG_WIDTH*2+2:0] sub;

assign sub = (aSign&eop) ? (bSig-aSig) : (aSig-bSig);
assign sum = (eop) ? (sub) : (aSig + bSig);


endmodule
