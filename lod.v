`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 12:43:44
// Design Name: 
// Module Name: lod
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


module lod(sum, normalizeAmt, right_shift);
`include "parameters.v"

input [SIG_WIDTH*2+2:0] sum;
output [5:0] normalizeAmt;
output right_shift;

reg [5:0] normalizeAmt;

assign right_shift = sum[SIG_WIDTH*2+2];

always @ (*) begin
      casex(sum)
      {1'b1,{48{1'bx}}}: normalizeAmt=1;
      
      {1'b0, 1'b1,{47{1'bx}}}: normalizeAmt=0;
      {1'b0, 2'b1,{46{1'bx}}}: normalizeAmt=1;
      {1'b0, 3'b1,{45{1'bx}}}: normalizeAmt=2;
      {1'b0, 4'b1,{44{1'bx}}}: normalizeAmt=2+1;
      {1'b0, 5'b1,{43{1'bx}}}: normalizeAmt=3+1;
      {1'b0, 6'b1,{42{1'bx}}}: normalizeAmt=4+1;
      {1'b0, 7'b1,{41{1'bx}}}: normalizeAmt=5+1;
      {1'b0, 8'b1,{40{1'bx}}}: normalizeAmt=6+1;
      {1'b0, 9'b1,{39{1'bx}}}: normalizeAmt=7+1;
      {1'b0, 10'b1,{38{1'bx}}}: normalizeAmt=8+1;
      {1'b0, 11'b1,{37{1'bx}}}: normalizeAmt=9+1;
      {1'b0, 12'b1,{36{1'bx}}}: normalizeAmt=10+1;
      {1'b0, 13'b1,{35{1'bx}}}: normalizeAmt=11+1;
      {1'b0, 14'b1,{34{1'bx}}}: normalizeAmt=12+1;
      {1'b0, 15'b1,{33{1'bx}}}: normalizeAmt=13+1;
      {1'b0, 16'b1,{32{1'bx}}}: normalizeAmt=14+1;
      {1'b0, 17'b1,{31{1'bx}}}: normalizeAmt=15+1;
      {1'b0, 18'b1,{30{1'bx}}}: normalizeAmt=16+1;
      {1'b0, 19'b1,{29{1'bx}}}: normalizeAmt=17+1;
      {1'b0, 20'b1,{28{1'bx}}}: normalizeAmt=18+1;
      {1'b0, 21'b1,{27{1'bx}}}: normalizeAmt=19+1;
      {1'b0, 22'b1,{26{1'bx}}}: normalizeAmt=20+1;
      {1'b0, 23'b1,{25{1'bx}}}: normalizeAmt=21+1;
      {1'b0, 24'b1,{24{1'bx}}}: normalizeAmt=22+1;
      {1'b0, 25'b1,{23{1'bx}}}: normalizeAmt=23+1;
      {1'b0, 26'b1,{22{1'bx}}}: normalizeAmt=24+1;
      {1'b0, 27'b1,{21{1'bx}}}: normalizeAmt=25+1;
      {1'b0, 28'b1,{20{1'bx}}}: normalizeAmt=26+1;
      {1'b0, 29'b1,{19{1'bx}}}: normalizeAmt=27+1;
      {1'b0, 30'b1,{18{1'bx}}}: normalizeAmt=28+1;
      {1'b0, 31'b1,{17{1'bx}}}: normalizeAmt=29+1;
      {1'b0, 32'b1,{16{1'bx}}}: normalizeAmt=30+1;
      {1'b0, 33'b1,{15{1'bx}}}: normalizeAmt=31+1;
      {1'b0, 34'b1,{14{1'bx}}}: normalizeAmt=32+1;
      {1'b0, 35'b1,{13{1'bx}}}: normalizeAmt=33+1;
      {1'b0, 36'b1,{12{1'bx}}}: normalizeAmt=34+1;
      {1'b0, 37'b1,{11{1'bx}}}: normalizeAmt=35+1;
      {1'b0, 38'b1,{10{1'bx}}}: normalizeAmt=36+1;
      {1'b0, 39'b1,{9{1'bx}}}: normalizeAmt=37+1;
      {1'b0, 40'b1,{8{1'bx}}}: normalizeAmt=38+1;
      {1'b0, 41'b1,{7{1'bx}}}: normalizeAmt=39+1;
      {1'b0, 42'b1,{6{1'bx}}}: normalizeAmt=40+1;
      {1'b0, 43'b1,{5{1'bx}}}: normalizeAmt=41+1;
      {1'b0, 44'b1,{4{1'bx}}}: normalizeAmt=42+1;
      {1'b0, 45'b1,{3{1'bx}}}: normalizeAmt=43+1;
      {1'b0, 46'b1,{2{1'bx}}}: normalizeAmt=44+1;
      {1'b0, 47'b1,{1{1'bx}}}: normalizeAmt=45+1;
      49'b1: normalizeAmt=46+1;
    default: normalizeAmt=0;
     endcase
  end


endmodule
