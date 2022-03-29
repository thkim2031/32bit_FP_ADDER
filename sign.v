`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 17:07:24
// Design Name: 
// Module Name: sign
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


module sign(eop, aSign, bSign, aExpIsSmall, Sign);
input eop, aSign, bSign, aExpIsSmall;
output Sign;

assign Sign = eop ? (aExpIsSmall ? bSign : aSign ):aSign;
endmodule
